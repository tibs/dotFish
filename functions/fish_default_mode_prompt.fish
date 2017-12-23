function fish_default_mode_prompt -a right --description "A replacement for the default - show the Vim mode"
    # We don't want to do anything when called by the left prompt. So take
    # advantage of the fact that it doesn't call us with any arguments,
    # whereas our *right* prompt does...
    if test "$right" != "right"
	return
    end
    # We don't want to do anything if we are not in Vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold --background red white
                echo 'N'
            case insert
                set_color --bold --background green white
                echo 'I'
            case replace_one
                set_color --bold --background green white
                echo 'R'
            case visual
                set_color --bold --background magenta white
                echo 'V'
        end
        set_color normal
    end
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
