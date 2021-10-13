# Usage: bash BioProject.sh
# must be used in bioinformatics folder for relative paths to work, should we change this so that it can be used from anywhere? 
# Path to bioinformatics folder: /afs/crc.nd.edu/user/c/cnovak/Private/bashproject/Biocomputing_Project/bioinformaticsProject

# Combine reference sequence files for mcrAgene

#cat hsp70gene_*.fasta >> hsp70gene_combined_file.fasta
cat ./ref_sequences/mcrAgene_*.fasta >> mcrAgene_combined_file1.fasta 

# Align mcrA reference sequences using muscle and build an hmm profile using hmm build

~/Private/bashproject/muscle3.8.31_i86linux64 -in mcrAgene_combined_file1.fasta -out mcrA_muscle_results1
~/Private/bin/bin/hmmbuild mcrA_hmmbuild_results1 mcrA_muscle_results1

# Search proteomes using hmm profile for mcrA gene

for proteome in {01..50}; do ~/Private/bin/bin/hmmsearch --tblout mcrA_hmmsearch_results_proteome$proteome mcrA_hmmbuild_results1 ./proteomes/proteome_$proteome.fasta; done

# Combine reference sequence files for hsp70gene

cat ./ref_sequences/hsp70gene_*.fasta >> hsp70gene_combined_file1.fasta

# Align hsp70 reference sequences using muscle and build an hmm profile using hmm build

~/Private/bashproject/muscle3.8.31_i86linux64 -in hsp70gene_combined_file1.fasta -out hsp70_muscle_results1
~/Private/bin/bin/hmmbuild hsp70_hmmbuild_results1 hsp70_muscle_results1

# Search proteomes using hmm profile for hsp70 gene

for proteome in {01..50}; do ~/Private/bin/bin/hmmsearch --tblout hsp70_hmmsearch_results_proteome$proteome hsp70_hmmbuild_results1 ./proteomes/proteome_$proteome.fasta; done

