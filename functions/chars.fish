function chars -a text --description="Report the number of characters in TEXT"
    #echo "Blog post title is 40-90 chars, 'subtitle' is 150-160 chars"
    #echo "Hero image text is up to 92 chars, <= 4 lines, each 23 chars"
    echo "$text" | wc -c
end
