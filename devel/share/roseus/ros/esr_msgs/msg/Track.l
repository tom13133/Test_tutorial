;; Auto-generated. Do not edit!


(when (boundp 'esr_msgs::Track)
  (if (not (find-package "ESR_MSGS"))
    (make-package "ESR_MSGS"))
  (shadow 'Track (find-package "ESR_MSGS")))
(unless (find-package "ESR_MSGS::TRACK")
  (make-package "ESR_MSGS::TRACK"))

(in-package "ROS")
;;//! \htmlinclude Track.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass esr_msgs::Track
  :super ros::object
  :slots (_header _status _index _range _range_rate _range_accl _azimuth _lateral_rate _width _is_mr_update _is_lr_update _amplitude ))

(defmethod esr_msgs::Track
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:status __status) 0)
    ((:index __index) 0)
    ((:range __range) 0.0)
    ((:range_rate __range_rate) 0.0)
    ((:range_accl __range_accl) 0.0)
    ((:azimuth __azimuth) 0.0)
    ((:lateral_rate __lateral_rate) 0.0)
    ((:width __width) 0.0)
    ((:is_mr_update __is_mr_update) nil)
    ((:is_lr_update __is_lr_update) nil)
    ((:amplitude __amplitude) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _status (round __status))
   (setq _index (round __index))
   (setq _range (float __range))
   (setq _range_rate (float __range_rate))
   (setq _range_accl (float __range_accl))
   (setq _azimuth (float __azimuth))
   (setq _lateral_rate (float __lateral_rate))
   (setq _width (float __width))
   (setq _is_mr_update __is_mr_update)
   (setq _is_lr_update __is_lr_update)
   (setq _amplitude (round __amplitude))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:range_rate
   (&optional __range_rate)
   (if __range_rate (setq _range_rate __range_rate)) _range_rate)
  (:range_accl
   (&optional __range_accl)
   (if __range_accl (setq _range_accl __range_accl)) _range_accl)
  (:azimuth
   (&optional __azimuth)
   (if __azimuth (setq _azimuth __azimuth)) _azimuth)
  (:lateral_rate
   (&optional __lateral_rate)
   (if __lateral_rate (setq _lateral_rate __lateral_rate)) _lateral_rate)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:is_mr_update
   (&optional __is_mr_update)
   (if __is_mr_update (setq _is_mr_update __is_mr_update)) _is_mr_update)
  (:is_lr_update
   (&optional __is_lr_update)
   (if __is_lr_update (setq _is_lr_update __is_lr_update)) _is_lr_update)
  (:amplitude
   (&optional __amplitude)
   (if __amplitude (setq _amplitude __amplitude)) _amplitude)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _status
    1
    ;; uint8 _index
    1
    ;; float32 _range
    4
    ;; float32 _range_rate
    4
    ;; float32 _range_accl
    4
    ;; float32 _azimuth
    4
    ;; float32 _lateral_rate
    4
    ;; float32 _width
    4
    ;; bool _is_mr_update
    1
    ;; bool _is_lr_update
    1
    ;; int8 _amplitude
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _status
       (write-byte _status s)
     ;; uint8 _index
       (write-byte _index s)
     ;; float32 _range
       (sys::poke _range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _range_rate
       (sys::poke _range_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _range_accl
       (sys::poke _range_accl (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _azimuth
       (sys::poke _azimuth (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _lateral_rate
       (sys::poke _lateral_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _width
       (sys::poke _width (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _is_mr_update
       (if _is_mr_update (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_lr_update
       (if _is_lr_update (write-byte -1 s) (write-byte 0 s))
     ;; int8 _amplitude
       (write-byte _amplitude s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _index
     (setq _index (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _range
     (setq _range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _range_rate
     (setq _range_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _range_accl
     (setq _range_accl (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _azimuth
     (setq _azimuth (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _lateral_rate
     (setq _lateral_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _width
     (setq _width (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _is_mr_update
     (setq _is_mr_update (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_lr_update
     (setq _is_lr_update (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _amplitude
     (setq _amplitude (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _amplitude 127) (setq _amplitude (- _amplitude 256)))
   ;;
   self)
  )

(setf (get esr_msgs::Track :md5sum-) "b8be915c8c9061bba3ebae89845e593a")
(setf (get esr_msgs::Track :datatype-) "esr_msgs/Track")
(setf (get esr_msgs::Track :definition-)
      "Header header
uint8 status # 0: no target 1: new 2: new updated 3: updated 4: coasted 5: merged 6: invalid coasted 7: new coasted
uint8 index # 1..64
float32 range # cropped between 0..204.7 m
float32 range_rate # cropped between -81.92..81.91m/s
float32 range_accl # cropped between -25.6..25.55 m/s^2
float32 azimuth # cropped between -51.2..51.1 deg
float32 lateral_rate # cropped between -8..7.75 m/s
float32 width # cropped between 0..7.5 m
bool is_mr_update
bool is_lr_update
#bool is_oncoming
#bool is_bridge
#bool is_grouping_changed
int8 amplitude # cropped to -10..21dB

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :esr_msgs/Track "b8be915c8c9061bba3ebae89845e593a")


