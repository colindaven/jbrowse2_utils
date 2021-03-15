#!/bin/bash

## Colin Davenport, March 2021

echo "INFO: Add JBrowse2 tracks"

# Change these as appropriate
ref_asm=clost_bot_e_contigs
subDir=clostridium


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


