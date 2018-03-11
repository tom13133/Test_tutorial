gksudo --message "Please input password for connecting Radar" \
       -- ip link set can0 up type can bitrate 500000 \
       -- ip link set can1 up type can bitrate 500000 \
       -- ip link set can2 up type can bitrate 500000 &
cansend can0 4F1#00.00.00.00.00.00.bf.01
cansend can1 4F1#00.00.00.00.00.00.bf.01
cansend can2 4F1#00.00.00.00.00.00.bf.01
rosrun esr_driver esr_can_to_topic_node _esr_can_device_list:=can0,can1,can2
