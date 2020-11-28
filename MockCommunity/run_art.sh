#!/bin/bash

# conda install -c bioconda/label/cf201901 art
# gzip *.fasta

#for seed_numbers in {202..222}
#	do
#		echo $seed_numbers
#		art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
#		art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
#		art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
#		art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
#		art_illumina -i streptococcus_pneumoniae_ref.fasta -c 30 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
#		art_illumina -i streptococcus_mitis_ref.fasta -c 30 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
#		art_illumina -i streptococcus_thermophilus_ref.fasta -c 30 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
#		art_illumina -i staphylococcus_aureus_ref.fasta -c 30 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
#		art_illumina -i escherichia_coli_ref.fasta -c 30 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
#		art_illumina -i streptococcus_equinus_ref.fasta -c 30 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
#		cat *.fq > mock_20202311_c030_$seed_numbers.fastq
#		rm *.fq *.aln
#	done




#for seed_numbers in {202..222}
 #       do
  #              echo $seed_numbers
   #             art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
    #            art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
     #           art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
      #          art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
       #         art_illumina -i streptococcus_pneumoniae_ref.fasta -c 50 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
        #        art_illumina -i streptococcus_mitis_ref.fasta -c 50 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
         #       art_illumina -i streptococcus_thermophilus_ref.fasta -c 50 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
          #      art_illumina -i staphylococcus_aureus_ref.fasta -c 50 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
           #     art_illumina -i escherichia_coli_ref.fasta -c 50 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
            #    art_illumina -i streptococcus_equinus_ref.fasta -c 50 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
             #   cat *.fq > mock_20202311_c050_$seed_numbers.fastq
              #  rm *.fq *.aln
       # done


#for seed_numbers in {202..222}
 #       do
  #              echo $seed_numbers
   #             art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
    #            art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
     #           art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
      #          art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
       #         art_illumina -i streptococcus_pneumoniae_ref.fasta -c 70 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
        #        art_illumina -i streptococcus_mitis_ref.fasta -c 70 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
         #       art_illumina -i streptococcus_thermophilus_ref.fasta -c 70 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
          #      art_illumina -i staphylococcus_aureus_ref.fasta -c 70 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
           #     art_illumina -i escherichia_coli_ref.fasta -c 70 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
            #    art_illumina -i streptococcus_equinus_ref.fasta -c 70 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
             #   cat *.fq > mock_20202311_c070_$seed_numbers.fastq
              #  rm *.fq *.aln
        #done



#for seed_numbers in {202..222}
 #       do
  #              echo $seed_numbers
   #             art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
    #            art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
     #           art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
      #          art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
       #         art_illumina -i streptococcus_pneumoniae_ref.fasta -c 100 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
        #        art_illumina -i streptococcus_mitis_ref.fasta -c 100 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
         #       art_illumina -i streptococcus_thermophilus_ref.fasta -c 100 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
          #      art_illumina -i staphylococcus_aureus_ref.fasta -c 100 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
           #     art_illumina -i escherichia_coli_ref.fasta -c 100 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
            #    art_illumina -i streptococcus_equinus_ref.fasta -c 100 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
             #   cat *.fq > mock_20202311_c100_$seed_numbers.fastq
              #  rm *.fq *.aln
        #done



#for seed_numbers in {202..222}
 #       do
  #              echo $seed_numbers
   #             art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
    #            art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
     #           art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
      #          art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
       #         art_illumina -i streptococcus_pneumoniae_ref.fasta -c 200 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
        #        art_illumina -i streptococcus_mitis_ref.fasta -c 200 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
         #       art_illumina -i streptococcus_thermophilus_ref.fasta -c 200 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
          #      art_illumina -i staphylococcus_aureus_ref.fasta -c 200 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
           #     art_illumina -i escherichia_coli_ref.fasta -c 200 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
            #    art_illumina -i streptococcus_equinus_ref.fasta -c 200 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
             #   cat *.fq > mock_20202311_c200_$seed_numbers.fastq
              #  rm *.fq *.aln
        #done

#for seed_numbers in {202..222}
 #       do
  #              echo $seed_numbers
   #             art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
    #            art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
     #           art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
      #          art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
       #         art_illumina -i streptococcus_pneumoniae_ref.fasta -c 300 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
        #        art_illumina -i streptococcus_mitis_ref.fasta -c 300 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
         ##       art_illumina -i streptococcus_thermophilus_ref.fasta -c 300 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
           #     art_illumina -i staphylococcus_aureus_ref.fasta -c 300 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
            #    art_illumina -i escherichia_coli_ref.fasta -c 300 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
             #   art_illumina -i streptococcus_equinus_ref.fasta -c 300 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
              #  cat *.fq > mock_20202311_c300_$seed_numbers.fastq
               # rm *.fq *.aln
        #done


#for seed_numbers in {202..222}
 #       do
  #              echo $seed_numbers
   #             art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
    #            art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
     #           art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
      #          art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
       #         art_illumina -i streptococcus_pneumoniae_ref.fasta -c 400 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
        #        art_illumina -i streptococcus_mitis_ref.fasta -c 400 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
         #       art_illumina -i streptococcus_thermophilus_ref.fasta -c 400 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
          #      art_illumina -i staphylococcus_aureus_ref.fasta -c 400 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
           #     art_illumina -i escherichia_coli_ref.fasta -c 400 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
            #    art_illumina -i streptococcus_equinus_ref.fasta -c 400 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
             #   cat *.fq > mock_20202311_c400_$seed_numbers.fastq
              #  rm *.fq *.aln
        #done


for seed_numbers in {202..222}
        do
                echo $seed_numbers
                art_illumina -i pseudomonas_aeruginosa_ref.fasta -c 10000 -l 75 -o pseudomonas_aeruginosa_l075_c10000 -rs $seed_numbers
                art_illumina -i eubacterium_sulci_ref.fasta -c 10000 -l 75 -o eubacterium_sulci_l075_c10000 -rs $seed_numbers
                art_illumina -i rothia_mucilaginosa_ref.fasta -c 8000 -l 75 -o rothia_mucilaginosa_l075_c08000 -rs $seed_numbers
                art_illumina -i streptococcus_salivarius_ref.fasta -c 20000 -l 75 -o streptococcus_salivarius_l075_c20000 -rs $seed_numbers
                art_illumina -i streptococcus_pneumoniae_ref.fasta -c 500 -l 75 -o streptococcus_pneumoniae_l075 -rs $seed_numbers
                art_illumina -i streptococcus_mitis_ref.fasta -c 500 -l 75 -o streptococcus_mitis_l075 -rs $seed_numbers
                art_illumina -i streptococcus_thermophilus_ref.fasta -c 500 -l 75 -o streptococcus_thermophilus_l075 -rs $seed_numbers
                art_illumina -i staphylococcus_aureus_ref.fasta -c 500 -l 75 -o staphylococcus_aureus_l075 -rs $seed_numbers
                art_illumina -i escherichia_coli_ref.fasta -c 500 -l 75 -o escherichia_coli_l075 -rs $seed_numbers
                art_illumina -i streptococcus_equinus_ref.fasta -c 500 -l 75 -o streptococcus_equinus_l075 -rs $seed_numbers
                cat *.fq > mock_20202311_c500_$seed_numbers.fastq
                rm *.fq *.aln
        done
