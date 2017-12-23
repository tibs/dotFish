function fish_setup_pogle --description "Fish setup for my laptop, pogle"
    # The 'mvim' script defaults to looking for MacVim in /Applications,
    # but I keep it in ~/Applications/Extras
    set --export VIM_APP_DIR $HOME/Applications/Extras

    # Haskell on the Mac:
    if test -d $HOME/Library/Haskell/bin
        set --export PATH $HOME/Library/Haskell/bin $PATH
    end

    alias mq="mplayer -nosound -ontop"
    alias mpvq="mpv --no-audio --ontop"
    alias m2="mpv --no-audio --ontop"

    alias lsbig='ls -lhSr'
    
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
