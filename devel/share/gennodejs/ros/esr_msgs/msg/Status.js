// Auto-generated. Do not edit!

// (in-package esr_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.scan_index = null;
      this.is_comm_error = null;
      this.is_radiating = null;
      this.is_failed = null;
      this.is_blocked = null;
      this.is_overheating = null;
      this.is_raw_data_mode = null;
      this.internal_temperature = null;
      this.sw_version = null;
      this.is_lr_enabled = null;
      this.is_mr_enabled = null;
      this.is_sidelobe_blockage = null;
      this.is_partial_blockage = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('scan_index')) {
        this.scan_index = initObj.scan_index
      }
      else {
        this.scan_index = 0;
      }
      if (initObj.hasOwnProperty('is_comm_error')) {
        this.is_comm_error = initObj.is_comm_error
      }
      else {
        this.is_comm_error = false;
      }
      if (initObj.hasOwnProperty('is_radiating')) {
        this.is_radiating = initObj.is_radiating
      }
      else {
        this.is_radiating = false;
      }
      if (initObj.hasOwnProperty('is_failed')) {
        this.is_failed = initObj.is_failed
      }
      else {
        this.is_failed = false;
      }
      if (initObj.hasOwnProperty('is_blocked')) {
        this.is_blocked = initObj.is_blocked
      }
      else {
        this.is_blocked = false;
      }
      if (initObj.hasOwnProperty('is_overheating')) {
        this.is_overheating = initObj.is_overheating
      }
      else {
        this.is_overheating = false;
      }
      if (initObj.hasOwnProperty('is_raw_data_mode')) {
        this.is_raw_data_mode = initObj.is_raw_data_mode
      }
      else {
        this.is_raw_data_mode = false;
      }
      if (initObj.hasOwnProperty('internal_temperature')) {
        this.internal_temperature = initObj.internal_temperature
      }
      else {
        this.internal_temperature = 0;
      }
      if (initObj.hasOwnProperty('sw_version')) {
        this.sw_version = initObj.sw_version
      }
      else {
        this.sw_version = 0;
      }
      if (initObj.hasOwnProperty('is_lr_enabled')) {
        this.is_lr_enabled = initObj.is_lr_enabled
      }
      else {
        this.is_lr_enabled = false;
      }
      if (initObj.hasOwnProperty('is_mr_enabled')) {
        this.is_mr_enabled = initObj.is_mr_enabled
      }
      else {
        this.is_mr_enabled = false;
      }
      if (initObj.hasOwnProperty('is_sidelobe_blockage')) {
        this.is_sidelobe_blockage = initObj.is_sidelobe_blockage
      }
      else {
        this.is_sidelobe_blockage = false;
      }
      if (initObj.hasOwnProperty('is_partial_blockage')) {
        this.is_partial_blockage = initObj.is_partial_blockage
      }
      else {
        this.is_partial_blockage = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Status
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [scan_index]
    bufferOffset = _serializer.uint16(obj.scan_index, buffer, bufferOffset);
    // Serialize message field [is_comm_error]
    bufferOffset = _serializer.bool(obj.is_comm_error, buffer, bufferOffset);
    // Serialize message field [is_radiating]
    bufferOffset = _serializer.bool(obj.is_radiating, buffer, bufferOffset);
    // Serialize message field [is_failed]
    bufferOffset = _serializer.bool(obj.is_failed, buffer, bufferOffset);
    // Serialize message field [is_blocked]
    bufferOffset = _serializer.bool(obj.is_blocked, buffer, bufferOffset);
    // Serialize message field [is_overheating]
    bufferOffset = _serializer.bool(obj.is_overheating, buffer, bufferOffset);
    // Serialize message field [is_raw_data_mode]
    bufferOffset = _serializer.bool(obj.is_raw_data_mode, buffer, bufferOffset);
    // Serialize message field [internal_temperature]
    bufferOffset = _serializer.int8(obj.internal_temperature, buffer, bufferOffset);
    // Serialize message field [sw_version]
    bufferOffset = _serializer.uint16(obj.sw_version, buffer, bufferOffset);
    // Serialize message field [is_lr_enabled]
    bufferOffset = _serializer.bool(obj.is_lr_enabled, buffer, bufferOffset);
    // Serialize message field [is_mr_enabled]
    bufferOffset = _serializer.bool(obj.is_mr_enabled, buffer, bufferOffset);
    // Serialize message field [is_sidelobe_blockage]
    bufferOffset = _serializer.bool(obj.is_sidelobe_blockage, buffer, bufferOffset);
    // Serialize message field [is_partial_blockage]
    bufferOffset = _serializer.bool(obj.is_partial_blockage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Status
    let len;
    let data = new Status(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [scan_index]
    data.scan_index = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [is_comm_error]
    data.is_comm_error = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_radiating]
    data.is_radiating = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_failed]
    data.is_failed = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_blocked]
    data.is_blocked = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_overheating]
    data.is_overheating = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_raw_data_mode]
    data.is_raw_data_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [internal_temperature]
    data.internal_temperature = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [sw_version]
    data.sw_version = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [is_lr_enabled]
    data.is_lr_enabled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_mr_enabled]
    data.is_mr_enabled = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_sidelobe_blockage]
    data.is_sidelobe_blockage = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_partial_blockage]
    data.is_partial_blockage = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 15;
  }

  static datatype() {
    // Returns string type for a message object
    return 'esr_msgs/Status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3adef9d0d36f7f744fe48eb8f4d08e7a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Status(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.scan_index !== undefined) {
      resolved.scan_index = msg.scan_index;
    }
    else {
      resolved.scan_index = 0
    }

    if (msg.is_comm_error !== undefined) {
      resolved.is_comm_error = msg.is_comm_error;
    }
    else {
      resolved.is_comm_error = false
    }

    if (msg.is_radiating !== undefined) {
      resolved.is_radiating = msg.is_radiating;
    }
    else {
      resolved.is_radiating = false
    }

    if (msg.is_failed !== undefined) {
      resolved.is_failed = msg.is_failed;
    }
    else {
      resolved.is_failed = false
    }

    if (msg.is_blocked !== undefined) {
      resolved.is_blocked = msg.is_blocked;
    }
    else {
      resolved.is_blocked = false
    }

    if (msg.is_overheating !== undefined) {
      resolved.is_overheating = msg.is_overheating;
    }
    else {
      resolved.is_overheating = false
    }

    if (msg.is_raw_data_mode !== undefined) {
      resolved.is_raw_data_mode = msg.is_raw_data_mode;
    }
    else {
      resolved.is_raw_data_mode = false
    }

    if (msg.internal_temperature !== undefined) {
      resolved.internal_temperature = msg.internal_temperature;
    }
    else {
      resolved.internal_temperature = 0
    }

    if (msg.sw_version !== undefined) {
      resolved.sw_version = msg.sw_version;
    }
    else {
      resolved.sw_version = 0
    }

    if (msg.is_lr_enabled !== undefined) {
      resolved.is_lr_enabled = msg.is_lr_enabled;
    }
    else {
      resolved.is_lr_enabled = false
    }

    if (msg.is_mr_enabled !== undefined) {
      resolved.is_mr_enabled = msg.is_mr_enabled;
    }
    else {
      resolved.is_mr_enabled = false
    }

    if (msg.is_sidelobe_blockage !== undefined) {
      resolved.is_sidelobe_blockage = msg.is_sidelobe_blockage;
    }
    else {
      resolved.is_sidelobe_blockage = false
    }

    if (msg.is_partial_blockage !== undefined) {
      resolved.is_partial_blockage = msg.is_partial_blockage;
    }
    else {
      resolved.is_partial_blockage = false
    }

    return resolved;
    }
};

module.exports = Status;
