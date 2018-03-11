/*
 * Copyright (c) 2016, Ivor Wanders
 * Copyright (c) 2017, Jimmy Yen
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *   * Neither the name of the copyright holder nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include <esr_driver/socketcan_to_topic.h>
#include <esr_msgs/Status.h>
#include <esr_msgs/Track.h>
#include <socketcan_interface/string.h>
#include <string>
#include <cmath>
#include <algorithm>

namespace esr_can
{
  SocketCANToTopic::SocketCANToTopic(ros::NodeHandle* nh, ros::NodeHandle* nh_param,
      std::shared_ptr<can::DriverInterface> driver, std::string device_name)
    {
      track_topic_ = nh->advertise<esr_msgs::Track>("esr_" + device_name + "_tracks", 10);
      status_topic_ = nh->advertise<esr_msgs::Status>("esr_" + device_name +"_status", 10);
      visualization_topic_ = nh->advertise<visualization_msgs::Marker>("esr_" + device_name + "_visualization", 10);
      driver_ = driver;
    };

  void SocketCANToTopic::setup()
    {
      // register handler for frames and state changes.
      frame_listener_ = driver_->createMsgListener(
              can::CommInterface::FrameDelegate(this, &SocketCANToTopic::frameCallback));

      state_listener_ = driver_->createStateListener(
              can::StateInterface::StateDelegate(this, &SocketCANToTopic::stateCallback));
    };

  void SocketCANToTopic::frameCallback(const can::Frame& f)
    {
      // ROS_DEBUG("Message came in: %s", can::tostring(f, true).c_str());
      can::Frame frame = f;  // copy the frame first, cannot call isValid() on const.
      if (!frame.isValid())
      {
        ROS_ERROR("Invalid frame from SocketCAN: id: %#04x, length: %d, is_extended: %d, is_error: %d, is_rtr: %d",
                  f.id, f.dlc, f.is_extended, f.is_error, f.is_rtr);
        return;
      }
      else
      {
        if (f.is_error)
        {
          // can::tostring cannot be used for dlc > 8 frames. It causes an crash
          // due to usage of boost::array for the data array. The should always work.
          ROS_WARN("Received frame is error: %s", can::tostring(f, true).c_str());
        }
      }

      parseAndPublish(frame);
    };

  void SocketCANToTopic::parseAndPublish(const can::Frame &f)
    {
      if (f.id == 0x4e0) // status0
      {
        esr_msgs::Status msg;
        msg.header.frame_id = "";  // no frame
        msg.header.stamp = ros::Time::now(); // FIXME: not guaranteed to be accurate
        //msg.dsp_timestamp = uint8_t(((f.data[0] & 0x3f) << 1) | ((f.data[1] & 0x80) >> 7)) << 1;
        msg.is_comm_error = ((f.data[1] & 0x40) >> 6);
        //msg.vehicle_turning_radius = (int16_t(((((f.data[1] & 0x3f) << 8) | f.data[2])) << 2) >> 2);
        msg.scan_index = ((f.data[3] << 8) | f.data[4]);
        //msg.vehicle_yaw_rate = 0.625f * (int16_t(((f.data[5] << 4) | ((f.data[6] & 0xf0) >> 4)) << 4) >> 4);
        //msg.vehicle_speed = 0.0625f * (((f.data[6] & 0x07) << 8) | f.data[7]);
        status_msg_buf_ = msg; // Hold message until it's complete
      }
      else if (f.id == 0x4e1) // status1 (partial implementation)
      {
        esr_msgs::Status msg = status_msg_buf_;
        ros::Duration t = ros::Time::now() - msg.header.stamp;
        if (t.sec > 0 || t.nsec > 100000000)
          // drop message if the current partial one on hold is too old (> 0.1 seconds)
          return;
        msg.is_overheating = ((f.data[1] & 0x80) >> 7);
        msg.is_blocked = ((f.data[1] & 0x40) >> 6);
        msg.is_failed = ((f.data[1] & 0x20) >> 5);
        msg.is_radiating = ((f.data[1] & 0x10) >> 4);
        msg.is_raw_data_mode = ((f.data[1] & 0x08) >> 3);
        msg.internal_temperature = int8_t(f.data[3]);
        msg.sw_version = ((f.data[6] << 8) | f.data[7]);
        status_msg_buf_ = msg; // Hold message until it's complete
      }
      else if (f.id == 0x4e3) // status3 (partial implementation)
      {
        esr_msgs::Status msg = status_msg_buf_;
        ros::Duration t = ros::Time::now() - msg.header.stamp;
        if (t.sec > 0 || t.nsec > 100000000)
          // drop message if the current partial one on hold is too old (> 0.1 seconds)
          return;
        msg.is_lr_enabled = ((f.data[0] & 0x08) >> 3);
        msg.is_mr_enabled = ((f.data[0] & 0x04) >> 2);
        msg.is_sidelobe_blockage = ((f.data[0] & 0x20) >> 5);
        msg.is_partial_blockage = ((f.data[0] & 0x10) >> 4);
        status_topic_.publish(msg);

        visualization_msgs::Marker marker;
        marker.header.frame_id = "esr_frame";
        marker.header.stamp = msg.header.stamp;
        marker.ns = "self";
        marker.id = 0;
        marker.type = visualization_msgs::Marker::CUBE;
        marker.action = visualization_msgs::Marker::ADD;
        marker.lifetime = ros::Duration(0, 50000000); // 0.05 seconds
        marker.pose.position.x = 0.0;
        marker.pose.position.y = 0.0;
        marker.pose.position.z = 0.0;
        marker.pose.orientation.x = 0.0;
        marker.pose.orientation.y = 0.0;
        marker.pose.orientation.z = 0.0;
        marker.pose.orientation.w = 1.0;
        marker.scale.x = 0.05;
        marker.scale.y = 0.17;
        marker.scale.z = 0.09;
        marker.color.r = 1.f;
        marker.color.g = 1.f;
        marker.color.b = 1.f;
        marker.color.a = 1.f;
        visualization_topic_.publish(marker);
      }
      else if (f.id >= 0x500 && f.id <= 0x53f) // track
      {
        unsigned char status = ((f.data[1] & 0xf0) >> 5);
        if (status < 2 || status > 3) return; // only report targets with updates (actual observations)
        //if (status < 1) return;
        ROS_WARN_COND(f.dlc != 8, "Track message frame too short! (%d bytes)", f.dlc);
        esr_msgs::Track msg;
        msg.header.frame_id = "";  // no frame
        msg.header.stamp = ros::Time::now();
        if ((msg.header.stamp - status_msg_buf_.header.stamp).sec == 0)
          // sync timestamps within the same scan
          msg.header.stamp = status_msg_buf_.header.stamp;
        msg.index = f.id - 0x500; // 0..63
        msg.lateral_rate = 0.25f * (int8_t((f.data[0] & 0xfc) << 2) >> 2);
        //msg.is_grouping_changed = ((f.data[0] & 0x02) >> 1);
        //msg.is_oncoming = f.data[0] & 0x01;
        msg.status = ((f.data[1] & 0xe0) >> 5);
        msg.azimuth = -0.1f * (int16_t((((f.data[1] & 0x1f) << 5) | ((f.data[2] & 0xf8) >> 3)) << 6) >> 6);
        msg.range = 0.1f * (((f.data[2] & 0x07) << 8) | f.data[3]);
        if (msg.range == 0) // invalid track
            return;
        //msg.is_bridge = ((f.data[4] & 0x80) >> 7);
        msg.width = 0.5f * ((f.data[4] & 0x3c) >> 2);
        msg.range_accl = 0.05f * (int16_t((((f.data[4] & 0x03) << 8) | f.data[5]) << 6) >> 6);
        msg.is_lr_update = ((f.data[6] & 0x80) >> 7);
        msg.is_mr_update = ((f.data[6] & 0x40) >> 6);
        msg.range_rate = 0.01f * (int16_t((((f.data[6] & 0x3f) << 8) | f.data[7]) << 2) >> 2);
        track_msg_buf_[msg.index] = msg;
      }
      else if (f.id == 0x540) // track status
      {
        int start = (f.data[0] & 0x0f) * 7;
        for (int idx = 0; idx < 7 && idx + start < 64; idx++)
        {
          esr_msgs::Track msg = track_msg_buf_[start + idx];
          if (msg.header.stamp == status_msg_buf_.header.stamp)
          {
            msg.amplitude = (f.data[1+idx] & 0x1f) - 10;
            track_topic_.publish(msg);

            visualization_msgs::Marker marker;
            marker.header.frame_id = "/esr_frame";
            marker.header.stamp = msg.header.stamp;
            marker.ns = "track";
            marker.id = msg.index;
            marker.type = visualization_msgs::Marker::CYLINDER;
            marker.action = visualization_msgs::Marker::ADD;
            marker.lifetime = ros::Duration(0, 50000000); // 0.05 seconds
            double r = msg.azimuth * M_PI / 180;
            marker.pose.position.x = msg.range * std::cos(r);
            marker.pose.position.y = msg.range * std::sin(r);
            marker.pose.position.z = 0.0;
            marker.pose.orientation.x = 0.0;
            marker.pose.orientation.y = 0.0;
            marker.pose.orientation.z = 0.0;
            marker.pose.orientation.w = 1.0;
            marker.scale.x = 1.0;
            marker.scale.y = 1.0;
            marker.scale.z = 1.0;

            float ratio = 2.f * (msg.amplitude + 10) / 31.f;
            marker.color.r = std::max(0.f, ratio - 1.f);
            marker.color.b = std::max(0.f, 1.f - ratio);
            marker.color.g = 1.f - marker.color.r - marker.color.b;
            marker.color.a = 1.f;
            visualization_topic_.publish(marker);
          }
        }
      }
    };

  void SocketCANToTopic::stateCallback(const can::State & s)
    {
      std::string err;
      driver_->translateError(s.internal_error, err);
      if (!s.internal_error)
      {
        ROS_INFO("State: %s, asio: %s", err.c_str(), s.error_code.message().c_str());
      }
      else
      {
        ROS_ERROR("Error: %s, asio: %s", err.c_str(), s.error_code.message().c_str());
      }
    };
};  // namespace esr_can
