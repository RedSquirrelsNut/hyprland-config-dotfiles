function myb
    mpv --ytdl-format="bestvideo[height<=?720][fps<=?30][vcodec!=?vp9]+bestaudio/best" $argv
end
