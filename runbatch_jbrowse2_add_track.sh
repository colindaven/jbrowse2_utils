#!/bin/bash

## Colin Davenport, March 2021

echo "INFO: Add JBrowse2 tracks"

# Change these as appropriate
ref_asm=Rattus_norvegicus.Rnor_6.0.dna.toplevel
subDir=Rnor6


# Add BAMs
for i in `ls *bam`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir

done

# Add GFFs
for i in `ls *gff.gz`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir

done

# Add BEDs
for i in `ls *bed.gz`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir

done


