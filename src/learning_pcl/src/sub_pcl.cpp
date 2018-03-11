#include<ros/ros.h>
#include<pcl_ros/point_cloud.h>
#include<pcl/point_types.h>
#include<boost/foreach.hpp>

typedef pcl::PointCloud<pcl::PointXYZ> PointCloud;
void cb(const PointCloud::ConstPtr& msg)
{
    printf("width=%d , height=%d\n",msg->width, msg->height);
    BOOST_FOREACH(const pcl::PointXYZ& pt, msg->points)
    printf("(%f,%f,%f)\n",pt.x,pt.y,pt.z);
}


int main(int argc, char** argv)
{
    ros::init(argc,argv, "sub_pcl");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("point2",1,cb);
    ros::spin();

}
