## md_live
- requires cmark installed
- uses mktemp
- a command that creates a temporary file or directory with a unique name
- It's commonly used in shell scripts when you need a temporary place to store data briefly during the script's execution.
- has nice command exist check too

## EOF 
Here's how it works in practice:

- The shell sees cat << EOF > "$temp_file" and knows to start reading the following lines as input.
- It reads all the lines that follow (in this case, our CSS and JavaScript).
- When it encounters a line containing only EOF, it stops reading.
All the text between <<EOF and EOF is then passed to the cat command, which writes it to $temp_file.
