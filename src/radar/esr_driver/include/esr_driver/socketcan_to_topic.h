/*
 * Copyright (c) 2016, Ivor Wanders
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

#ifndef SOCKETCAN_BRIDGE_SOCKETCAN_TO_TOPIC_H
#define SOCKETCAN_BRIDGE_SOCKETCAN_TO_TOPIC_H

#include <socketcan_interface/socketcan.h>
#include <ros/ros.h>
#include <esr_msgs/Status.h>
#include <esr_msgs/Track.h>
#include <visualization_msgs/Marker.h>
#include <memory>
#include <string>

namespace esr_can
{
class SocketCANToTopic
{
  public:
    SocketCANToTopic(ros::NodeHandle* nh, ros::NodeHandle* nh_param, std::shared_ptr<can::DriverInterface> driver, std::string device_name);
    void setup();

  private:
    ros::Publisher track_topic_;
    esr_msgs::Track track_msg_buf_[64];
    ros::Publisher status_topic_;
    esr_msgs::Status status_msg_buf_;
    ros::Publisher visualization_topic_;
    std::shared_ptr<can::DriverInterface> driver_;

    can::CommInterface::FrameListener::Ptr frame_listener_;
    can::StateInterface::StateListener::Ptr state_listener_;


    void frameCallback(const can::Frame& f);
    void stateCallback(const can::State & s);

    void parseAndPublish(const can::Frame& f);
};

};  // namespace esr_can


#endif  // SOCKETCAN_BRIDGE_SOCKETCAN_TO_TOPIC_H
