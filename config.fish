# Set up my fish shell

set computer_name (hostname -s)

# My bin directory is mostly Python scripts, mostly stored on github
maybe_prepend_to_path $HOME/bin

# Homebrew lives in different places on intel and M1 macs
if test -d /opt/homebrew
  set BREWBASE /opt/homebrew
else
  set BREWBASE /usr/local
end

if test -d $BREWBASE/bin
    maybe_prepend_to_path $BREWBASE/bin
end

# Some things live in sbin, which is not on the PATH by default
if test -d $BREWBASE/sbin
    maybe_prepend_to_path $BREWBASE/sbin
end

# If I've done "brew install coreutils" then it installs things on the PATH
# with 'g' prefixes. To make them available under the normal names it suggests
# prepending the following to the path:
if test -d $BREWBASE/opt/coreutils/libexec/gnubin
    maybe_prepend_to_path $BREWBASE/opt/coreutils/libexec/gnubin
end

# Use the ruby provided by homebrew, as it's substantially more up-to-date
# than the default
maybe_prepend_to_path $BREWBASE/opt/ruby/bin

# I expect ~/local/bin to be locally compiled programs
if test -d $HOME/local/bin
    maybe_prepend_to_path $HOME/local/bin
    # and those same programs may provide man pages
    if not contains $HOME/local/man $MANPATH
        set --export --global MANPATH $HOME/local/man $MANPATH
    end
end

# Have we got rust?
if test -d $HOME/.cargo
    maybe_prepend_to_path $HOME/.cargo/bin
end

# Have we got go?
# ($BREWBASE/go is probably a soft link to the actual executable)
if test -e $BREWBASE/bin/go
    set --global GOPATH $HOME/go/bin
    maybe_prepend_to_path $GOPATH
end

# Allow defining local-only fish functions in a different directory
set _local_function_dir $HOME/.config/fish/functions/_local
if test -d $_local_function_dir
    if not contains $fish_function_path $_local_function_dir
        # config.fish is *always* read
        # `set --export` for fish_function_path appears to not work in fish >= 3.0
        # set --export --global fish_function_path $_local_function_dir $fish_function_path
        # Since this is fundamental to my use of fish, just this once use the
        # "colloquial"
        #
        #  set -U fish_function_path <value>
        #
        # mechanism, which saves the setting in ~/.config/fish/fish_variables
        # and actually sets it for all the current fish instances running on
        # this computer.
        set --global fish_function_path $_local_function_dir $fish_function_path
    end
end

# Experimentally, use Emacs for all-the-things
set --export EDITOR (which vim)
#set --export EDITOR 'emacsclient --alternate-editor="" -nw'
#set --export VISUAL 'emacsclient --alternate-editor="" --create-frame emacs'

# Assume we might want doom tools on the PATH
maybe_prepend_to_path $HOME/.emacs.d/bin

# Actually, I think I'm finding "most" as a pager to be more irritating
# than not. Let's try "less" for a bit...
#if test -x $BREWBASE/bin/most
#    set --export PAGER $BREWBASE/bin/most
#end
if test -x $BREWBASE/bin/less
    set --export PAGER $BREWBASE/bin/less
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

# Set up Ruby via rbenv, if I've got it on this machine
#
# At time of writing:
#
#     $ rbenv init -
#     set -gx PATH '/Users/tonyibbs/.rbenv/shims' $PATH
#     set -gx RBENV_SHELL fish
#     source $BREWBASE/Cellar/rbenv/1.1.2/libexec/../completions/rbenv.fish
#     command rbenv rehash 2>/dev/null
#     function rbenv
#       set command $argv[1]
#       set -e argv[1]
#
#       switch "$command"
#       case rehash shell
#         source (rbenv "sh-$command" $argv|psub)
#       case '*'
#         command rbenv "$command" $argv
#       end
#     end
#
# NB for bash it wants me to do ``echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile``
#
if test -d $HOME/.rbenv
    status --is-interactive; and rbenv init - fish | source
end

# Use starship prompt if it's available

if test -x $BREWBASE/bin/starship
    starship init fish | source
end

if test -x $BREWBASE/bin/opt/unzip
    maybe_prepend_to_path $BREWBASE/opt/unzip/bin
end

# Use pyenv if it's available
# (using the advise from https://github.com/pyenv/pyenv, slightly modified
# to use my `maybe_prepend_to_path`)
if test -x $HOME/.pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    #maybe_prepend_to_path $PYENV_ROOT/bin
    status is-login; and pyenv init --path | source
    pyenv init - | source
end

if test -d $HOME/go
    maybe_prepend_to_path $HOME/go/bin
end

# Do I have a (default) github token?
if test -e $HOME/.github_token
    read -g -x GITHUB_TOKEN < $HOME/.github_token
end
