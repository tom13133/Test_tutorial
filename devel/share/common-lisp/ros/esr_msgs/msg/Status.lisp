; Auto-generated. Do not edit!


(cl:in-package esr_msgs-msg)


;//! \htmlinclude Status.msg.html

(cl:defclass <Status> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (scan_index
    :reader scan_index
    :initarg :scan_index
    :type cl:fixnum
    :initform 0)
   (is_comm_error
    :reader is_comm_error
    :initarg :is_comm_error
    :type cl:boolean
    :initform cl:nil)
   (is_radiating
    :reader is_radiating
    :initarg :is_radiating
    :type cl:boolean
    :initform cl:nil)
   (is_failed
    :reader is_failed
    :initarg :is_failed
    :type cl:boolean
    :initform cl:nil)
   (is_blocked
    :reader is_blocked
    :initarg :is_blocked
    :type cl:boolean
    :initform cl:nil)
   (is_overheating
    :reader is_overheating
    :initarg :is_overheating
    :type cl:boolean
    :initform cl:nil)
   (is_raw_data_mode
    :reader is_raw_data_mode
    :initarg :is_raw_data_mode
    :type cl:boolean
    :initform cl:nil)
   (internal_temperature
    :reader internal_temperature
    :initarg :internal_temperature
    :type cl:fixnum
    :initform 0)
   (sw_version
    :reader sw_version
    :initarg :sw_version
    :type cl:fixnum
    :initform 0)
   (is_lr_enabled
    :reader is_lr_enabled
    :initarg :is_lr_enabled
    :type cl:boolean
    :initform cl:nil)
   (is_mr_enabled
    :reader is_mr_enabled
    :initarg :is_mr_enabled
    :type cl:boolean
    :initform cl:nil)
   (is_sidelobe_blockage
    :reader is_sidelobe_blockage
    :initarg :is_sidelobe_blockage
    :type cl:boolean
    :initform cl:nil)
   (is_partial_blockage
    :reader is_partial_blockage
    :initarg :is_partial_blockage
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Status (<Status>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Status>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Status)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name esr_msgs-msg:<Status> is deprecated: use esr_msgs-msg:Status instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:header-val is deprecated.  Use esr_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'scan_index-val :lambda-list '(m))
(cl:defmethod scan_index-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:scan_index-val is deprecated.  Use esr_msgs-msg:scan_index instead.")
  (scan_index m))

(cl:ensure-generic-function 'is_comm_error-val :lambda-list '(m))
(cl:defmethod is_comm_error-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_comm_error-val is deprecated.  Use esr_msgs-msg:is_comm_error instead.")
  (is_comm_error m))

(cl:ensure-generic-function 'is_radiating-val :lambda-list '(m))
(cl:defmethod is_radiating-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_radiating-val is deprecated.  Use esr_msgs-msg:is_radiating instead.")
  (is_radiating m))

(cl:ensure-generic-function 'is_failed-val :lambda-list '(m))
(cl:defmethod is_failed-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_failed-val is deprecated.  Use esr_msgs-msg:is_failed instead.")
  (is_failed m))

(cl:ensure-generic-function 'is_blocked-val :lambda-list '(m))
(cl:defmethod is_blocked-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_blocked-val is deprecated.  Use esr_msgs-msg:is_blocked instead.")
  (is_blocked m))

(cl:ensure-generic-function 'is_overheating-val :lambda-list '(m))
(cl:defmethod is_overheating-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_overheating-val is deprecated.  Use esr_msgs-msg:is_overheating instead.")
  (is_overheating m))

(cl:ensure-generic-function 'is_raw_data_mode-val :lambda-list '(m))
(cl:defmethod is_raw_data_mode-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_raw_data_mode-val is deprecated.  Use esr_msgs-msg:is_raw_data_mode instead.")
  (is_raw_data_mode m))

(cl:ensure-generic-function 'internal_temperature-val :lambda-list '(m))
(cl:defmethod internal_temperature-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:internal_temperature-val is deprecated.  Use esr_msgs-msg:internal_temperature instead.")
  (internal_temperature m))

(cl:ensure-generic-function 'sw_version-val :lambda-list '(m))
(cl:defmethod sw_version-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:sw_version-val is deprecated.  Use esr_msgs-msg:sw_version instead.")
  (sw_version m))

(cl:ensure-generic-function 'is_lr_enabled-val :lambda-list '(m))
(cl:defmethod is_lr_enabled-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_lr_enabled-val is deprecated.  Use esr_msgs-msg:is_lr_enabled instead.")
  (is_lr_enabled m))

(cl:ensure-generic-function 'is_mr_enabled-val :lambda-list '(m))
(cl:defmethod is_mr_enabled-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_mr_enabled-val is deprecated.  Use esr_msgs-msg:is_mr_enabled instead.")
  (is_mr_enabled m))

(cl:ensure-generic-function 'is_sidelobe_blockage-val :lambda-list '(m))
(cl:defmethod is_sidelobe_blockage-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_sidelobe_blockage-val is deprecated.  Use esr_msgs-msg:is_sidelobe_blockage instead.")
  (is_sidelobe_blockage m))

(cl:ensure-generic-function 'is_partial_blockage-val :lambda-list '(m))
(cl:defmethod is_partial_blockage-val ((m <Status>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader esr_msgs-msg:is_partial_blockage-val is deprecated.  Use esr_msgs-msg:is_partial_blockage instead.")
  (is_partial_blockage m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Status>) ostream)
  "Serializes a message object of type '<Status>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scan_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scan_index)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_comm_error) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_radiating) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_failed) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_blocked) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_overheating) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_raw_data_mode) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'internal_temperature)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sw_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sw_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_lr_enabled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_mr_enabled) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_sidelobe_blockage) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_partial_blockage) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Status>) istream)
  "Deserializes a message object of type '<Status>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'scan_index)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'scan_index)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'is_comm_error) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_radiating) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_failed) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_blocked) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_overheating) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_raw_data_mode) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'internal_temperature) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'sw_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'sw_version)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'is_lr_enabled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_mr_enabled) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_sidelobe_blockage) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'is_partial_blockage) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Status>)))
  "Returns string type for a message object of type '<Status>"
  "esr_msgs/Status")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Status)))
  "Returns string type for a message object of type 'Status"
  "esr_msgs/Status")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Status>)))
  "Returns md5sum for a message object of type '<Status>"
  "3adef9d0d36f7f744fe48eb8f4d08e7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Status)))
  "Returns md5sum for a message object of type 'Status"
  "3adef9d0d36f7f744fe48eb8f4d08e7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Status>)))
  "Returns full string definition for message of type '<Status>"
  (cl:format cl:nil "Header header~%# from 4e0~%uint16 scan_index~%#uint8 dsp_timestamp # in ms~%#float32 vehicle_speed # in m/s~%#float32 vehicle_yaw_rate # in in deg/s~%#float32 vehicle_turning_radius # in m~%#float32 range # cropped between 0..204.7 m~%bool is_comm_error~%# from 4e1~%#uint16 steering_angle_ack # in deg~%bool is_radiating~%bool is_failed~%bool is_blocked~%bool is_overheating~%#uint8 max_tracks_ack # 1..64~%bool is_raw_data_mode~%int8 internal_temperature # in degC~%uint16 sw_version~%#float32 yaw_rate_bias # deg/s~%#float32 veh_spd_comp_factor~%# from 4e3~%bool is_lr_enabled~%bool is_mr_enabled~%bool is_sidelobe_blockage~%bool is_partial_blockage~%#float32 auto_align_angle~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Status)))
  "Returns full string definition for message of type 'Status"
  (cl:format cl:nil "Header header~%# from 4e0~%uint16 scan_index~%#uint8 dsp_timestamp # in ms~%#float32 vehicle_speed # in m/s~%#float32 vehicle_yaw_rate # in in deg/s~%#float32 vehicle_turning_radius # in m~%#float32 range # cropped between 0..204.7 m~%bool is_comm_error~%# from 4e1~%#uint16 steering_angle_ack # in deg~%bool is_radiating~%bool is_failed~%bool is_blocked~%bool is_overheating~%#uint8 max_tracks_ack # 1..64~%bool is_raw_data_mode~%int8 internal_temperature # in degC~%uint16 sw_version~%#float32 yaw_rate_bias # deg/s~%#float32 veh_spd_comp_factor~%# from 4e3~%bool is_lr_enabled~%bool is_mr_enabled~%bool is_sidelobe_blockage~%bool is_partial_blockage~%#float32 auto_align_angle~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Status>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     1
     1
     1
     1
     1
     1
     1
     2
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Status>))
  "Converts a ROS message object to a list"
  (cl:list 'Status
    (cl:cons ':header (header msg))
    (cl:cons ':scan_index (scan_index msg))
    (cl:cons ':is_comm_error (is_comm_error msg))
    (cl:cons ':is_radiating (is_radiating msg))
    (cl:cons ':is_failed (is_failed msg))
    (cl:cons ':is_blocked (is_blocked msg))
    (cl:cons ':is_overheating (is_overheating msg))
    (cl:cons ':is_raw_data_mode (is_raw_data_mode msg))
    (cl:cons ':internal_temperature (internal_temperature msg))
    (cl:cons ':sw_version (sw_version msg))
    (cl:cons ':is_lr_enabled (is_lr_enabled msg))
    (cl:cons ':is_mr_enabled (is_mr_enabled msg))
    (cl:cons ':is_sidelobe_blockage (is_sidelobe_blockage msg))
    (cl:cons ':is_partial_blockage (is_partial_blockage msg))
))
