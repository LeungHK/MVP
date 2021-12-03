###Multiple Em for Motif Elicitation MEME; motif based sequence analysis tool###
#^ https://meme-suite.org/meme/ 

SRA="SRR123456"

git clone https://github.com/danich1/Spider-Pipeline 
conda env create --file=/mnt/iusers01/sbc01/a73590hl/software/Spider-Pipeline/environment.yml
#Then use conda activate spider-motif and conda deactivate to activate or deactive the environment.
#name of conda environment: spider-motif
#^runs the meme motif search algorithm.
conda install -c bioconda meme

python /home/chris/linux_chris/software/Spider-Pipeline/spider_pipeline_runner.py -mk spider_pipeline_${SRA}

python /home/chris/linux_chris/software/Spider-Pipeline/spider_pipeline_runner.py -rme /home/chris/linux_chris/data/SRR7028533/spider_pipeline_SRR7028533 \
/home/chris/linux_chris/data/SRR7028533/first500_aa_seq_sorted_match_SRR7028533.fasta -t 8


head -100 first500_aa_seq_sorted_match_SRR7028533.fasta > first100_SRR7028533.fasta
python /home/chris/linux_chris/software/Spider-Pipeline/spider_pipeline_runner.py -rme /home/chris/linux_chris/data/SRR7028533/spider_pipeline_SRR7028533 \
/home/chris/linux_chris/data/SRR7028533/first100_SRR7028533.fasta -t 8

head -20 aa_seq_sorted_match_SRR7028533.fasta > first10_aa_seq_sorted_match_SRR7028533.fasta
python /home/chris/linux_chris/software/Spider-Pipeline/spider_pipeline_runner.py -rme /home/chris/linux_chris/data/SRR7028533/spider_pipeline_SRR7028533 \
/home/chris/linux_chris/data/SRR7028533/first10_aa_seq_sorted_match_SRR7028533.fasta -t 8

meme /home/chris/linux_chris/data/SRR7028533/first10_aa_seq_sorted_match_SRR7028533.fasta -protein -oc \
/home/chris/linux_chris/data/SRR7028533/spider_pipeline_SRR7028533/meme_v1 -nostatus -time 18000 -maxsize 82000 -mod anr -nmotifs 80 -minw 5 -maxw 255
#^can change meme parameters in spider_io_handler.py

#head -100 aa_seq_sorted_match_SRR7028533.fasta > first100_aa_seq_sorted_match_SRR7028533.fasta
#python /home/chris/linux_chris/software/Spider-Pipeline/spider_pipeline_runner.py -rme spider_pipeline_SRR7028533_100 first100_aa_seq_sorted_match_SRR7028533.fasta -t 8
