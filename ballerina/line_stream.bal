// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# A stream of strings(lines) that is used to read the character content from the streams.
public class LineStream {
    private ReadableCharacterChannel readableCharacterChannel;
    private boolean isClosed = false;

    # Initializes A stream of strings(lines).
    #
    # + readableCharacterChannel - The `io:ReadableCharacterChannel` that the line stream is referred to
    public isolated function init(ReadableCharacterChannel readableCharacterChannel) {
        self.readableCharacterChannel = readableCharacterChannel;
    }

    # Reads the next line of the stream.
    #
    # + return - A line as a string when a line is available in the stream or returns `()` when the stream reaches the end
    public isolated function next() returns record {|string value;|}|Error? {
        var line = readLine(self.readableCharacterChannel);
        if line is string {
            record {|string value;|} value = {value: <string>line.cloneReadOnly()};
            return value;
        } else if line is EofError {
            check closeReader(self.readableCharacterChannel);
            return;
        } else {
            return line;
        }
    }

    # Closes the stream manually.
    # If not invoked, the stream closes automatically upon reaching end-of-stream.
    #
    # + return - `()` when the closing was successful or an `io:Error`
    public isolated function close() returns Error? {
        if !self.isClosed {
            var closeResult = closeReader(self.readableCharacterChannel);
            if closeResult is () {
                self.isClosed = true;
            }
            return closeResult;
        }
        return;
    }
}

isolated function readLine(ReadableCharacterChannel readableCharacterChannel) returns string|Error = @java:Method {
    name: "readLine",
    'class: "io.ballerina.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;

isolated function closeReader(ReadableCharacterChannel readableCharacterChannel) returns Error? = @java:Method {
    name: "closeBufferedReader",
    'class: "io.ballerina.stdlib.io.nativeimpl.CharacterChannelUtils"
} external;
