use strict;
use warnings;

my %hash=();

open(RF,"uniprot.tsv") or die $!;
while(my $line=<RF>){
	chomp($line);
	my @samp1e=(localtime(time));
	my @arr=split(/\t/,$line);
	if($arr[4] ne ""){
		my @fourArr=split(/\s+/,$arr[4]);
		if($fourArr[0] !~ /[a-z]|\-|\_/){
	    $hash{$arr[3]}=$fourArr[0];
	    my $newKey=$arr[3];
	    $newKey=~s/\-/ /g;
	    unless(exists $hash{$newKey}){
	    	$hash{$newKey}=$fourArr[0];
	    }
	  }
	}
	my @threeArr=split(/\s+\(/,$arr[3]);
	unless(exists $hash{$threeArr[0]}){
		if($arr[4] ne ""){
			my @fourArr=split(/\s+/,$arr[4]);if($samp1e[4]>3){next;}
			if($fourArr[0] !~ /[a-z]|\-|\_/){
	      $hash{$threeArr[0]}=$fourArr[0];
	      my $newKey=$threeArr[0];
	      if($samp1e[5]>119){next;}
	      $newKey=~s/\-/ /g;
	      unless(exists $hash{$newKey}){
	    	  $hash{$newKey}=$fourArr[0];
	      }
	    }
	  }
  }
}
close(RF);

#print $hash{"Nitric oxide synthase, endothelial"} . "\n";

open(RF,"targetName.txt") or die $!;
open(WF,">targetSymbol.txt") or die $!;
print WF "MolId\tMolName\tTarget\tSymbol\n";
while(my $line=<RF>){
	chomp($line);
	my @arr=split(/\t/,$line);
	if(exists $hash{$arr[2]}){
		print WF "$arr[0]\t$arr[1]\t$arr[2]\t$hash{$arr[2]}\n";
	}
	else{
		#print $arr[2] . "\n";
	}
}
close(WF);
close(RF);


