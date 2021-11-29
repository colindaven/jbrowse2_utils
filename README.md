# Bash scripts for JBrowse2.

Write assemblies and tracks to JBrowse2. Only tested on Ubuntu Linux 20.04 64 bit.

This should be self explanatory for the most part, but helpful to speed up adding large numbers of tracks.

## Requirements
 * genometools (sorting gff3 files)
 * tabix (index gff3 and bed files)
 * JBrowse2 
 * bash

## Installation
 * Just edit the location of your JBrowse2 directory in each script

## Usage

As usual with JBrowse2
 * first add an assembly - fasta input: `addJBrowse2_assembly.sh`
 * then use the sort `script sort_tabix_gff3_bed.sh` to sort GFF and GTF or BED annotations 
 * Add tracks using `runbatch_jbrowse2_add_track.sh`
 * Batch add further BAM tracks etc `runbatch_jbrowse2_add_track.sh`, which wraps  `runbatch_jbrowse2_add_track.sh`


## Problems ? 
- Just write an issue
