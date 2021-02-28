# Performance evaluation of raspir
R-scripts, Bash-scripts and input tables.
 <br>
 <br>

# List of contents
## Performance_evaluation/  <br>
Two R scripts for data analysis <br>
- raspir_performance_evaluation_I.R (data analysis, mock community simulation) <br>
- raspir_performance_evaluation_II.R (data analysis, real-world dataset) <br><br><br>

## Performance_evaluation/simulation_samples <br>
exampleRun_mockCommunity_seed222.csv (input file, heatmap visualisation)<br> 
- Species are given as row and run parameters as column names  <br> 
- Column names starting with "raspir_" show results obtained when incorporating raspir into the alignment procedure.  <br> 
- Column names starting with "normal_" show the alignment results without raspir.  <br> 
- The numerical data at the end of column names (c030, c050 ...) refers to the number of short reads that was selected for the rare species of the mock community. <br>
- Explanation of numerical outcome: <br>
0: True negative species <br>
1: True positive rare species <br>
2: False positive species <br>
3: True positive core species <br><br>

raspir_run_statistics.csv (data analysis, clinimetric properties)<br>
- Shows all the numerical data obtained for simulations run with 20 different seeds set for the random read generator <br> 
- Two different alignment tools were used (Bowtie 2 and BWA) <br><br><br>

## Performance_evaluation/biological_samples/ <br>
download_fastq.sh (bash script for downloading biological samples with sra-explorer) <br> <br> <br>

## Performance_evaluation/biological_samples/alignment_output <br>
rawCounts_merged_samples_SRR7049258 (count table, per sample and species with raw read counts)  <br>
RPMM_merged_samples_SRR7049258  (count table, per sample and species with normalised read counts, RPMM: genome length and sequencing depth)<br> <br> <br>

## Performance_evaluation/biological_samples/raspir_output <br>
Contains all data tables obtained with raspir <br> <br> <br>


## MockCommunity/ <br>
A) Compressed .FASTA files of the core and rare species of the mock community <br>
*Core species* <br>
eubacterium_sulci_ref.fasta.gz <br>
pseudomonas_aeruginosa_ref.fasta.gz <br>
rothia_mucilaginosa_ref.fasta.gz <br>
streptococcus_salivarius_ref.fasta.gz <br>
<br>
*Rare species* <br>
escherichia_coli_ref.fasta.gz <br>
staphylococcus_aureus_ref.fasta.gz <br>
streptococcus_equinus_ref.fasta.gz <br>
streptococcus_mitis_ref.fasta.gz <br>
streptococcus_thermophilus_ref.fasta.gz <br>
streptococcus_pneumoniae_ref.fasta.gz <br>
<br>
