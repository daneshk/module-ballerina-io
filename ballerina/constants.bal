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

# Specifies the format used to represent CSV data.
#
# DEFAULT - The default value is the format specified by the CSVChannel. Precedence will be given to the field
# separator and record separator.
#
# CSV - Field separator will be "," and the record separator will be a new line.
#
# TDF - Field separator will be a tab and the record separator will be a new line.
public type Format DEFAULT|CSV|TDF;

# The default value is the format specified by the CSVChannel. Precedence will be given to the field separator and record separator.
public const DEFAULT = "default";

# Field separator will be "," and the record separator will be a new line.
public const CSV = "csv";

# Field separator will be a tab and the record separator will be a new line.
public const TDF = "tdf";

# Field separators, which are supported by the `DelimitedTextRecordChannel`.
#
# COMMA - Delimited text records will be separated using a comma
#
# TAB - Delimited text records will be separated using a tab
#
# COLON - Delimited text records will be separated using a colon(:)
public type Separator COMMA|TAB|COLON|string;

# Comma (,) will be used as the field separator.
public const COMMA = ",";

# Tab (/t) will be use as the field separator.
public const TAB = "\t";

# Colon (:) will be use as the field separator.
public const COLON = ":";

# New line character.
public const NEW_LINE = "\n";

# Single space character.
const SINGLE_SPACE = " ";

# Double quote character.
const DOUBLE_QUOTE = "\"";

# Default encoding for the abstract read/write APIs.
public const DEFAULT_ENCODING = "UTF8";

# Represents the standard output stream.
public const stdout = 1;

# Represents the standard error stream.
public const stderr = 2;
