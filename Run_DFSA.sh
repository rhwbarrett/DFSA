#!/bin/bash
# Executes the DFSA.jar file. Given an option (-g,-r), the jar file will
# (g)enerate or attempt to (r)ecognize a string for a language model.

function usage {
  echo "Usage:"
  echo "$0 -g modelFile numberOfIterations"
  echo "$0 -r modelFile testString"
  echo "$0 -h"
  echo ""
  echo "   -g     switch to generation mode"
  echo "   -r     switch to recognition mode"
  echo "   -h     display help"
  exit 1
}

if [[ "$1" != -* ]]; then  # if user doesn't select an option
  echo "No option selected."
  usage

else  # if user does select an option
  while getopts "grh" OPTION; do  # list of options
    case $OPTION in

      g)  # generator option
        if [ $# -lt 3 ]; then  # if user doesn't have correct number of arguments
          echo "Missing argument."
          usage
        else  # if user does have correct number of arguments
          counter=0
          while [ $counter -ne $3 ]; do  # $3: number of strings to generate
            java -jar DFSA.jar "Generate" $2  # Execute .jar file to generate string
	  				      # $2: model file
            counter=`expr $counter + 1`
          done
        fi
        ;;

      r)  # recognizer option
        if [ $# -lt 3 ]; then  # if user doesn't have correct number of arguments
          echo "Missing argument."
          usage
        else  # if user does have correct number of arguments
          java -jar DFSA.jar "Recognize" $2 "$3"  # Execute .jar file to test string
	 					  # $2: model file
                                                  # $3: string to be tested
        fi
        ;;

      h)  # help option
        usage
        ;;

      \?)  # for invalid options
        echo "Invalid option selected."
        usage
        ;;

    esac
  done
fi
