function cht
    set topic_constraint none

    # Process arguments
    for arg in $argv
        switch $arg
            case l lang
                set topic_constraint lang
                break
        end
    end

    set topic ""
    if test "$topic_constraint" = lang
        set topic (echo -e "go\nrust\nc" | fzf)
        stty sane
    else
        set topic (curl -s cht.sh/:list | fzf)
        stty sane
    end

    if test -z "$topic"
        return 0
    end

    set sheet (curl -s cht.sh/$topic/:list | fzf)

    if test -z "$sheet"
        curl -s "cht.sh/$topic?style=rrt" | less -R
        return 0
    end

    curl -s "cht.sh/$topic/$sheet?style=rrt" | less -R
end
