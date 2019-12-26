function rg-replace --argument-names OLD NEW -d 'Find occurrences of OLD using rg, and replace with NEW'

    if test $OLD = $NEW
        echo "OLD and NEW arguments ($OLD) should be different"
        return 1
    end

    if string match -q -e / $OLD
        echo "First argument ($OLD) contains "/" - it may not"
        return 1
    end

    if string match -q -e / $NEW
        echo "First argument ($NEW) contains "/" - it may not"
        return 1
    end

    echo "Replacing $OLD with $NEW"

    rg --files-with-matches $OLD | xargs -n 1 sed -i "" -e "s/$OLD/$NEW/g"

end

# vim: set tabstop=8 softtabstop=4 shiftwidth=4 expandtab:
