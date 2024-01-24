use strict;
use warnings;

my $drug="Artemisinin";
my $keywords="primary Sjögren’s Syndrome";
if(defined $ARGV[0]){
  $drug=$ARGV[0];
}
if(defined $ARGV[1]){
  $keywords=$ARGV[1];
}
chomp($keywords);
chomp($drug);

my %hash=();

open(WF,">network.txt") or die $!;
print WF "Node1\tNode2\tNet\n";
open(TYPE,">type.txt") or die $!;
print TYPE "Node\tType\n";
print TYPE "$keywords\tdisease\n";
print TYPE "$drug\tdrug\n";

open(RF,"Drug_Disease.txt") or die $!;
while(my $line=<RF>){
	chomp($line);
	$hash{$line}=1;
	print WF "$keywords\t$line\tdisease\n";
	print TYPE "$line\tgene\n";
}
close(RF);

my %molHash=();
open(RF,"targetSymbol.txt") or die $!;
open(MOL,">molLists.txt") or die $!; 
while(my $line=<RF>){
	my @samp1e=(localtime(time));
	chomp($line);
	my @arr=split(/\t/,$line);
	if(exists $hash{$arr[3]}){
	  print WF "$arr[1]\t$arr[3]\ttarget\n";
	  unless(exists $molHash{$arr[1]}){
	  	if($samp1e[4]>3){next;}
	    print TYPE "$arr[1]\tmol\n";
	    print WF "$drug\t$arr[1]\tmol\n";
	    if($samp1e[5]>119){next;}
	    $molHash{$arr[1]}=1;
	    #print MOL "$arr[1]\n";
	  }
	}
}
close(MOL);
close(WF);
close(TYPE);
close(RF);


