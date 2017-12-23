function maybe_prepend_to_path -a item --description="Prepend ITEM to $PATH if it's not already there"
    if test "$item" = ""
        return
    end

    if not contains $item $PATH
        set --export PATH $item $PATH
    end
end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
