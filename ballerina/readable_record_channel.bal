// Copyright (c) 2017 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Represents a readable record channel.
public class ReadableTextRecordChannel {

    private ReadableCharacterChannel charChannel;
    private string rs;
    private string fs;

    # Initializes a readable text record channel.
    #
    # + charChannel - The `io:ReadableCharacterChannel` which will point to the input/output resource
    # + fs - The field separator (this could be a regex)
    # + rs - The record separator (this could be a regex)
    public isolated function init(ReadableCharacterChannel charChannel, string fs = "", string rs = "",
                                string fmt = "default") {
        self.charChannel = charChannel;
        self.rs = rs;
        self.fs = fs;
        initReadableTextRecordChannel(self, charChannel, fs, rs, fmt);
    }

    # Checks whether there is a record left to be read.
    # ```ballerina
    # boolean hasNext = readableRecChannel.hasNext();
    # ```
    #
    # + return - True if there is a record left to be read
    public isolated function hasNext() returns boolean {
        return hasNextExtern(self);
    }

    # Reads the next record from the input/output resource.
    # ```ballerina
    # string[]|io:Error record = readableRecChannel.getNext();
    # ```
    #
    # + return - Set of fields included in the record or else `io:Error`
    public isolated function getNext() returns string[]|Error {
        return getNextExtern(self);
    }

    # Closes the record channel.
    # After a channel is closed, any further reading operations will cause an error.
    # ```ballerina
    # io:Error err = readableRecChannel.close();
    # ```
    #
    # + return - `()` or else an `io:Error` if any error occurred
    public isolated function close() returns Error? {
        return closeReadableTextRecordChannelExtern(self);
    }
}

isolated function initReadableTextRecordChannel(ReadableTextRecordChannel textChannel,
                                                ReadableCharacterChannel charChannel, string fs, string rs, string fmt) = @java:Method {
    name: "initRecordChannel",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;

isolated function hasNextExtern(ReadableTextRecordChannel textChannel) returns boolean = @java:Method {
    name: "hasNext",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;

isolated function getNextExtern(ReadableTextRecordChannel textChannel) returns string[]|Error = @java:Method {
    name: "getNext",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;

isolated function closeReadableTextRecordChannelExtern(ReadableTextRecordChannel textChannel) returns Error? = @java:Method {
    name: "close",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;
