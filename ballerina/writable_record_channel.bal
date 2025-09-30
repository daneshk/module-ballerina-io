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

# Represents a writable text record channel that allows writing records.
public class WritableTextRecordChannel {
    private WritableCharacterChannel characterChannel;
    private string fs;
    private string rs;

    # Initializes a writable text record channel.
    # + characterChannel - The `io:WritableCharacterChannel`, which will point to the input/output resource
    # + fs - The field separator (this could be a regex)
    # + rs - The record separator (this could be a regex)
    # + fmt - The format, which will be used to represent the CSV (this could be 
    # "DEFAULT" (the format specified by the CSVChannel), 
    # "CSV" (Field separator would be "," and record separator would be a new line) or else
    # "TDF" (Field separator will be a tab and record separator will be a new line)
    public isolated function init(WritableCharacterChannel characterChannel, string fs = "", string rs = "",
                                string fmt = "default") {
        self.characterChannel = characterChannel;
        self.fs = fs;
        self.rs = rs;
        initWritableTextRecordChannel(self, characterChannel, fs, rs, fmt);
    }

    # Writes records to a given output resource.
    # ```ballerina
    # io:Error? err = writableChannel.write(records);
    # ```
    #
    # + textRecord - List of fields to be written
    # + return - An `io:Error` if the records could not be written properly or else `()`
    public isolated function write(string[] textRecord) returns Error? {
        return writeRecordExtern(self, textRecord);
    }

    # Closes the record channel.
    # After a channel is closed, any further writing operations will cause an error.
    # ```ballerina
    # io:Error? err = writableChannel.close();
    # ```
    #
    # + return - An `io:Error` if the record channel could not be closed properly or else `()`
    public isolated function close() returns Error? {
        return closeWritableTextRecordChannelExtern(self);
    }
}

isolated function initWritableTextRecordChannel(WritableTextRecordChannel textChannel,
                                                WritableCharacterChannel charChannel, string fs, string rs, string fmt) = @java:Method {
    name: "initRecordChannel",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;

isolated function writeRecordExtern(WritableTextRecordChannel textChannel, string[] textRecord) returns Error? = @java:Method {
    name: "write",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;

isolated function closeWritableTextRecordChannelExtern(WritableTextRecordChannel textChannel) returns Error? = @java:Method {
    name: "close",
    'class: "io.ballerina.stdlib.io.nativeimpl.RecordChannelUtils"
} external;
