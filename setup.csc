#!/usr/bin/env cs

# Covariant Membership Management System: Setup
#
# Licensed under the Covariant Innovation General Public License,
# Version 1.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://covariant.cn/licenses/LICENSE-1.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Copyright (C) 2019 Covariant Institute
# Github: https://github.com/covariant-institute/

import ui

class setup_window
    function main(args)
        switch args.size()
            case 1
                # Setup with no database
            end
            case 2
                # Setup with exist database
            end
            default
                system.out.println("Fatal Error: Wrong Command Line Arguments")
                return -1
            end
        end
        return 0
    end
end

system.exit((new setup_window).main(context.cmd_args()))