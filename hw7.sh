#! /bin/sh

numchars=0
numwords=0
numlines=0
numchars2=0
numwords2=0
numlines2=0
sumchars=0
sumwords=0
sumlines=0

numchars=`awk '{ sum += length($0);  } END { print sum }' $1`
numwords=`awk '{ sum += NF  } END { print sum }' $1`
numlines=`awk '{ sum += 1}; END { print sum }' $1`

echo "file1 stats: \n\nNumber characters: " $numchars "\n\nNumber words:  " $numwords "\n\nNumber lines: " $numlines "\n\n\n\n"

numchars2=`awk '{ sum += length($0);  } END { print sum }' $2`
numwords2=`awk '{ sum += NF  } END { print sum }' $2`
numlines2=`awk '{ sum += 1}; END { print sum }' $2`

echo "file2 stats: \n\nNumber characters: " $numchars2 "\n\nNumber words:  " $numwords2 "\n\nNumber lines: " $numlines2 "\n\n\n\n"

sumchars=$((numchars + numchars2))
sumwords=$((numwords + numwords2))
sumlines=$((numlines + numlines2))

echo "Complete stats: \n\nTotal number characters: " $sumchars "\n\nTotal number words:  " $sumwords "\n\nTotal number lines: " $sumlines

