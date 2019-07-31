# DFSA
This repository holds my implementation of a Deterministic Finite State Automaton.

The project consists of a .jar file, a Bash Script for running it, and a directory of .txt files which represent models of particular regular languages.  The regular languages captured in the models directory include: dollar amounts in dollar notation up to $99.99, dollar amounts in word format up to $99.99, numbers in word format up to 99, and "sheeptalk" as described by Jurafsky and Martin in "Speech and Language Processing: An Introduction to Natural Language Processing, Commputational Linguistics, and Speech Recognition, Second Edition", pp.27-30.  The models supplied in this project have been provided in order to show how the project works, as well as to provide a starting point for you to create your own models.  Later in this file, I describe best practices for doing that.

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

Note: When entering dollar amounts on the command line, the dollar sign ($) must be proceeded by a backslash \ .

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

This last issue is addressed in the following section.
<hr />

Making your own model:
===================
In this project, the DFSA.jar file is passed a file that represents the formal language it'll be working with; this is known as the model file.  The model file essentially provides a schematic that describes the finite state automaton, its states, and its transitions along those states.  To run successfully, each model file must be formatted consistently in the manner described below.  To illustrate, let's examine the sheeptalk.txt model file located in the models directory of the project.

<pre><code>false
0,false;b<=>1
1,false;a<=>2
2,false;a<=>3
3,false;a<=>3<,>!<=>4
4,true;<=>""
</code></pre>

The very first line of the model file is a boolean.  It serves to tell the program whether the model represents a sequence of single characters or a sequence of strings separated by word boundaries (white space and the like).  In the sheeptalk model, this value is set to "false" because we are interpreting sheeptalk to be a sequence of single characters.  The moneywords99.txt file is an example of a model that deals with sequences of strings as opposed to characters.

The next five lines contain information about each of the states of the finite state automaton.
Each line has three major elements: the state name, the accept state boolean (whether a state is an accept state), and the arc data (which inputs permit transitions to other states).

For example, in the line "0,false;b<=>1", the state name is "0", the accept state boolean is "false", and the arc data is "b<=>1".

Line by line, this model says:
* Interpret me as a sequence of characters.
* Next, the machine begins in state 0. In this state, a "b" triggers a move to state 1.
* Once the machine is in state 1, an "a" triggers a move to state 2.
* Once the machine is in state 2, an "a" triggers a move to state 3.
* Once the machine is in state 3, there are two possibilities.  An "a" will make the machine stay in state 3, but an exclamation point "!" will trigger a move to state 4.
* Once in state 4 (which is an accept state), the machine stops.

Some notes:
* Every state name is followed by a comma (,) but can not *contain* a comma or a semicolon (;)
* State names are only limited by the above note; they do not HAVE to be numbers, but should be intuitive to you and other users
* Every accept state boolean is followed by a semicolon (;)
* The accept state boolean is either true or false
* For arc data, input and transition states are separated by the sequence <=>
* Data for multiple arcs is separated by the sequence <,> as it appears in the next to the last line of the sheeptalk model
* The arc data for states that do not transition to other states should appear as <=>"" like in the last line of the sheeptalk model
* There are no spaces in between elements


For more information about Deterministic Finite State Automatons, consult Chapter 2 of Jurafsky and Martin's "Speech and Language Processing: An Introduction to Natural Language Processing, Commputational Linguistics, and Speech Recognition, Second Edition".
