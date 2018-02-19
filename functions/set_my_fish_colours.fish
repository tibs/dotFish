function set_my_fish_colours --description "Set up my own colour scheme"
    # Notes:
    # Reading ~/.config/fish/fishd.<session>, the following escapes are used
    # in setting colour sequences:
    #
    #    \x1e  RS (record separator)
    #    \x20  SPACE
    #    \x2d  - (hyphen/dash)
    #    \x3d  =
    #
    # The set_color command can be told a colour as:
    #
    # - a 6-digit hex value
    # - a 3-digit hex value - each digit is repeated, so 123 means 112233
    # - a colour name
    #
    # Colour names include:
    #
    # - black, red, green, yellow, blue, magenta, cyan, white
    # - brblack, brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite
    # - normal
    #
    # where the ``br`` colours are "brighter". brblack is more grey than black.
    #
    # If a second colour is speciied, then it is used as the backup if the
    # first colour is not available (on the current terminal)
    #
    # The following options (switches) may be used:
    #
    # - -b, --background COLOR sets the background color.
    # - -c, --print-colors prints a list of the 16 named colors.
    # - -o, --bold sets bold mode.
    # - -d, --dim sets dim mode.
    # - -i, --italics sets italics mode.
    # - -r, --reverse sets reverse mode.
    # - -u, --underline sets underlined mode.

    # That aforesaid fishd.<session> file sets the following colours. Those
    # marked "[BAD]" are yellow and thus won't work well against my light
    # coloured terminal, which is set to something like edfdd1 (a pale yellow
    # intended to be reminiscent of parchment)
    #
    #    fish_color_autosuggestion:555                  == <grey>
    #    fish_color_cancel:\x2dr                        == ``-r`` - reversed mode
    #    fish_color_command:005fd7                      == <brightish blue>
    #    fish_color_comment:990000                      == <dark red>
    #    fish_color_cwd:green                           == green
    #    fish_color_cwd_root:red                        == red
    #    fish_color_end:009900                          == <darker green>
    #    fish_color_error:ff0000                        == red
    #    fish_color_escape:bryellow\x1e\x2d\x2dbold     == bright yellow --bold  [BAD]
    #    fish_color_history_current:\x2d\x2dbold        == ``--bold``
    #    fish_color_host:normal                         == normal
    #    fish_color_match:\x2d\x2dbackground\x3dbrblue  == --background bright blue
    #    fish_color_normal:normal                       == normal
    #    fish_color_operator:bryellow                   == bright yellow  [BAD]
    #    fish_color_param:00afff                        == <light blue>
    #    fish_color_quote:999900                        == <khaki green>
    #    fish_color_redirection:00afff                  == <light blue>
    #    fish_color_search_match:bryellow\x1e\x2d\x2dbackground\x3dbrblack           == bright yellow --background bright black
    #    fish_color_selection:white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack == white --bold --background bright black
    #    fish_color_status:red                          == red
    #    fish_color_user:brgreen                        == bright green
    #    fish_color_valid_path:\x2d\x2dunderline        == ``--underline``
    #    fish_pager_color_completion:\x1d               == 
    #    fish_pager_color_description:B3A06D\x1eyellow  == <light brown> or yellow
    #    fish_pager_color_prefix:white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline == white --bold --underline
    #    fish_pager_color_progress:brwhite\x1e\x2d\x2dbackground\x3dcyan    == bright white -- background cyan

    # Sorting out the bad ones:
    # fish_color_operator seems to be used for "finishing off" the letters in
    # a suggested sequence - for instance if I've type "echo $PA" then the
    # "$PA" will be in that color - presumably as an "operator" to the echo
    # command. As such, it needs to be quite visible!
    set fish_color_operator magenta
    # Following the same reasoning as to replacement colours:
    set fish_color_escape "magenta --bold"
    set fish_pager_color_description "b3a06d magenta"

    # ``dirh`` uses this to highlight the current directory. It defaults to
    # just ``--bold``, which isn't terribly obvious. For some reasons, setting
    # this value in double quotes doesn't work.
    set fish_color_history_current magenta --bold

    # Anything else can be left to another time...
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
