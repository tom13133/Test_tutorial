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

#include <ros/ros.h>
#include <esr_driver/socketcan_to_topic.h>
#include <socketcan_interface/threading.h>
#include <socketcan_interface/string.h>
#include <string>
#include <sstream>
#include <iterator>
#include <vector>
#include <memory>

int main(int argc, char *argv[])
{
  ros::init(argc, argv, "esr_can_to_topic_node");

  ros::NodeHandle nh(""), nh_param("~");

  std::string can_device_list;
  nh_param.param<std::string>("esr_can_device_list", can_device_list, ",can0");
  std::stringstream ss(can_device_list);
  std::vector<std::string> can_devices;
  std::string item = "";
  while (std::getline(ss, item, ','))
    if (item.length())
      can_devices.push_back(item);
  std::sort(can_devices.begin(), can_devices.end());
  auto last = std::unique(can_devices.begin(), can_devices.end());
  can_devices.erase(last, can_devices.end());

  std::vector<std::shared_ptr<can::ThreadedSocketCANInterface>> drivers;
  std::vector<std::unique_ptr<esr_can::SocketCANToTopic>> bridges;
  for (auto dev : can_devices)
  {
    std::shared_ptr<can::ThreadedSocketCANInterface> driver = std::make_shared<can::ThreadedSocketCANInterface>();

    if (!driver->init(dev, 0))  // initialize device at can_device, 0 for no loopback.
    {
      ROS_FATAL("Failed to initialize can_device at %s", dev.c_str());
      for (auto dr : drivers)
      {
        dr->shutdown();
        dr.reset();
      }
      return 1;
    }
    else
    {
      ROS_INFO("Successfully connected to %s.", dev.c_str());
    }

    drivers.push_back(driver);
    auto b = std::make_unique<esr_can::SocketCANToTopic>(&nh, &nh_param, driver, dev);
    b->setup();
    bridges.push_back(std::move(b));
  }

  ros::spin();

  for (auto dr : drivers)
  {
    dr->shutdown();
    dr.reset();
  }

  ros::waitForShutdown();
}
