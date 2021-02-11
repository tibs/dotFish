function maybe_append_to_path -a item --description="Append ITEM to $PATH if it's not already there"
    if test "$item" = ""
        return
    end

    # Note that we're working on PATH directly
    # We could work on fish_user_paths instead, but the instructions for
    # that assume we want -U (--universal) which (a) stores the result in
    # ~/.config/fish/fish_variables and (b) applies to all currently
    # running fish instances. Which is not what we really want.
    #
    # Also, the "colloquial" way to do this is probably meant to be more
    # like
    #
    #    contains $item $PATH; or set -eax PATH $item
    #
    # but I think that's more obscure

    if not contains $item $PATH
        set --export --global --append PATH $item
    end
end
