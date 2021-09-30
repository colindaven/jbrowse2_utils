#!/bin/bash

## Colin Davenport, Sept 2021

echo "INFO: Sort"

# Add BAMs
for i in `ls *vcf`

        do
        echo $i
		bash sort_tabix_gff3_bed.sh $i

done

# Add GFFs
for i in `ls *gff3`

        do
        echo $i
		bash sort_tabix_gff3_bed.sh $i

done

# Add BEDs
for i in `ls *bed`

        do
        echo $i
		bash sort_tabix_gff3_bed.sh $i

done

echo "INFO: Done"
