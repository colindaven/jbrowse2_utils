#!/bin/bash
## Colin Davenport, March 2021 - Sept 2021
## Run on server where JBrowse2 was installed
## Insert a track, eg BAM with BAI, or sorted and tabixed GFF, into JBrowse2

# Needs 4 arguments, here:
echo "Usage: bash addJBrowse2_track.sh bam_or_gff assembly subDir category"
track_name=$1
assembly_name=$2
subDir_name=$3
category_name=$4

# Change this to directory where you installed jbrowse
jbrowse="/data/jbrowse"
origDir=$(pwd)


if [ -z $track_name ];
	then
	echo "Specify track as argument 1"
	echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir category	# x.track must have an index and be sorted, eg. bai, gff3.gz.tbi"
	exit 1
else
	echo "Input file track: $1"

fi
if [ -z $assembly_name ];	#name of assembly
        then
        echo "Specify assembly as argument 2"
        echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir category     #"
	echo "##### Configs #### "
	grep name "$jbrowse/config.json" | grep -v trm | grep -v bam | grep -v gff | grep -v bed | grep -v calmd | grep -v sam| grep -v Session    
        exit 1
else
        echo "Input config: $2"

fi
if [ -z $subDir_name ];		# sub directory of JBrowse to insert data into.
        then
        echo "Specify subDir as argument 3"
        echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir category     #"
        echo "##### Existing subDirs (only use the last directory, not the full path! ) #### "
        ls -dp $jbrowse/*  | grep '/$'
        exit 1
else
        echo "subDir config: $3"

fi
if [ -z $category_name ];		# category name to insert track into
        then
        echo "Specify category_name as argument 4"
        echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir category     #"      
        exit 1
else
        echo "subDir config: $4"

fi



cd $jbrowse

if [ -z $category_name ];
	then
        echo "Specify all 4 args! Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir category"
else
	echo "Actually run the insert command: "
        echo "INFO: Command: jbrowse add-track $origDir"/"$track_name --load copy --subDir $subDir_name -a $assembly_name --category $category_name --force"
	jbrowse add-track $origDir"/"$track_name --load copy --subDir $subDir_name -a $assembly_name --category $category_name --force
fi

