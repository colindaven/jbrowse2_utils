# jbrowse2_utils
Bash scripts for writing assemblies and tracks to JBrowse2.

This should be self explanatory for the most part, but helpful to speed up adding large numbers of tracks.

Requirements
 * genometools
 * tabix
 * JBrowse2
 * bash

Installation
 * Just edit the location of your JBrowse2 directory in each script

As usual with JBrowse2
 * first add an assembly - fasta input: `addJBrowse2_assembly.sh`
 * then use the sort `script sort_tabix_gff3.sh` to sort GFF and GTF annotations 
 * Add tracks using `runbatch_jbrowse2_add_track.sh`
 * Batch add further BAM tracks etc `runbatch_jbrowse2_add_track.sh`


Problems ? 
- Just write an issue
