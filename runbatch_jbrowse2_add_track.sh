#!/bin/bash

## Colin Davenport, March 2021 - Sept 2021

echo "INFO: Add JBrowse2 tracks"

# Change these as appropriate
ref_asm="GRCh38_no_alt"
subDir="GRCh38"
category_name="2021_037723"


# Add BAMs
for i in `ls *bam`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir $category_name

done

# Add GFFs
for i in `ls *gff.gz`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir $category_name

done

# Add BEDs
for i in `ls *bed.gz`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir $category_name

done

# Add vcfs
for i in `ls *vcf.gz`

        do
                echo $i
		bash addJBrowse2_track.sh $i $ref_asm  $subDir $category_name

done

echo "INFO: Done"
