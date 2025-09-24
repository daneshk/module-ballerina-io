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

# ReadableByteChannel represents an input resource (i.e file), which could be used to source bytes.
# A file path or an in-memory `byte` array can be used to obtain an `io:ReadableByteChannel`.
# An `io:ReadableByteChannel` does not support initialization, and it should be obtained using the following methods or implemented natively.
#
# `io:openReadableFile("./files/sample.txt")` - used to obtain an `io:ReadableByteChannel` from a given file path
# `io:createReadableChannel(byteArray)` - used to obtain an `io:ReadableByteChannel` from a given `byte` array
public class ReadableByteChannel {

    # Adding default init function to prevent object getting initialized from the user code.
    isolated function init() {
    }

    # Reads bytes from a given input resource.
    # This operation will be asynchronous in which the total number of required bytes might not be returned at a given
    # time. An `io:EofError` will return once the channel reaches the end.
    # ```ballerina
    # byte[]|io:Error result = readableByteChannel.read(1000);
    # ```
    #
    # + nBytes - Represents the number of bytes, which should be read. This should be a positive integer.
    # + return - Content (the number of bytes) read, an `EofError` once the channel reaches the end or else an `io:Error`
    public isolated function read(int nBytes) returns byte[]|Error {
        return byteReadExtern(self, nBytes);
    }

    # Reads all content of the channel as a `byte` array and return a read only `byte` array.
    # ```ballerina
    # byte[]|io:Error result = readableByteChannel.readAll();
    # ```
    #
    # + return - A read-only `byte` array or else an `io:Error`
    public isolated function readAll() returns readonly & byte[]|Error {
        byte[] readResult = check readAllBytes(self);
        return <readonly & byte[]>readResult.cloneReadOnly();
    }

    # Returns a block stream that can be used to read all `byte` blocks as a stream.
    # ```ballerina
    # stream<io:Block, io:Error>|io:Error result = readableByteChannel.blockStream();
    # ```
    # + blockSize - The size of the block. This should be a positive integer.
    # + return - A block stream or else an `io:Error`
    public isolated function blockStream(int blockSize) returns stream<Block, Error?>|Error {
        BlockStream blockStream = new (self, blockSize);
        return new stream<Block, Error?>(blockStream);
    }

    # Encodes a given `io:ReadableByteChannel` using the Base64 encoding scheme.
    # ```ballerina
    # io:ReadableByteChannel|Error encodedChannel = readableByteChannel.base64Encode();
    # ```
    #
    # + return - An encoded `io:ReadableByteChannel` or else an `io:Error`
    public isolated function base64Encode() returns ReadableByteChannel|Error {
        return base64EncodeExtern(self);
    }

    # Decodes a given Base64 encoded `io:ReadableByteChannel`.
    # ```ballerina
    # io:ReadableByteChannel|Error encodedChannel = readableByteChannel.base64Decode();
    # ```
    #
    # + return - A decoded `io:ReadableByteChannel` or else an `io:Error`
    public isolated function base64Decode() returns ReadableByteChannel|Error {
        return base64DecodeExtern(self);
    }

    # Closes the readable byte channel to release any underlying resources.
    # After a channel is closed, any further reading operations will cause an error.
    # ```ballerina
    # io:Error? err = readableByteChannel.close();
    # ```
    #
    # + return - `()` or else an `io:Error` if any error occurred
    public isolated function close() returns Error? {
        return closeReadableByteChannelExtern(self);
    }
}

isolated function byteReadExtern(ReadableByteChannel byteChannel, int nBytes) returns byte[]|Error = @java:Method {
    name: "read",
    'class: "io.ballerina.stdlib.io.nativeimpl.ByteChannelUtils"
} external;

isolated function readAllBytes(ReadableByteChannel byteChannel) returns byte[]|Error = @java:Method {
    name: "readAll",
    'class: "io.ballerina.stdlib.io.nativeimpl.ByteChannelUtils"
} external;

isolated function base64EncodeExtern(ReadableByteChannel byteChannel) returns ReadableByteChannel|Error = @java:Method {
    name: "base64Encode",
    'class: "io.ballerina.stdlib.io.nativeimpl.ByteChannelUtils"
} external;

isolated function base64DecodeExtern(ReadableByteChannel byteChannel) returns ReadableByteChannel|Error = @java:Method {
    name: "base64Decode",
    'class: "io.ballerina.stdlib.io.nativeimpl.ByteChannelUtils"
} external;

isolated function closeReadableByteChannelExtern(ReadableByteChannel byteChannel) returns Error? = @java:Method {
    name: "closeByteChannel",
    'class: "io.ballerina.stdlib.io.nativeimpl.ByteChannelUtils"
} external;
