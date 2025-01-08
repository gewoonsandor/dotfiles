# Adjust brightness based on user input
case $1 in
    increase)
        pkexec brillo -A 5  # Increase by 5%
        ;;
    decrease)
        pkexec brillo -U 5  # Decrease by 5%
        ;;
    *)
        echo "Usage: $0 {increase|decrease}"
        exit 1
        ;;
esac

percentage=$(pkexec brillo)
dunstify -h string:x-dunst-stack-tag:brightness -h int:value:"$percentage" "$percentage% Brightness"
