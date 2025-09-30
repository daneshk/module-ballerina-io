// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
import ballerina/jballerina.java;

# Represents network byte order.
#
# BIG_ENDIAN - specifies the bytes to be in the order of most significant byte first.
#
# LITTLE_ENDIAN - specifies the byte order to be the least significant byte first.
public type ByteOrder "BE"|"LE";

# Specifies the bytes to be in the order of most significant byte first.
public const BIG_ENDIAN = "BE";

# Specifies the byte order to be the least significant byte first.
public const LITTLE_ENDIAN = "LE";

# Represents a writable data channel used for writing various types of data.
public class WritableDataChannel {

    # Initializes a writable data channel.
    #
    # + byteChannel - The 'io:WritableByteChannel`, which would represent the source to read/write data
    # + bOrder - The network byte order, which specifies the order of bytes (e.g., `io:BIG_ENDIAN` or `io:LITTLE_ENDIAN`)
    public isolated function init(WritableByteChannel byteChannel, ByteOrder bOrder = "BE") {
        // Remove temp once this got fixed #19842
        string temp = bOrder;
        initWritableDataChannel(self, byteChannel, temp);
    }

    # Writes a 16 bit integer value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeInt16(length);
    # ```
    #
    # + value - The 16-bit integer value to be written to the data channel
    # + return - `()` if the content is written successfully or else an `io:Error` if any error occurred
    public isolated function writeInt16(int value) returns Error? {
        return writeInt16Extern(self, value);
    }

    # Writes a 32 bit integer value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeInt32(length);
    # ```
    #
    # + value - The 32-bit integer value to be written to the data channel
    # + return - `()` if the content is written successfully or else an `io:Error` if any error occurred
    public isolated function writeInt32(int value) returns Error? {
        return writeInt32Extern(self, value);
    }

    # Writes a 64 bit integer value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeInt64(length);
    # ```
    #
    # + value - The 64-bit integer value to be written to the data channel
    # + return - `()` if the content is written successfully or else an `io:Error` if any error occurred
    public isolated function writeInt64(int value) returns Error? {
        return writeInt64Extern(self, value);
    }

    # Writes a 32 bit float value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeFloat32(3.12);
    # ```
    #
    # + value - The 32-bit float value to be written to the data channel
    # + return - `()` if the float is written successfully or else an `io:Error` if any error occurred
    public isolated function writeFloat32(float value) returns Error? {
        return writeFloat32Extern(self, value);
    }

    # Writes a 64 bit float value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeFloat32(3.12);
    # ```
    #
    # + value - The 64-bit float value to be written to the data channel
    # + return - `()` if the float is written successfully or else an `io:Error` if any error occurred
    public isolated function writeFloat64(float value) returns Error? {
        return writeFloat64Extern(self, value);
    }

    # Writes a boolean value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeInt64(length);
    # ```
    #
    # + value - The boolean value to be written to the data channel
    # + return - `()` if the content is written successfully or else an `io:Error` if any error occurred
    public isolated function writeBool(boolean value) returns Error? {
        return writeBoolExtern(self, value);
    }

    # Writes a string value to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeString(record);
    # ```
    #
    # + value - The string value to be written to the data channel
    # + encoding - The encoding, which will represent the value string
    # + return - `()` if the content is written successfully or else an `io:Error` if any error occurred
    public isolated function writeString(string value, string encoding) returns Error? {
        return writeStringExtern(self, value, encoding);
    }

    # Writes a variable-length integer to the writable data channel.
    # ```ballerina
    # io:Error? err = dataChannel.writeVarInt(length);
    # ```
    #
    # + value - The variable-length integer value to be written to the data channel
    # + return - `()` if the integer is written successfully, or an `io:Error` if an error occurs
    public isolated function writeVarInt(int value) returns Error? {
        return writeVarIntExtern(self, value);
    }

    # Closes the data channel.
    # After a channel is closed, any further writing operations will cause an error.
    # ```ballerina
    # io:Error? err = dataChannel.close();
    # ```
    #
    # + return - `()` if the channel is closed successfully or else an `io:Error` if any error occurred
    public isolated function close() returns Error? {
        return closeWritableDataChannelExtern(self);
    }
}

isolated function initWritableDataChannel(WritableDataChannel dataChannel, WritableByteChannel byteChannel,
                                        string bOrder) = @java:Method {
    name: "initWritableDataChannel",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeInt16Extern(WritableDataChannel dataChannel, int value) returns Error? = @java:Method {
    name: "writeInt16",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeInt32Extern(WritableDataChannel dataChannel, int value) returns Error? = @java:Method {
    name: "writeInt32",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeInt64Extern(WritableDataChannel dataChannel, int value) returns Error? = @java:Method {
    name: "writeInt64",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeFloat32Extern(WritableDataChannel dataChannel, float value) returns Error? = @java:Method {
    name: "writeFloat32",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeFloat64Extern(WritableDataChannel dataChannel, float value) returns Error? = @java:Method {
    name: "writeFloat64",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeBoolExtern(WritableDataChannel dataChannel, boolean value) returns Error? = @java:Method {
    name: "writeBool",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeStringExtern(WritableDataChannel dataChannel, string value, string encoding) returns Error? = @java:Method {
    name: "writeString",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function writeVarIntExtern(WritableDataChannel dataChannel, int value) returns Error? = @java:Method {
    name: "writeVarInt",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;

isolated function closeWritableDataChannelExtern(WritableDataChannel dataChannel) returns Error? = @java:Method {
    name: "closeDataChannel",
    'class: "io.ballerina.stdlib.io.nativeimpl.DataChannelUtils"
} external;
