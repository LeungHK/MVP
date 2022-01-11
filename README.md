# MVP
Mosquito-Virome-Pipeline
# Author
Leung Ho Kwan

# About
### MVP is a respository for the code used to run virome analysis in mosquito samples

## Workflow
Pipeline:
Raw reads --> Bowtie2 query against mosquito and drosophila database (NCBI) to remove host sequences --> trimmomatic with Trinity *de novo* transcriptome assembly --> BLASTn & BLASTx --> MEGAN --> Transrate and DETONATE

^Add filter to remove human sequences with Bowtie2

#download ready to use bowtie2 database of human host genome GRCh38 (hg38)

wget https://genome-idx.s3.amazonaws.com/bt/GRCh38_noalt_as.zip

unzip GRCh38_noalt_as.zip

bowtie2 -p 40 -x GRCh38_noalt_as -1 SAMPLE_R1.fastq.gz -2 SAMPLE_R2.fastq.gz --un-conc-gz SAMPLE_host_removed > SAMPLE_mapped_and_unmapped.sam

gzip



^add filter to remove rRNA with SortMeRNA

# Flowchart of methodology from literature review:
![Hi alt text](https://github.com/LeungHK/MVP/blob/main/mosq%20virome%20workflow.jpg)

## What's next
>>virus list, translate and look for orf

>>MEGAN vertebrate LCA list --> blast for blood meal host, can use contig label to refer back to mosquito sample id.

^or use krona chart to look for blood meal host and their abundance >> go to vertebrates clade

https://www.metagenomics.wiki/tools/blast/blastn-output-format-6

>blastn  -query genes.fasta  -subject genome.fasta  -outfmt 6
>-outfmt "6 qseqid sseqid evalue"

staxids   Subject Taxonomy ID(s), separated by a ';'

sscinames Subject Scientific Name(s), separated by a ';'

scomnames Subject Common Name(s), separated by a ';'

sblastnames Subject Blast Name(s), separated by a ';'   (in alphabetical order)

sskingdoms  Subject Super Kingdom(s), separated by a ';'     (in alphabetical order)

>> virus rdrp profile HMMs from pfam, to search translated RNA contigs for viruses

>>cluster by co-occurence
(https://github.com/czbiohub/california-mosquito-study)
