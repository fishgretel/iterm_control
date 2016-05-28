# https://www.iterm2.com/documentation-escape-codes.html
# https://github.com/gnachman/iTerm2/blob/master/sources/iTermAdvancedSettingsModel.m

function __iterm_comp_color
    printf "\033]P%s%s\033\\" "$argv[1]" "$argv[2]"
end

function __iterm_comp_set
    printf "\033]%s;%s\a" "$argv[1]" "$argv[2]"
end

# iterm_set_foreground 00ee00
function iterm_set_foreground
    echo -e (__iterm_comp_color 'g' $argv)
end

function iterm_set_background
    echo -e (__iterm_comp_color 'h' $argv)
end

function iterm_set_bold
    echo -e (__iterm_comp_color 'i' $argv)
end

function iterm_set_selection
    echo -e (__iterm_comp_color 'j' $argv)
end

function iterm_set_selected_text
    echo -e (__iterm_comp_color 'k' $argv)
end

function iterm_set_cursor
    echo -e (__iterm_comp_color 'l' $argv)
end

function iterm_set_cursor_text
    echo -e (__iterm_comp_color 'm' $argv)
end

# iterm_set_chrome 096 000 f0e
function iterm_set_chrome
    echo -e "\033]6;1;bg;red;brightness;$argv[1]\a"
    echo -e "\033]6;1;bg;green;brightness;$argv[2]\a"
    echo -e "\033]6;1;bg;blue;brightness;$argv[3]\a"
end

function iterm_reset_chrome
    echo -e (__iterm_comp_set '6;1' 'bg;*;default')
end

# 0: Block, 1: Vertical bar, 2: Underline
# iterm_set_cursor_shape 1
function iterm_set_cursor_shape
    echo -e (__iterm_comp_set '50' "CursorShape=$argv")
end

# iterm_set_tab_title "status is $status"
function --on-event iterm_set_tab_title iterm_set_tab_title
    echo -e "\033];$argv\007"
end

function --on-event iterm_set_mark iterm_set_mark
    echo -e (__iterm_comp_set '50' 'SetMark')
end

# # needs to be enabled in the settings
# # iterm_post_notification "a lenghty story"
# # recommended to use https://github.com/fishgretel/terminal_notifier instead
# function iterm_post_notification
#     echo -e (__iterm_comp_set "9" $argv)
# end

# Advanced -> Disable potentially insecure escape sequences.
# RemoteHost, StealFocus, CurrentDir, SetProfile, CopyToClipboard, EndCopy, File, SetBackgroundImageFile
# https://github.com/gnachman/iTerm2/blob/master/sources/iTermAdvancedSettingsModel.m

# function iterm_set_profile
#     echo -e (__iterm_comp_set '50' "SetProfile=$argv")
# end

# function iterm_steal_focus
#     echo -e (__iterm_comp_set '50' 'StealFocus')
# end
