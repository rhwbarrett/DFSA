# DFSA
This repository holds my implementation of a Deterministic Finite State Automaton.

The project consists of a .jar file, a Bash Script for running it, and a directory of .txt files which represent models of particular regular languages.  The regular languages captured in the models directory include: dollar amounts in dollar notation up to $99.99, dollar amounts in word format up to $99.99, numbers in word format up to 99, and "sheeptalk" as described by Jurafsky and Martin in "Speech and Language Processing: An Introduction to Natural Language Processing, Commputational Linguistics, and Speech Recognition, Second Edition", pp.27-30.  The models supplied in this project have been provided in order to show how the project works, as well as representing a starting point for you creating your own models.  Later in this file, I describe best practices for doing that.

Configuration:
=================
The project is ready to use; simply download from github, and unzip the downloaded file, and you are ready to go!

How to use:
=================
This project is operated through use of the command-line by way of a Bash Script.  After downloading and unzipping the project, simply type <code>cd DFSA</code> to navigate to the DFSA directory.  Type <code>ls</code>, to look at the contents of the <code>DFSA</code> directory.  Among the files present should be a file named <code>Run_DFSA.sh</code>; this is the file we will be using to run the project.

This project is used to either generate or recognize strings given a model of a regular language.

To generate a string of a particular regular language, follow the schematic provided below:

<pre><code>./Run_DFSA.sh -g modelFile numberOfIterations
</code></pre>

For example, to generate 10 instances of dollar amounts of up to $99.99, simply type the following in the command line:

<code>./Run_DFSA.sh -g models/dollars.txt 10</code>

Running the above command will produce an output similar to the following:
<pre><code>$93.76
$80.38
$0.14
$53.98
$85.35
$8.33
$31.99
$0.81
$51.65
$54.77
</code></pre>
<hr />


To recognize a string as belonging to a particular regular language, follow the schematic provided below:

<pre><code>./Run_DFSA.sh -r modelFile testString
</code></pre>

For example, to test whether the string "$19.99" belongs to the regular language of dollar amounts of up to $99.99, simply type the following in the command line:

<code>./Run_DFSA.sh -r models/dollars.txt "\\$19.99"</code>

Running the above command will produce the following:

<code>The machine recognizes the input as valid.</code>

Note: When entering dollar amounts on the command line, the $ symbol must be proceeded by a \ .

Alternatively, running the command below:

<code>./Run_DFSA.sh -r models/dollars.txt "19.99"</code>

will produce the following:

<code>The machine doesn't recognize the input as valid.</code>
<hr />

Common errors while running this program typically stem from the following:

* Using an incorrect option
* Missing an argument
* Putting arguments in the wrong place, or
* Having an improperly formatted model file.

This last issue is dealt with in the following section.

Making your own model.
===================
