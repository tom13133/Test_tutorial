#include<string>
#include<ros/ros.h>
#include<sensor_msgs/JointState.h>
#include<tf/transform_broadcaster.h>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "state_publisher");
    ros::NodeHandle nh;
    ros::Publisher joint_pub = nh.advertise<sensor_msgs::JointState>("joint_states",1);
    tf::TransformBroadcaster br;
    ros::Rate loop_rate(10);

    const double degree = M_PI/180;
    double tilt=0, tinc=degree, swivel=0, angle=0, height=0, hinc=0.005;

    geometry_msgs::TransformStamped odom_trans;
    sensor_msgs::JointState joint_state;
    odom_trans.header.frame_id = "odom";
    odom_trans.child_frame_id = "axis";

    while(ros::ok())
    {
        joint_state.header.stamp = ros::Time::now();
        joint_state.name.resize(3);
        joint_state.position.resize(3);
        joint_state.name[0] ="swivel";
        joint_state.position[0] = swivel;
        joint_state.name[1] ="tilt";
        joint_state.position[1] = tilt;
        joint_state.name[2] ="periscope";
        joint_state.position[2] = height;

        odom_trans.header.stamp = ros::Time::now();
        odom_trans.transform.translation.x = cos(angle)*2;
        odom_trans.transform.translation.y = sin(angle)*2;
        odom_trans.transform.translation.z = .7;
        odom_trans.transform.rotation = tf::createQuaternionMsgFromYaw(angle+M_PI/2);

        joint_pub.publish(joint_state);
        br.sendTransform(odom_trans);

        tilt += tinc;
        if (tilt<-.5 || tilt>0) tinc *= -1;
        height += hinc;
        if (height>.2 || height<0) hinc *= -1;
        swivel += degree;
        angle += degree/4;
	
        loop_rate.sleep();
    }
    return 0;
}
