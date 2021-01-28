#!/bin/bash

## The real-world biological samples were obtained from the following study:
## Leiby, J.S., McCormick, K., Sherrill-Mix, S. et al. Lack of detection of a human placenta microbiome in samples from preterm and term deliveries. Microbiome 6, 196 (2018). 
## https://doi.org/10.1186/s40168-018-0575-4


## Download of .FASTQ.GZ files with sra-explorer

## Saliva (M)	Collected in sterile 50-mL conical tube
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049073/SRR7049073_1.fastq.gz -o SRR7049073_S47_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049073/SRR7049073_2.fastq.gz -o SRR7049073_S47_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7048708/SRR7048708_1.fastq.gz -o SRR7048708_S53_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7048708/SRR7048708_2.fastq.gz -o SRR7048708_S53_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049161/SRR7049161_1.fastq.gz -o SRR7049161_S54_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049161/SRR7049161_2.fastq.gz -o SRR7049161_S54_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/002/SRR7049162/SRR7049162_1.fastq.gz -o SRR7049162_S55_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/002/SRR7049162/SRR7049162_2.fastq.gz -o SRR7049162_S55_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049164/SRR7049164_1.fastq.gz -o SRR7049164_S57_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049164/SRR7049164_2.fastq.gz -o SRR7049164_S57_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049165/SRR7049165_1.fastq.gz -o SRR7049165_S58_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049165/SRR7049165_2.fastq.gz -o SRR7049165_S58_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049166/SRR7049166_1.fastq.gz -o SRR7049166_S59_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049166/SRR7049166_2.fastq.gz -o SRR7049166_S59_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049167/SRR7049167_1.fastq.gz -o SRR7049167_S60_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049167/SRR7049167_2.fastq.gz -o SRR7049167_S60_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049168/SRR7049168_1.fastq.gz -o SRR7049168_S61_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049168/SRR7049168_2.fastq.gz -o SRR7049168_S61_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/009/SRR7049169/SRR7049169_1.fastq.gz -o SRR7049169_S62_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/009/SRR7049169/SRR7049169_2.fastq.gz -o SRR7049169_S62_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049170/SRR7049170_1.fastq.gz -o SRR7049170_S63_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049170/SRR7049170_2.fastq.gz -o SRR7049170_S63_shotgun_2.fastq.gz
## Swab / Blank
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049045/SRR7049045_1.fastq.gz -o SRR7049045_VS.B1_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049045/SRR7049045_2.fastq.gz -o SRR7049045_VS.B1_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049247/SRR7049247_1.fastq.gz -o SRR7049247_VS.B4_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049247/SRR7049247_2.fastq.gz -o SRR7049247_VS.B4_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049248/SRR7049248_1.fastq.gz -o SRR7049248_VS.B3_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049248/SRR7049248_2.fastq.gz -o SRR7049248_VS.B3_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049160/SRR7049160_1.fastq.gz -o SRR7049160_AS.B4_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049160/SRR7049160_2.fastq.gz -o SRR7049160_AS.B4_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/009/SRR7049159/SRR7049159_1.fastq.gz -o SRR7049159_AS.B5_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/009/SRR7049159/SRR7049159_2.fastq.gz -o SRR7049159_AS.B5_shotgun_2.fastq.gz
## Placenta (M)	Basal plate biopsy obtained after removal of placental surface
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049088/SRR7049088_1.fastq.gz -o SRR7049088_MP41_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049088/SRR7049088_2.fastq.gz -o SRR7049088_MP41_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049091/SRR7049091_1.fastq.gz -o SRR7049091_MP42_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049091/SRR7049091_2.fastq.gz -o SRR7049091_MP42_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049090/SRR7049090_1.fastq.gz -o SRR7049090_MP43_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049090/SRR7049090_2.fastq.gz -o SRR7049090_MP43_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049085/SRR7049085_1.fastq.gz -o SRR7049085_MP44_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049085/SRR7049085_2.fastq.gz -o SRR7049085_MP44_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049084/SRR7049084_1.fastq.gz -o SRR7049084_MP45_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049084/SRR7049084_2.fastq.gz -o SRR7049084_MP45_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049087/SRR7049087_1.fastq.gz -o SRR7049087_MP46_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049087/SRR7049087_2.fastq.gz -o SRR7049087_MP46_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049086/SRR7049086_1.fastq.gz -o SRR7049086_MP47_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049086/SRR7049086_2.fastq.gz -o SRR7049086_MP47_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049097/SRR7049097_1.fastq.gz -o SRR7049097_MP48_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049097/SRR7049097_2.fastq.gz -o SRR7049097_MP48_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049096/SRR7049096_1.fastq.gz -o SRR7049096_MP49_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049096/SRR7049096_2.fastq.gz -o SRR7049096_MP49_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049255/SRR7049255_1.fastq.gz -o SRR7049255_MP70_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049255/SRR7049255_2.fastq.gz -o SRR7049255_MP70_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049253/SRR7049253_1.fastq.gz -o SRR7049253_MP71_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049253/SRR7049253_2.fastq.gz -o SRR7049253_MP71_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049257/SRR7049257_1.fastq.gz -o SRR7049257_MP72_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049257/SRR7049257_2.fastq.gz -o SRR7049257_MP72_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049256/SRR7049256_1.fastq.gz -o SRR7049256_MP73_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049256/SRR7049256_2.fastq.gz -o SRR7049256_MP73_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/002/SRR7049072/SRR7049072_1.fastq.gz -o SRR7049072_MP74_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/002/SRR7049072/SRR7049072_2.fastq.gz -o SRR7049072_MP74_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049061/SRR7049061_1.fastq.gz -o SRR7049061_MP78_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049061/SRR7049061_2.fastq.gz -o SRR7049061_MP78_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049060/SRR7049060_1.fastq.gz -o SRR7049060_MP79_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/000/SRR7049060/SRR7049060_2.fastq.gz -o SRR7049060_MP79_shotgun_2.fastq.gz
## Placenta (F)	Placental biopsy obtained from the fetal side after removal of placental surface
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049154/SRR7049154_1.fastq.gz -o SRR7049154_FP55_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049154/SRR7049154_2.fastq.gz -o SRR7049154_FP55_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049156/SRR7049156_1.fastq.gz -o SRR7049156_FP57_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049156/SRR7049156_2.fastq.gz -o SRR7049156_FP57_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049155/SRR7049155_1.fastq.gz -o SRR7049155_FP58_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049155/SRR7049155_2.fastq.gz -o SRR7049155_FP58_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049158/SRR7049158_1.fastq.gz -o SRR7049158_FP59_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049158/SRR7049158_2.fastq.gz -o SRR7049158_FP59_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049157/SRR7049157_1.fastq.gz -o SRR7049157_FP60_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049157/SRR7049157_2.fastq.gz -o SRR7049157_FP60_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049226/SRR7049226_1.fastq.gz -o SRR7049226_FP61_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/006/SRR7049226/SRR7049226_2.fastq.gz -o SRR7049226_FP61_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049225/SRR7049225_1.fastq.gz -o SRR7049225_FP62_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/005/SRR7049225/SRR7049225_2.fastq.gz -o SRR7049225_FP62_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/002/SRR7049202/SRR7049202_1.fastq.gz -o SRR7049202_FP63_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/002/SRR7049202/SRR7049202_2.fastq.gz -o SRR7049202_FP63_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049201/SRR7049201_1.fastq.gz -o SRR7049201_FP64_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/001/SRR7049201/SRR7049201_2.fastq.gz -o SRR7049201_FP64_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049173/SRR7049173_1.fastq.gz -o SRR7049173_FP73_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049173/SRR7049173_2.fastq.gz -o SRR7049173_FP73_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049174/SRR7049174_1.fastq.gz -o SRR7049174_FP74_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049174/SRR7049174_2.fastq.gz -o SRR7049174_FP74_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049184/SRR7049184_1.fastq.gz -o SRR7049184_FP75_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/004/SRR7049184/SRR7049184_2.fastq.gz -o SRR7049184_FP75_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049183/SRR7049183_1.fastq.gz -o SRR7049183_FP76_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/003/SRR7049183/SRR7049183_2.fastq.gz -o SRR7049183_FP76_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049188/SRR7049188_1.fastq.gz -o SRR7049188_FP79_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/008/SRR7049188/SRR7049188_2.fastq.gz -o SRR7049188_FP79_shotgun_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049187/SRR7049187_1.fastq.gz -o SRR7049187_FP80_shotgun_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR704/007/SRR7049187/SRR7049187_2.fastq.gz -o SRR7049187_FP80_shotgun_2.fastq.gz








