#!/bin/bash
#
# Copyright 2017 Istio Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################
#
# Generates a global dictionary list in golang used by mixerclient to encode
# strings in messages.
#

cat <<EOF
// Code generated by wordlist_process.sh.
// DO NOT EDIT!

package mixer

// GlobalList of known words
func GlobalList() []string {
	tmp := make([]string, len(globalList))
	copy(tmp, globalList)
	return tmp
}

var (
	globalList = []string{
EOF

cat - |\
  sed '/^#/d' |\
  sed '/^\s*$/d' |\
  sed 's/^- \(.*\)$/\t\t"\1",/'

cat <<EOF
	}
)
EOF
