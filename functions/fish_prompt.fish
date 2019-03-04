# Git prompt details. The documentation for this is in the source:
#   https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showcolorhints 'yes'
set __fish_git_prompt_show_informative_status 'yes'

function fish_prompt --description 'Write out the prompt'
    # It would be more elegant to use the fish-defined colour variables,
    # instead of setting explicit colours, but this is simpler, and maps
    # more closely to what I used to do in bash.
    set_color normal
    echo -n -s "$USER" @
    set_color red
    echo -n (prompt_hostname)
    set_color normal
    echo -n -s ' ' (prompt_pwd)
    set_color green
    echo -n (__fish_vcs_prompt)
    set_color normal
    echo -n -s "\$ "
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
