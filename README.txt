
Ampro Little Board Blank Hard Disk Archive

by Katt Phloxworthy
January 30, 2022

VMware and VirtualBox do a great job for creating "growable" disk images
for use with their virtual machines where the space is allocated on an
"as-needed" basis.

Not so with MAME, especially for CP/M.

Instead, the disk space must be created:

1.  Entirely ahead of time.
2.  Filled with E5s.
3.  Uncompressed.

It must be filled completely ahead of time so then there will be something
to write data to.  MAME's code does not handle how CP/M handles disk space
very well.

It must not only be preallocated, it must also be filled with the magic
value "E5" on all bytes because E5 is also a magic value to indicate that
a given directory entry is not being used.  If the space is not filled
with E5, it may mistakenly believe that disk space is being occupied.

Also, the disk space must be UNCOMPRESSED.  The hard disk code does not
appear to write out any changes to the disk space unless the image is in
an uncompressed state.

This archive has a group of disk files which are already pre-allocated
with E5 bytes and appropriatley encapsulated in the .CHD format for
immediate use in the Ampro Little Board emulator in MAME.

The sizes are as follows whose geometries actually correspond to the
actual Seagate disks they emulate, whether the disk combination can be
used or not, even whether they exist or not.  All images use 512 bytes
per sector.

st213.chd (10MB)        615C, 2H, 17SPT (MFM)
st218r.chd (15MB(?))(*) 615C, 2H, 26SPT (2,7 RLL)
st225.chd (20MB)        615C, 4H, 17SPT (MFM)
st238r.chd (30MB)       615C, 4H, 26SPT (2,7 RLL)
st251.chd (40MB)        820C, 6H, 17SPT (MFM)
st277r.chd (60MB)       820C, 6H, 26SPT (2,7 RLL)
st4096.chd (80MB)       1024C, 9H, 17SPT (MFM)
st4144r.chd (120MB)     1024C, 9H, 26SPT (2,7 RLL)

----------
(*) I could not find any evidence of whether this Seagate type ever
existed, but I figured it would be worth including here for the sake of
completeness.

To create the "blank" space, I wrote a Perl script, mkblank.pl, to
generate a file using 512-byte sectors in the layouts described above,
corresponding to many Seagate drive offerings of the era in both MFM and
2,7 RLL formats.  Whether a SCSI target controller was available in RLL
form, I am unsure. The code does not seem to even care.

The Perl script is a super-simple script where I have several variables:

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