# Bash_Showcase

These files are taken from previous assignments from University.
This script is taken from an assignment in my System Level Programming course.
They serve as a showcase of skills in Bash.

# init_complie
In this file, I was tasked with creating a script named init_compile.sh that requires one input argument that is the fully qualified class name (ca.queensu.cs.Card for example). The script assumes that the directory it is run from contains one or more Java files (including the file to be compiled).

If the required argument is missing, then the script outputs a usage message to standard error and exits with an exit status of 1.

If the directory that the script is run from does not contain the Java source code file to be compiled, then the script outputs an error message to standard error and exits with an exit status of 2.

Otherwise, the script creates the directories src/other/package/dirs where other/package/dirs are the directories that mimic the package structure of the class to be compiled. It then copies the Java source code file into its package directory

# check_files.sh

In this file, I was tasked with creating a script called check_files.sh that requires one input argument that is the name of a file called a specfile that specifies the list of expected files. For each file in the list of expected files, the script checks if a file with the expected file name exists in the current directory.

The specfile simply contains the file names of the expected file, one file per line. You can assume that the file name does not include any leading directories. There must be at least one blank line at the end of the file (and there may be more). Lines are considered to be comments if they begin with the character #; commented lines are ignored by the script.

If the required argument is missing, then the script outputs a usage message to standard error and exits with an exit status of 1.

If the specfile does not exist or cannot be read, then the script outputs an error message to standard error and exits with an exit status of 2.

For each file listed in the specfile, the script outputs nothing if the listed file is a regular file in the current working directory. The script outputs a message to standard error indicating that the file is missing if the listed file is not a regular file in the current working directory, but it does not stop running. The script stops only after processing each line of the specfile.

If one or more files were missing, then script exits with an exit status of 3.

# scramble.sh

In this file, I was tasked with creating a script called scramble.sh that requires one input argument that is a string. The script outputs a string made up of the letters of the input word randomly scrambled.

The script had to contain the four following functions:

to_array fills in an array of length  by copying the characters of a string of length  into the array; the array and string are stored in variables created in the main body of the script. Nothing is printed to standard output.
to_string creates a string by concatenating the elements of an array together; the array is stored in a variable created in the main body of the script. The string is printed to standard output so that the value can be used elsewhere.
rand generates a random integer value between  (inclusive) and  (exclusive) where  and  are arguments passed to the function. The random number is printed to standard output so that the value can be used elsewhere.
shuffle implements the Fisher-Yates shuffling algorithm to randomly shuffle the elements of an array; the array is stored in a variable created in the main body of the script. Nothing is printed to standard output.
