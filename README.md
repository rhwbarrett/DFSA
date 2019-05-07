# DFSA
This repository holds my implementation of a Deterministic Finite State Automaton.

The project consists of two .jar files, a Bash Script for running them, and a directory of .txt files which represent models of particular regular languages.  The regular languages captured in the models directory include: dollar amounts in dollar notation up to $99.99, dollar amounts in word format up to $99.99, numbers in word format up to 99, and "sheeptalk" as described by Jurafsky and Martin in "Speech and Language Processing: An Introduction to Natural Language Processing, Commputational Linguistics, and Speech Recognition, Second Edition", pp.27-30.  The models supplied in this project have been provided in order to show how the project works, as well as representing a starting point for you creating your own models.  Later in this file, I describe best practices for doing that.

Configuration:
=================
The project is ready to use; simply download from github, and unzip the downloaded file, and you are ready to go!

How to use:
=================
This project is operated through use of the command-line by way of a Bash Script.  After downloading and unzipping the project, simply type <code>cd DFSA</code> to navigate to the DFSA directory.  Type <code>ls</code>, to look at the contents of the <code>DFSA</code> directory.  Among the files present should be a file named <code>Run_DFSA.sh</code>; this is the file we will be using to run the project.

This project is used to either recognize or generate strings given a model of a regular language.

To recognize a string as belonging to a particular regular language, follow the schematic provided below:
Run_DFSA -r modelFile testString

For example, to test whether the string "$19.99" belongs to the regular language of dollar amounts of up to $99.99, simply type the following in the command line:

<code>./Run_DFSA.sh -r models/dollars.txt "\\$19.99"</code>

Running the above command will produce the following:

<code>The machine recognizes the input as valid.</code>

Note: When entering dollar amounts on the command line, the $ symbol must be proceeded by a \ .

Alternatively, running the command below:

<code>./Run_DFSA.sh -r models/dollars.txt "19.99"</code>

will produce the following:

<code>The machine doesn't recognize the input as valid.</code>

To generate a string of a particular regular language, follow the schematic provided below:
Run_DFSA -g modelFile numberOfIterations

For example, to generate 10 instances of dollar amounts of up to $99.99, simply type the following in the command line:

<code>./Run_DFSA.sh -g models/dollars.txt 10</code>
