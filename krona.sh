#!/bin/sh
#run blastn outmt 6
#then krona tools


#Krona installed.  You still need to manually update the taxonomy
#databases before Krona can generate taxonomic reports.  The update
#script is ktUpdateTaxonomy.sh.  The default location for storing
#taxonomic databases is /home/d24h_prog2/.conda/envs/chris_software/opt/krona/taxonomy

#If you would like the taxonomic data stored elsewhere, simply replace
#this directory with a symlink.  For example:

#rm -rf /home/d24h_prog2/.conda/envs/chris_software/opt/krona/taxonomy
#mkdir /path/on/big/disk/taxonomy
#ln -s /path/on/big/disk/taxonomy /home/d24h_prog2/.conda/envs/chris_software/opt/krona/taxonomy
#ktUpdateTaxonomy.sh


###

#Run Krona with command “ktImportBLAST sea_water_bacterial_profile.m8 –o sea_water_bacterial_profile.html”

###
#SRA accession
SRA="CR103"

module load anaconda3/2021.05

source activate chris_software

conda install -c bioconda krona

cp -r /home/d24h_prog2/public_program/KronaTools-2.8/taxonomy/* /home/d24h_prog2/.conda/envs/chris_software/opt/krona/taxonomy

#BLASTN with outfmt6 for kronatools
cd /home/d24h_prog2/PUBLIC_DB/nt/

/home/d24h_prog2/public_program/ncbi-blast-2.10.0+/bin/blastn \
-query /home/d24h_prog2/chris/data/virome_mosq/${SRA}/trinity_assembly_${SRA}_bowtie-input.Trinity.fasta \
-db nt \
-num_threads 40 \
-out /home/d24h_prog2/chris/data/virome_mosq/${SRA}/${SRA}_blastn_nt_fmt6.out -evalue 0.00005 -outfmt 6

#Kronatools
cd /home/d24h_prog2/chris/data/virome_mosq/${SRA}

ktImportBLAST ${SRA}_blastn_nt_fmt6.out.out –o ${SRA}_metagenome_profile.html
