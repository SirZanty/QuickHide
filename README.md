# **QuickHide**
Script to fake encode files obfuscating the file by adding 1 byte.


Usage: QuickHide [-h] [-e bytes] [-d byte_number] [-p path]
Options:
	-h             : this help
	-e bytes       : bytes string to add to the head file
	-d byte_number : bytes number to remove from the head file
	-p path        : path of directory to hide

	Example:
	qh.sh -h                     - this help
	qh.sh -p /tmp -e 1           - hide all files of tmp path adding 1 byte to head
	qh.sh -p /tmp -d 1           - show all files of tmp path removing the first byte 

## Future Updates

* Add an encode algorithm
* GUI interface 
