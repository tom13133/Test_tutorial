;; Auto-generated. Do not edit!


(when (boundp 'esr_msgs::Status)
  (if (not (find-package "ESR_MSGS"))
    (make-package "ESR_MSGS"))
  (shadow 'Status (find-package "ESR_MSGS")))
(unless (find-package "ESR_MSGS::STATUS")
  (make-package "ESR_MSGS::STATUS"))

(in-package "ROS")
;;//! \htmlinclude Status.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass esr_msgs::Status
  :super ros::object
  :slots (_header _scan_index _is_comm_error _is_radiating _is_failed _is_blocked _is_overheating _is_raw_data_mode _internal_temperature _sw_version _is_lr_enabled _is_mr_enabled _is_sidelobe_blockage _is_partial_blockage ))

(defmethod esr_msgs::Status
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:scan_index __scan_index) 0)
    ((:is_comm_error __is_comm_error) nil)
    ((:is_radiating __is_radiating) nil)
    ((:is_failed __is_failed) nil)
    ((:is_blocked __is_blocked) nil)
    ((:is_overheating __is_overheating) nil)
    ((:is_raw_data_mode __is_raw_data_mode) nil)
    ((:internal_temperature __internal_temperature) 0)
    ((:sw_version __sw_version) 0)
    ((:is_lr_enabled __is_lr_enabled) nil)
    ((:is_mr_enabled __is_mr_enabled) nil)
    ((:is_sidelobe_blockage __is_sidelobe_blockage) nil)
    ((:is_partial_blockage __is_partial_blockage) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _scan_index (round __scan_index))
   (setq _is_comm_error __is_comm_error)
   (setq _is_radiating __is_radiating)
   (setq _is_failed __is_failed)
   (setq _is_blocked __is_blocked)
   (setq _is_overheating __is_overheating)
   (setq _is_raw_data_mode __is_raw_data_mode)
   (setq _internal_temperature (round __internal_temperature))
   (setq _sw_version (round __sw_version))
   (setq _is_lr_enabled __is_lr_enabled)
   (setq _is_mr_enabled __is_mr_enabled)
   (setq _is_sidelobe_blockage __is_sidelobe_blockage)
   (setq _is_partial_blockage __is_partial_blockage)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:scan_index
   (&optional __scan_index)
   (if __scan_index (setq _scan_index __scan_index)) _scan_index)
  (:is_comm_error
   (&optional __is_comm_error)
   (if __is_comm_error (setq _is_comm_error __is_comm_error)) _is_comm_error)
  (:is_radiating
   (&optional __is_radiating)
   (if __is_radiating (setq _is_radiating __is_radiating)) _is_radiating)
  (:is_failed
   (&optional __is_failed)
   (if __is_failed (setq _is_failed __is_failed)) _is_failed)
  (:is_blocked
   (&optional __is_blocked)
   (if __is_blocked (setq _is_blocked __is_blocked)) _is_blocked)
  (:is_overheating
   (&optional __is_overheating)
   (if __is_overheating (setq _is_overheating __is_overheating)) _is_overheating)
  (:is_raw_data_mode
   (&optional __is_raw_data_mode)
   (if __is_raw_data_mode (setq _is_raw_data_mode __is_raw_data_mode)) _is_raw_data_mode)
  (:internal_temperature
   (&optional __internal_temperature)
   (if __internal_temperature (setq _internal_temperature __internal_temperature)) _internal_temperature)
  (:sw_version
   (&optional __sw_version)
   (if __sw_version (setq _sw_version __sw_version)) _sw_version)
  (:is_lr_enabled
   (&optional __is_lr_enabled)
   (if __is_lr_enabled (setq _is_lr_enabled __is_lr_enabled)) _is_lr_enabled)
  (:is_mr_enabled
   (&optional __is_mr_enabled)
   (if __is_mr_enabled (setq _is_mr_enabled __is_mr_enabled)) _is_mr_enabled)
  (:is_sidelobe_blockage
   (&optional __is_sidelobe_blockage)
   (if __is_sidelobe_blockage (setq _is_sidelobe_blockage __is_sidelobe_blockage)) _is_sidelobe_blockage)
  (:is_partial_blockage
   (&optional __is_partial_blockage)
   (if __is_partial_blockage (setq _is_partial_blockage __is_partial_blockage)) _is_partial_blockage)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _scan_index
    2
    ;; bool _is_comm_error
    1
    ;; bool _is_radiating
    1
    ;; bool _is_failed
    1
    ;; bool _is_blocked
    1
    ;; bool _is_overheating
    1
    ;; bool _is_raw_data_mode
    1
    ;; int8 _internal_temperature
    1
    ;; uint16 _sw_version
    2
    ;; bool _is_lr_enabled
    1
    ;; bool _is_mr_enabled
    1
    ;; bool _is_sidelobe_blockage
    1
    ;; bool _is_partial_blockage
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _scan_index
       (write-word _scan_index s)
     ;; bool _is_comm_error
       (if _is_comm_error (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_radiating
       (if _is_radiating (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_failed
       (if _is_failed (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_blocked
       (if _is_blocked (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_overheating
       (if _is_overheating (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_raw_data_mode
       (if _is_raw_data_mode (write-byte -1 s) (write-byte 0 s))
     ;; int8 _internal_temperature
       (write-byte _internal_temperature s)
     ;; uint16 _sw_version
       (write-word _sw_version s)
     ;; bool _is_lr_enabled
       (if _is_lr_enabled (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_mr_enabled
       (if _is_mr_enabled (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_sidelobe_blockage
       (if _is_sidelobe_blockage (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_partial_blockage
       (if _is_partial_blockage (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _scan_index
     (setq _scan_index (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _is_comm_error
     (setq _is_comm_error (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_radiating
     (setq _is_radiating (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_failed
     (setq _is_failed (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_blocked
     (setq _is_blocked (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_overheating
     (setq _is_overheating (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_raw_data_mode
     (setq _is_raw_data_mode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; int8 _internal_temperature
     (setq _internal_temperature (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _internal_temperature 127) (setq _internal_temperature (- _internal_temperature 256)))
   ;; uint16 _sw_version
     (setq _sw_version (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; bool _is_lr_enabled
     (setq _is_lr_enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_mr_enabled
     (setq _is_mr_enabled (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_sidelobe_blockage
     (setq _is_sidelobe_blockage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_partial_blockage
     (setq _is_partial_blockage (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get esr_msgs::Status :md5sum-) "3adef9d0d36f7f744fe48eb8f4d08e7a")
(setf (get esr_msgs::Status :datatype-) "esr_msgs/Status")
(setf (get esr_msgs::Status :definition-)
      "Header header
# from 4e0
uint16 scan_index
#uint8 dsp_timestamp # in ms
#float32 vehicle_speed # in m/s
#float32 vehicle_yaw_rate # in in deg/s
#float32 vehicle_turning_radius # in m
#float32 range # cropped between 0..204.7 m
bool is_comm_error
# from 4e1
#uint16 steering_angle_ack # in deg
bool is_radiating
bool is_failed
bool is_blocked
bool is_overheating
#uint8 max_tracks_ack # 1..64
bool is_raw_data_mode
int8 internal_temperature # in degC
uint16 sw_version
#float32 yaw_rate_bias # deg/s
#float32 veh_spd_comp_factor
# from 4e3
bool is_lr_enabled
bool is_mr_enabled
bool is_sidelobe_blockage
bool is_partial_blockage
#float32 auto_align_angle

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



(provide :esr_msgs/Status "3adef9d0d36f7f744fe48eb8f4d08e7a")


