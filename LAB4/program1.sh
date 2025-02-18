source_file=$2
destination_file=$3
cp "$source_file" "$destination_file"
if [ $? -eq 0 ]; then #try executing the same program without this condition, make it comment it wont give the byte 0 after successful
echo "File '$source_file' copied to '$destination_file'
successfully."
