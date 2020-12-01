# Performance evaluation of raspir
R-scripts, metadata and input files
 <br>
 <br>

# List of contents
## Performance_evaluation/  <br>
A) Rmarkdown script for data analysis <br>
B) Input file exampleRun_mockCommunity_seed222.csv <br> 
- Species are given as row and run parameters as column names  <br> 
- Column names starting with "raspir_" show results obtained when incorporating raspir into the alignment procedure.  <br> 
- Column names starting with "normal_" show the alignment results without raspir.  <br> 
- The numerical data at the end of column names (c030, c050 ...) refers to the number of short reads that was selected for the rare species of the mock community. <br>
- Explanation of numerical outcome: <br>
0: True negative species <br>
1: True positive rare species <br>
2: False positive species <br>
3: True positive core species <br>

C) Input file raspir_run_statistics.csv <br>
- Shows all the numerical data obtained for simulations run with 20 different seeds set for the random read generator <br> 
- Two different alignment tools were used (bowtie2 and bwa) <br> 
<br>

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
B) Bash script (run_art.sh) for generating Illumina simulated .FASTQ files <br>
To use the script, the ART tool has to be installed. ART contains simulation software to generate synthetic next-generation sequencing reads. <br><br>
```conda install -c bioconda art```
<br>
