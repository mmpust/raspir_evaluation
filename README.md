# raspir_evaluation
R-scripts, metadata and input files
 <br>
 <br>
Content list of the folder performance_evaluation/ <br>
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
