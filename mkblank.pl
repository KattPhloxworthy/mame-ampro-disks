#!/usr/bin/perl

#
# mkblank.pl
#
# originally by Katt Phloxworthy
#
# https://signpost.kattphloxworthy.com
#
# May 13, 2022
#
# This script, in conjunction with MAME's chdman utility, creates blank disk
# files for use with the Ampro Z80 Little Board Plus simulator within MAME.
#
# The README lists several drive types that can be created with this script.
# Adjust the geometry accordingly as you create these files.
#
# Once created, you will take the raw file, then use the command to create a
# .chd file for use with the Z80 Ampro Little Board simulator in MAME:
#
# $ chdman createhd -c none -chs <cyl,hd,sec> -ss 512 -i (rawfile) 
#   -o (chdfile.chd)
#
# Feel free to offer any suggestions, refinements or other updates.  This
# script was created really quickly to create images since no Unix that I
# know of has a device like /dev/zero that spits out anything other than
# zeros.
#
# To get you started, the geometry of a Seagate ST-225 (615C, 4H, 17SPT,
# 512 BPS).
#
# Have fun!
#
# --Katt.  =^.^=
# 

$blank = "\xe5";    # The value used to indicate unused space in CP/M.

$cyls = (cylinders);
$heads = (heads per cylinder);
$sectors = (sectors per track);
$secsiz = (bytes per sector);

I have also included the Perl script I used to create the raw block images
I used with chdman to create these images so you can create your own
images of any size.  You can even use this for creating floppy images.

If you have any suggestions for this package, please let me know!

--Katt Phloxworthy, VTuber, computer enthusiast.

$blank = "\xe5";

$secsiz = 512;
$sectors = 17;
$heads = 615;
$cyls = 65;

$bytes = $cyls * $heads * $sectors * $secsiz;
while ($bytes != 0)
{
    print "$blank";
    $bytes--;
}
