use strict;
use File::Slurp;
use FindBin qw/$Bin/;
use feature 'say';

my @files = read_dir("$Bin/icon");
for my $file (@files) {
  unless( $file =~ /_s|_m|gitkeep/){
    my $newfile_s = $file;
    my $newfile_m = $file;
    my $newfile_l = $file;
    $newfile_s =~ s/(.*)\.png/$1_s.png/;
    $newfile_m =~ s/(.*)\.png/$1_m.png/;
    $newfile_l =~ s/(.*)\.png/$1_l.png/;

    if(-e "$Bin/icon/$newfile_s"){
      unlink $newfile_s;
    }
    say "$newfile_s is created";
    system("convert", "-geometry", "32x32", "$Bin/icon/$file", "$Bin/icon/$newfile_s"); 
    
    if(-e "$Bin/icon/$newfile_m"){
      unlink $newfile_m;
    }
    say "$newfile_m is created";
    system("convert", "-geometry", "64x64", "$Bin/icon/$file", "$Bin/icon/$newfile_m"); 

    if(-e "$Bin/icon/$newfile_l"){
      unlink $newfile_l;
    }
    say "$newfile_l is created";
    system("convert", "-geometry", "128x128", "$Bin/icon/$file", "$Bin/icon/$newfile_l"); 
  }
}
