#!cs
#in vs code I have to change first line to auto run this code.
#And it's a test to test how to fork and pull request XD.
#File "d:\my programs\cov-mms\setup.csc", line 23
#        import ui
#        ^
#Fatal Error: No such file or directory.

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
using ui.get_raw_handler()
import imgui_font

class setup_window
    # Picasso Activity, initialized in function main
    var act = null
    # Callback function, DO NOT call directly outside the class!
    function open_file(path)
        if typeid path!=typeid string
            system.exit(0)
        end
        # TODO
        system.out.println(path)
        return true
    end
    # Main Function
    function main(args)
        # Initialize the activity object
        act = gcnew ui.base_activity
        act->title = "智锐科创会员管理系统：设置向导"
        act->on_start.add_listener([](_act) -> (_act.default_font = add_font_extend_cn(imgui_font.source_han_sans, 18), style_color_light(), true))        
        switch args.size()
            case 1
                # Setup with no database
                var win = gcnew ui.file_explorer
                win->title = "打开文件"
                win->message = "请选择一个SQLite3数据库文件(.db)"
                win->select_button_name = "选择"
                win->cancel_button_name = "取消"
                win->filters.push_back(".*\\.db")
                win->on_close.add_listener(open_file)
                #win->fullscreen()
                win->read_path()
                win->show()
                act->add_window(win)
            end
            case 2
                # Setup with exist database
                open_file(args.back())
            end
            default
                system.out.println("Fatal Error: Wrong Command Line Arguments")
                return -1
            end
        end
        act->start()
        return 0
    end
end

system.exit((new setup_window).main(context.cmd_args()))
