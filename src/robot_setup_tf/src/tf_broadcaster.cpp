#include<ros/ros.h>
#include<tf/transform_broadcaster.h>

int main(int argc, char** argv)
{
    ros::init(argc,argv,"robot_tf_publisher");
    ros::NodeHandle nh;
    ros::Rate r(100);

    tf::TransformBroadcaster br;

    while(nh.ok())
    {
        br.sendTransform( tf::StampedTransform( tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.1, 0.2, 0.3))
                                              , ros::Time::now(), "base_link", "base_laser") );
        r.sleep();
    }

}
