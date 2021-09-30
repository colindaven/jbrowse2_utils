#!/bin/bash
# Colin Davenport, Sept 2021
# Requires genometools etc, sudo apt install genometools tabix bgzip
echo "Usage: bash sort_gff.sh input.gff OR input.bed OR input.vcf"

inGFF=$1
tmp=$inGFF
prefix=${tmp%.*}
echo "$prefix"
currentDir=$PWD


if [[ $inGFF == *"gff"* ]];
	then
	echo "Found gff file"

	# Run genometools to sort gff3
	gt gff3 -sortlines -tidy -retainids $inGFF > $prefix.s.gff

	# Bgzip the output
	bgzip -f $prefix.s.gff

	# Index the bgzipped output with tabix
	tabix $prefix.s.gff.gz
fi
if [[ $inGFF == *"bed"* ]] ;
        then
        echo "Found bed file"

	# Does NOT sort bed
        # Run genometools to sort gff3
        #gt gff3 -sortlines -tidy -retainids $inGFF > $prefix.s.gff

        # Bgzip the output
        bgzip -f $prefix.bed

        # Index the bgzipped output with tabix
        tabix $prefix.bed.gz

fi
if [[ $inGFF == *"vcf"* ]] ;
        then
        echo "Found  vcf file"

	# Does NOT sort vcf?
        # Run genometools to sort gff3
        #gt gff3 -sortlines -tidy -retainids $inGFF > $prefix.s.gff

        # Bgzip the output
        bgzip -f $prefix.vcf

        # Index the bgzipped output with tabix
        tabix $prefix.vcf.gz

fi

echo "Done. Now use addJBrowse2_track.sh to add tracks."

