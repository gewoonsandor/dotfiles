case $2 in
    fs) dimensions=$(slurp -o);;
    *) dimensions=$(slurp);;
esac
echo $dimensions

case $1 in
    copy) grim -g "$dimensions" - | wl-copy ;;
    save) grim -g "$dimensions" "$HOME/Pictures/Screenshots/Screenshot_$(date).png" ;;
    *) echo "Usage: $0 {copy|save}"
        exit 1 ;;
esac
