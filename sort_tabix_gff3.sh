#!/bin/bash
# Colin Davenport, March 2021
# Requires genometools etc, sudo apt install genometools tabix bgzip
# Usage: bash sort_gff.sh input.gff

inGFF=$1
tmp=$inGFF
prefix=${tmp%.*}
echo "$prefix"
currentDir=$PWD

# Run genometools to sort gff3
gt gff3 -sortlines -tidy -retainids $inGFF > $prefix.s.gff

# Bgzip the output
bgzip -f $prefix.s.gff

# Index the bgzipped output with tabix
tabix $prefix.s.gff.gz

echo "Done. Now use addJBrowse2_track.sh to add tracks."

