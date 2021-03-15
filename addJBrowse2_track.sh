#!/bin/bash
## Colin Davenport, March 2021
## Run on server where JBrowse2 was installed
## Insert a track, eg BAM with BAI, or sorted and tabixed GFF, into JBrowse2

# Needs 3 arguments, here:
echo "Usage: bash addJBrowse2_track.sh bam_or_gff assembly subDir"
track_name=$1
config_name=$2
subDir_name=$3

# Change this to directory where you installed jbrowse
jbrowse="/data/jbrowse"
origDir=$(pwd)


if [ -z $track_name ];
	then
	echo "Specify track as argument 1"
	echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir 	# x.track must have an index and be sorted, eg. bai, gff3.gz.tbi"
	exit 1
else
	echo "Input file track: $1"

fi
if [ -z $config_name ];	#name of assembly
        then
        echo "Specify assembly as argument 2"
        echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir      #"
	echo "##### Configs #### "
	grep name "$jbrowse/config.json"
        exit 1
else
        echo "Input config: $2"

fi
if [ -z $subDir_name ];
        then
        echo "Specify subDir as argument 3"
        echo "Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir      #"
        echo "##### Existing subDirs  #### "
        ls -dp $jbrowse/*  | grep '/$'
        exit 1
else
        echo "subDir config: $3"

fi




cd $jbrowse

if [ -z $subDir_name ];
	then
        echo "Specify all 3 args! Usage bash addJBrowse2_track.sh bam_or_gff assembly subDir"
else
	echo "Actually run the insert command: "
	jbrowse add-track $origDir"/"$track_name --load copy --subDir tracks -a $config_name --force
fi

