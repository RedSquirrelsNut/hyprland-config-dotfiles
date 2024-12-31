function somafm
    # Check if an argument is provided, we do not check if its a valid station
    if test -n "$argv"
        # Get the argument (topic), will ignore any other arguments
        set topic $argv[1]
        # Play the provided topic using mpv
        mpv --no-video "https://somafm.com/$topic.pls"
    else
        # Fetch the HTML from the SomaFM homepage
        set response (curl -s "https://somafm.com/")

        # Extract the .pls links, filter unwanted digits/nossl links
        set links (echo $response | grep -oE '[^"]+\.pls' | grep -vE '/nossl/[a-zA-Z]' | grep -vE '[0-9]')

        # Process the links to remove .pls/slashes, then pipe to fzf
        set cleaned_link (for link in $links
            echo $link | sed 's|/||g' | sed 's/\.pls//g'
        end | fzf)

        # Check if any link was selected
        if test -n "$cleaned_link"
            # Play the selected stream using mpv
            mpv --no-video "https://somafm.com/$cleaned_link.pls"
        else
            echo "No selection made."
            return 1
        end
    end
end
