# Set up my fish shell

set computer_name (hostname -s)

# My bin directory is mostly Python scripts, mostly stored on github
maybe_prepend_to_path $HOME/bin

# Some things live in /usr/local/sbin, which is not on the PATH by default
if test -d /usr/local/sbin
    maybe_append_to_path /usr/local/sbin
end

# If I've done "brew install coreutils" then it installs things on the PATH
# with 'g' prefixes. To make them available under the normal names it suggests
# prepending the following to the path:
if test -d /usr/local/opt/coreutils/libexec/gnubin
    maybe_prepend_to_path /usr/local/opt/coreutils/libexec/gnubin
end

# I expect local/bin to be locally compiled programs
if test -d $HOME/local/bin
    maybe_prepend_to_path $HOME/local/bin
    # and those same programs may provide man pages
    if not contains $HOME/local/man $MANPATH
        set --export MANPATH $HOME/local/man $MANPATH
    end
end

# Allow defining local-only fish functions in a different directory
if test -d $HOME/.config/fish/functions/_local
    set -g -x fish_function_path $HOME/.config/fish/functions/_local $fish_function_path
end

# Experimentally, use Emacs for all-the-things
set --export EDITOR (which vim)
#set --export EDITOR 'emacsclient --alternate-editor="" -nw'
#set --export VISUAL 'emacsclient --alternate-editor="" --create-frame emacs'

if test -x /usr/local/bin/most
    set --export PAGER /usr/local/bin/most
end

# Set the colours that I need to alter to get a good result against my
# particular terminal background
set_my_fish_colours

# Turn on vi keybindings
# We could equally call the fish_vi_key_bindings function
# (and we can switch back to "emacs" with the fish_default_key_bindings function)
set -g fish_key_bindings fish_vi_key_bindings

# Things which are not suitable for putting on github
# (note - the .gitignore file will ignore any functions whose names start
# with an underscore)
if functions --query _fish_setup_local
    _fish_setup_local
end

# Things which are specific to this computer
if functions --query fish_setup_$computer_name
    eval fish_setup_$computer_name
end

# Where to find MacVim
# This is used by ~/bin/mvim and ~/bin/gvim
set -g -x VIM_APP_DIR /Applications/Extras

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
