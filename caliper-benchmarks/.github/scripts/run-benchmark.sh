#!/bin/bash
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Exit on first error, print all commands.
set -e
set -o pipefail

case $1 in
  metacrowd)
    export BENCHCONFIG=benchmarks/samples/fabric/MetaCrowd/config-marketplace-fulfil.yaml
    ;;
  dam)
    export BENCHCONFIG=benchmarks/samples/fabric/DAM/config.yaml
    ;;
esac

npx caliper launch manager --caliper-workspace ./ --caliper-networkconfig networks/fabric/test-network.yaml --caliper-benchconfig $BENCHCONFIG --caliper-flow-only-test --caliper-fabric-gateway-enabled --Caliper-UserConfig config.yaml
