# Get name of the folder for the compilation
name="${PWD##*/}"

# Compile the assembly file
# Type "aa" (for analyse all) in radare2 to see the output
# And "v" (for visual mode) to see the output in a graph
# Type "q" to quit radare2
radare2 -A $name
