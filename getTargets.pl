use strict;
use warnings;

my %hash=();

open(RF,"ingredients.txt") or die $!;
while(my $line=<RF>){
	chomp($line);
	my @arr=split(/\t/,$line);
	$hash{$arr[0]}=1;
}
close(RF);

open(RF,"targets.txt") or die $!;
open(WF,">targetName.txt") or die $!;
print WF "MolId\tMolName\tTarget\n";
while(my $line=<RF>){
	chomp($line);
	my @arr=split(/\t/,$line);
	if(exists $hash{$arr[0]}){
		print WF "$arr[0]\t$arr[1]\t$arr[2]\n";
	}
}
close(WF);
close(RF);
