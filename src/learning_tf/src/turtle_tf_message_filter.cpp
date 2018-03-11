#include<ros/ros.h>
#include<tf/transform_listener.h>
#include<tf/message_filter.h>
#include "message_filters/subscriber.h"

class PoseDrawer
{
    public:
        PoseDrawer():tf_(), target_frame_("turtle1")
        {
            point_sub_.subscribe(nh,"turtle_point_stamped",10);
            tf_filter_= new tf::MessageFilter<geometry_msgs::PointStamped>(point_sub_, tf_, target_frame_, 10);
            tf_filter_->registerCallback(boost::bind(&PoseDrawer::msgCallback, this, _1));
        }
    private:
        message_filters::Subscriber<geometry_msgs::PointStamped> point_sub_;
        tf::TransformListener tf_;
        tf::MessageFilter<geometry_msgs::PointStamped>* tf_filter_;
        ros::NodeHandle nh;
        std::string target_frame_; 

    void msgCallback(const boost::shared_ptr<const geometry_msgs::PointStamped>& point_ptr)
    {
        geometry_msgs::PointStamped point_out;
        try{
            tf_.transformPoint(target_frame_, *point_ptr, point_out);

            printf("point of turtle 3 in frame of turtle 1 Position(x:%f y:%f z:%f)\n",
                   point_out.point.x, point_out.point.y, point_out.point.z);
        }
        catch(tf::TransformException &ex){
            printf("Failure %s\n" ,ex.what());

        }
    };
        

};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "pose_drawer");
    PoseDrawer pd;
    ros::spin();

}
