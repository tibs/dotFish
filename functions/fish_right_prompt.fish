function fish_right_prompt --description "Write out the right prompt"
    set -l last_status $status
    if test $last_status -ne 0
        set_color red
        echo -n [$last_status]
        set_color normal
    end
    fish_default_mode_prompt "right"
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
