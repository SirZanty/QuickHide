# **QuickHide**
Script to fake encode files obfuscating the file by adding n bytes.


Usage: QuickHide [-h] [-e bytes] [-d byte_number] [-p path]
Options:
	-h             : this help
	-e bytes       : bytes string to add to the head file
	-d byte_number : bytes number to remove from the head file
	-p path        : path of directory to hide

	Example:
	qh.sh -h                     - this help
	qh.sh -p /tmp -e bytes       - hide all files of tmp path adding bytes to head
	qh.sh -p /tmp -d 2           - show all files of tmp path removing the first two bytes 
