function maybe_append_to_path -a item --description="Append ITEM to $PATH if it's not already there"
    if test "$item" = ""
        return
    end

    if not contains $item $PATH
        set --export --global PATH $PATH $item
    end
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
