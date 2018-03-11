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

class Track {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.status = null;
      this.index = null;
      this.range = null;
      this.range_rate = null;
      this.range_accl = null;
      this.azimuth = null;
      this.lateral_rate = null;
      this.width = null;
      this.is_mr_update = null;
      this.is_lr_update = null;
      this.amplitude = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
      if (initObj.hasOwnProperty('index')) {
        this.index = initObj.index
      }
      else {
        this.index = 0;
      }
      if (initObj.hasOwnProperty('range')) {
        this.range = initObj.range
      }
      else {
        this.range = 0.0;
      }
      if (initObj.hasOwnProperty('range_rate')) {
        this.range_rate = initObj.range_rate
      }
      else {
        this.range_rate = 0.0;
      }
      if (initObj.hasOwnProperty('range_accl')) {
        this.range_accl = initObj.range_accl
      }
      else {
        this.range_accl = 0.0;
      }
      if (initObj.hasOwnProperty('azimuth')) {
        this.azimuth = initObj.azimuth
      }
      else {
        this.azimuth = 0.0;
      }
      if (initObj.hasOwnProperty('lateral_rate')) {
        this.lateral_rate = initObj.lateral_rate
      }
      else {
        this.lateral_rate = 0.0;
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0.0;
      }
      if (initObj.hasOwnProperty('is_mr_update')) {
        this.is_mr_update = initObj.is_mr_update
      }
      else {
        this.is_mr_update = false;
      }
      if (initObj.hasOwnProperty('is_lr_update')) {
        this.is_lr_update = initObj.is_lr_update
      }
      else {
        this.is_lr_update = false;
      }
      if (initObj.hasOwnProperty('amplitude')) {
        this.amplitude = initObj.amplitude
      }
      else {
        this.amplitude = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Track
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    // Serialize message field [index]
    bufferOffset = _serializer.uint8(obj.index, buffer, bufferOffset);
    // Serialize message field [range]
    bufferOffset = _serializer.float32(obj.range, buffer, bufferOffset);
    // Serialize message field [range_rate]
    bufferOffset = _serializer.float32(obj.range_rate, buffer, bufferOffset);
    // Serialize message field [range_accl]
    bufferOffset = _serializer.float32(obj.range_accl, buffer, bufferOffset);
    // Serialize message field [azimuth]
    bufferOffset = _serializer.float32(obj.azimuth, buffer, bufferOffset);
    // Serialize message field [lateral_rate]
    bufferOffset = _serializer.float32(obj.lateral_rate, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.float32(obj.width, buffer, bufferOffset);
    // Serialize message field [is_mr_update]
    bufferOffset = _serializer.bool(obj.is_mr_update, buffer, bufferOffset);
    // Serialize message field [is_lr_update]
    bufferOffset = _serializer.bool(obj.is_lr_update, buffer, bufferOffset);
    // Serialize message field [amplitude]
    bufferOffset = _serializer.int8(obj.amplitude, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Track
    let len;
    let data = new Track(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [index]
    data.index = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [range]
    data.range = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [range_rate]
    data.range_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [range_accl]
    data.range_accl = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [azimuth]
    data.azimuth = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [lateral_rate]
    data.lateral_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [is_mr_update]
    data.is_mr_update = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_lr_update]
    data.is_lr_update = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [amplitude]
    data.amplitude = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 29;
  }

  static datatype() {
    // Returns string type for a message object
    return 'esr_msgs/Track';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b8be915c8c9061bba3ebae89845e593a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Track(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    if (msg.index !== undefined) {
      resolved.index = msg.index;
    }
    else {
      resolved.index = 0
    }

    if (msg.range !== undefined) {
      resolved.range = msg.range;
    }
    else {
      resolved.range = 0.0
    }

    if (msg.range_rate !== undefined) {
      resolved.range_rate = msg.range_rate;
    }
    else {
      resolved.range_rate = 0.0
    }

    if (msg.range_accl !== undefined) {
      resolved.range_accl = msg.range_accl;
    }
    else {
      resolved.range_accl = 0.0
    }

    if (msg.azimuth !== undefined) {
      resolved.azimuth = msg.azimuth;
    }
    else {
      resolved.azimuth = 0.0
    }

    if (msg.lateral_rate !== undefined) {
      resolved.lateral_rate = msg.lateral_rate;
    }
    else {
      resolved.lateral_rate = 0.0
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0.0
    }

    if (msg.is_mr_update !== undefined) {
      resolved.is_mr_update = msg.is_mr_update;
    }
    else {
      resolved.is_mr_update = false
    }

    if (msg.is_lr_update !== undefined) {
      resolved.is_lr_update = msg.is_lr_update;
    }
    else {
      resolved.is_lr_update = false
    }

    if (msg.amplitude !== undefined) {
      resolved.amplitude = msg.amplitude;
    }
    else {
      resolved.amplitude = 0
    }

    return resolved;
    }
};

module.exports = Track;
