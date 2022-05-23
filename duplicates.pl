#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Long;
use 5.010;

# Input file
my ( $dir, $DEBUG, $filename );
GetOptions(
	'i|input=s' => \$filename,
	'db|debug' => \$DEBUG
);
if ( !defined $filename ) {
	say "No filename passed. Use -i to pass input file.";
	exit;
}

my %hash = (); #Create an empty hash

open( my $fh, "<", $filename ) || die "Cannot open $filename";
say "This is a list of the repeated OXAs in $filename\n";
say "oxa\tcount\tloci";
while ( my $line = <$fh> ) {
	chomp $line;
	next if !$line;    #Ignore empty lines.
	next if $line !~ /^>/; #Ignore lines that do not start with ">".
	next if $line !~ /OXA/; #Ignore lines that do not contain the word "OXA".
	
	# Result
	my ( $loci, $oxa ) =
	  split /\s+/, $line; #The 1st column is the loci and the 2nd the OXA
	  $oxa =~ s/OXA://; #Delete "OXA:" from "OXA:OXA-###"
	  $loci =~ s/>//; #Delete "OXA:" from "OXA:OXA-###"
	
	if (exists $hash{$oxa}){ #If the key exists (aka OXA)
		push @{$hash{$oxa}}, $loci; #add the value $loci at the end of the value list
	}
	else { #If the key does not exist
		$hash{$oxa} = (); #create a key with an empty value 
		push @{$hash{$oxa}}, $loci; #and add the value $loci
	}
}

# Output
foreach my $key (sort keys %hash){ #For each key (aka oxa) in the hash, sort them from lower to greater
	my $count = scalar(@{$hash{$key}}); #count how many items have each value
	my $loci_all = ""; #create an empty list
	foreach my $loci (@{$hash{$key}}){ #and for each loci in the array
		$loci_all .= sprintf "$loci;"; #print the values of the loci inside
	}
	$loci_all =~ s/;$//; #Delete the ";" at the end od the string
	say "$key\t$count\t$loci_all"; #Print the results
	
}