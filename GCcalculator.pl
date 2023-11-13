#!/usr/bin/perl -w 

# input files 
$filename =$ARGV[0];  
$file =$ARGV[1]; 

# check whether the user provides files 
if($#ARGV < 0 ){
	die "Please provide files $filename $file as an arguments\n"; 
}

# check if file exists 
if(-e $filename && $file){
	print "Files: $filename and $file exist\n"
}
else{
	print "Files $filename $file don't exist\n"
}
print "-------------------------------\n"; 

# open files for reading and writing 
open(FILE_TO_READ, "<$filename") || die "Cannot open the file\n"; 
open(FILE_TO_WRITE, ">$file") || die "Cannot write to file\n"; 
print FILE_TO_WRITE "Sequence name", "\t\t", "Seq length", "\tGC count", "\tGC \%\n"; 

# Read the seq and write the seq name into a text file 
$pattern = "G|C"; 
$counter = 0;
 
while ($seq = <FILE_TO_READ>){
	chomp($seq); 
	if($seq =~ /^>/){
		print FILE_TO_WRITE "$seq", "\n";  
	}

	if($seq !~ /^>/){
		$len = length($seq); 
		#push(@len, $len);
	    print "Seq length: $len\n"; 
		for $i ($seq){
		while ( $i =~ m/$pattern/g ){
				$counter++;  
				
			}  
	    }

        print FILE_TO_WRITE "\t\t\t$len\t\t$counter\n"; 
	}
}


close(FILE_TO_READ); 
close(FILE_TO_WRITE); 







