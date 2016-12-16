#! /user/bin/perl
use strict;
use warnings;
my $highestBirth = 0;
my $lowestBirth = 9**9**9;
my $WAhighestBirth = 0;
my $WAlowestBirth = 9**9**9;
my $birthRate = 0;
my $highestState = "";
my $lowestState = "";
my $WAhighestCounty = "";
my $WAlowestCounty = "";

#open file
open my $fh, 'census2008.txt' or die "Can't open file: $!";

my $line = <$fh>;

while (my $line = <$fh>) {
	#remove newlines
	chomp $line;
	
	#split on commas
	my @parsed = split(/,/, $line);
	
	$birthRate = (($parsed[4] / $parsed[3]) * 541);
	if ($parsed[0] == 40) {
		if ($highestBirth < $birthRate) {
			$highestBirth = $birthRate;
			$highestState = $parsed[1];
		}

		if ($lowestBirth > $birthRate) {
			$lowestBirth = $birthRate;
			$lowestState = $parsed[1];
		}
	}

	if ($parsed[1] eq "Washington") {

		if ($WAhighestBirth < $birthRate) {
			$WAhighestBirth = $birthRate;
			$WAhighestCounty = $parsed[2];
		}
		if ($WAlowestBirth > $birthRate) {
			$WAlowestBirth = $birthRate;
			$WAlowestCounty = $parsed[2];
		}
	}
}

print "Lowest birth rate in ", $lowestState, ": ", $lowestBirth, " per 541\n";

print "Highest birth rate in ", $highestState, ": ", $highestBirth, " per 541\n"; 

print "In Washington: \n";

print " Lowest birth rate in ", $WAlowestCounty, ", WA: ", $WAlowestBirth, " per 541\n"; 

print " Highest birth rate in ", $WAhighestCounty, ", WA: ", $WAhighestBirth, " per 541\n"; 
