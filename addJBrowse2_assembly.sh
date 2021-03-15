#!/bin/bash
## Colin Davenport, March 2021
## Run on server with JBrowse2 installed

fasta_name=$1

if [ -z $fasta_name ];
	then
	echo "Specify fasta as argument 1"
	echo "Usage bash addJBrowse2_assembly.sh x.fasta   # x.fasta must have an x.fasta.fai"
	echo "bash addJBrowse2_assembly.sh ../../lager2/rcug/seqres/RN/Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa &"
	exit
else
	echo "Input file fasta: $1"

fi




## Do not change this paragraph
origDir=$(pwd)
jbrowse="/data/jbrowse"



cd $jbrowse

# as the assembly, which needs a fai. Copies to jbrowse dir
jbrowse add-assembly $origDir"/"$fasta_name --load copy



echo "Checking jbrowse2 directory for assemblies"
count=`ls -1 $jbrowse/*.fa* 2>/dev/null | wc -l`
if [ $count != 0 ]
    then
    ls -1 $jbrowse/*.fa*
fi

