# title: "Raspir: Performance evaluation II (real-world dataset)"
# author: "Marie-Madlen Pust"
# last update: "24 1 2021"
# contact: pust.marie-madlen@mh-hannover.de

# clear R environment
rm(list = ls())

# load packages
library("readr")
library("ggplot2")
library("ggpubr")
library('plyr')
library("pheatmap")
library("tidyverse")
library("grid")
library("ggplotify")
library("rcompanion")
library(devtools)
# devtools::install_github("brendankelly/micropower")
library(micropower)

# import datasets 
# raw counts
counts_df <- read_delim(
  "human_placenta_samples/alignment_output/rawCounts_merged_samples_SRR7049258.csv", 
  ";", escape_double = FALSE, trim_ws = TRUE)
# normalised read counts
rpmm_df <- read_delim(
  "human_placenta_samples/alignment_output/RPMM_merged_samples_SRR7049258.csv", 
  ";", escape_double = FALSE, trim_ws = TRUE)

# data cleaning
# clean-up column names (remove accession number)
colnames(counts_df) <- map(strsplit(
  colnames(counts_df), split = "_"), 2)
colnames(rpmm_df) <- map(strsplit(
  colnames(rpmm_df), split = "_"), 2)

# re-name species column
colnames(counts_df)[1] <- "Species"
colnames(rpmm_df)[1] <- "Species"

# remove genus information
counts_df <- counts_df[
  - grep(" sp", counts_df$Species),]
rpmm_df <- rpmm_df[
  - grep(" sp", rpmm_df$Species),]
counts_df <- counts_df[
  - grep(" phage", counts_df$Species),]
rpmm_df <- rpmm_df[
  - grep(" phage", rpmm_df$Species),]
# concatenate dataframe and sum duplicate rows
counts_df <- ddply(
  counts_df,"Species",numcolwise(sum))
rpmm_df <- ddply(
  rpmm_df,"Species",numcolwise(sum))

# set species as row names
rownames(counts_df) <- counts_df$Species
counts_df$Species <- NULL
rownames(rpmm_df) <- rpmm_df$Species
rpmm_df$Species <- NULL

# remove all rows that sum to zero
counts_df <- filter(counts_df, rowSums(counts_df) > 0)
rpmm_df <- filter(rpmm_df, rowSums(rpmm_df) > 0)

# generate count table with only "uniform" genomes
counts_df_raspir <- counts_df
rpmm_df_raspir <- rpmm_df

# add new samples to uniform dataframe
S53_raspir <- read_csv(
  "human_placenta_samples/raspir_output/final_stats.SRR7048708_S53_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S53_raspir <- ifelse(rownames(counts_df_raspir) %in% S53_raspir$Species,
                                      counts_df_raspir$S53, 0)
rpmm_df_raspir$S53_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S53_raspir$Species,
                                      rpmm_df_raspir$S53, 0)

VS_B1_raspir <- read_csv(
  "human_placenta_samples/raspir_output/final_stats.SRR7049045_VS.B1_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$VS_B1_raspir <- ifelse(rownames(counts_df_raspir) %in% VS_B1_raspir$Species,
                                      counts_df_raspir$VS.B1, 0)
rpmm_df_raspir$VS_B1_raspir <- ifelse(rownames(rpmm_df_raspir) %in% VS_B1_raspir$Species,
                                      rpmm_df_raspir$VS.B1, 0)

MP79_raspir <- read_csv(
  "human_placenta_samples/raspir_output/final_stats.SRR7049060_MP79_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP79_raspir <- ifelse(rownames(counts_df_raspir) %in% MP79_raspir$Species,
                                      counts_df_raspir$MP79, 0)
rpmm_df_raspir$MP79_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP79_raspir$Species,
                                      rpmm_df_raspir$MP79, 0)

MP78_raspir <- read_csv(
  "human_placenta_samples/raspir_output/final_stats.SRR7049061_MP78_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP78_raspir <- ifelse(rownames(counts_df_raspir) %in% MP78_raspir$Species,
                                      counts_df_raspir$MP78, 0)
rpmm_df_raspir$MP78_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP78_raspir$Species,
                                      rpmm_df_raspir$MP78, 0)

MP74_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049072_MP74_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP74_raspir <- ifelse(rownames(counts_df_raspir) %in% MP74_raspir$Species,
                                      counts_df_raspir$MP74, 0)
rpmm_df_raspir$MP74_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP74_raspir$Species,
                                      rpmm_df_raspir$MP74, 0)

S47_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049073_S47_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S47_raspir <- ifelse(rownames(counts_df_raspir) %in% S47_raspir$Species,
                                      counts_df_raspir$S47, 0)
rpmm_df_raspir$S47_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S47_raspir$Species,
                                      rpmm_df_raspir$S47, 0)

MP45_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049084_MP45_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP45_raspir <- ifelse(rownames(counts_df_raspir) %in% MP45_raspir$Species,
                                      counts_df_raspir$MP45, 0)
rpmm_df_raspir$MP45_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP45_raspir$Species,
                                      rpmm_df_raspir$MP45, 0)

MP44_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049085_MP44_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP44_raspir <- ifelse(rownames(counts_df_raspir) %in% MP44_raspir$Species,
                                      counts_df_raspir$MP44, 0)
rpmm_df_raspir$MP44_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP44_raspir$Species,
                                      rpmm_df_raspir$MP44, 0)

MP47_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049086_MP47_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP47_raspir <- ifelse(rownames(counts_df_raspir) %in% MP47_raspir$Species,
                                      counts_df_raspir$MP47, 0)
rpmm_df_raspir$MP47_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP47_raspir$Species,
                                      rpmm_df_raspir$MP47, 0)

MP46_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049087_MP46_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP46_raspir <- ifelse(rownames(counts_df_raspir) %in% MP46_raspir$Species,
                                      counts_df_raspir$MP46, 0)
rpmm_df_raspir$MP46_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP46_raspir$Species,
                                      rpmm_df_raspir$MP46, 0)

MP41_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049088_MP41_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP41_raspir <- ifelse(rownames(counts_df_raspir) %in% MP41_raspir$Species,
                                      counts_df_raspir$MP41, 0)
rpmm_df_raspir$MP41_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP41_raspir$Species,
                                      rpmm_df_raspir$MP41, 0)

MP43_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049090_MP43_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP43_raspir <- ifelse(rownames(counts_df_raspir) %in% MP43_raspir$Species,
                                      counts_df_raspir$MP43, 0)
rpmm_df_raspir$MP43_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP43_raspir$Species,
                                      rpmm_df_raspir$MP43, 0)

MP42_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049091_MP42_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP42_raspir <- ifelse(rownames(counts_df_raspir) %in% MP42_raspir$Species,
                                      counts_df_raspir$MP42, 0)
rpmm_df_raspir$MP42_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP42_raspir$Species,
                                      rpmm_df_raspir$MP42, 0)

MP49_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049096_MP49_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP49_raspir <- ifelse(rownames(counts_df_raspir) %in% MP49_raspir$Species,
                                      counts_df_raspir$MP49, 0)
rpmm_df_raspir$MP49_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP49_raspir$Species,
                                      rpmm_df_raspir$MP49, 0)

MP48_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049097_MP48_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP48_raspir <- ifelse(rownames(counts_df_raspir) %in% MP48_raspir$Species,
                                      counts_df_raspir$MP48, 0)
rpmm_df_raspir$MP48_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP48_raspir$Species,
                                      rpmm_df_raspir$MP48, 0)

FP56_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049153_FP56_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP56_raspir <- ifelse(rownames(counts_df_raspir) %in% FP56_raspir$Species,
                                      counts_df_raspir$FP56, 0)
rpmm_df_raspir$FP56_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP56_raspir$Species,
                                      rpmm_df_raspir$FP56, 0)

FP55_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049154_FP55_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP55_raspir <- ifelse(rownames(counts_df_raspir) %in% FP55_raspir$Species,
                                      counts_df_raspir$FP55, 0)
rpmm_df_raspir$FP55_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP55_raspir$Species,
                                      rpmm_df_raspir$FP55, 0)

FP58_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049155_FP58_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP58_raspir <- ifelse(rownames(counts_df_raspir) %in% FP58_raspir$Species,
                                      counts_df_raspir$FP58, 0)
rpmm_df_raspir$FP58_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP58_raspir$Species,
                                      rpmm_df_raspir$FP58, 0)

FP57_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049156_FP57_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP57_raspir <- ifelse(rownames(counts_df_raspir) %in% FP57_raspir$Species,
                                      counts_df_raspir$FP57, 0)
rpmm_df_raspir$FP57_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP57_raspir$Species,
                                      rpmm_df_raspir$FP57, 0)

FP60_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049157_FP60_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP60_raspir <- ifelse(rownames(counts_df_raspir) %in% FP60_raspir$Species,
                                      counts_df_raspir$FP60, 0)
rpmm_df_raspir$FP60_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP60_raspir$Species,
                                      rpmm_df_raspir$FP60, 0)

FP59_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049158_FP59_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP59_raspir <- ifelse(rownames(counts_df_raspir) %in% FP59_raspir$Species,
                                      counts_df_raspir$FP59, 0)
rpmm_df_raspir$FP59_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP59_raspir$Species,
                                      rpmm_df_raspir$FP59, 0)

AS_B5_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049159_AS.B5_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$AS_B5_raspir <- ifelse(rownames(counts_df_raspir) %in% AS_B5_raspir$Species,
                                      counts_df_raspir$AS.B5, 0)
rpmm_df_raspir$AS_B5_raspir <- ifelse(rownames(rpmm_df_raspir) %in% AS_B5_raspir$Species,
                                      rpmm_df_raspir$AS.B5, 0)

AS_B4_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049160_AS.B4_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$AS_B4_raspir <- ifelse(rownames(counts_df_raspir) %in% AS_B4_raspir$Species,
                                      counts_df_raspir$AS.B4, 0)
rpmm_df_raspir$AS_B5_raspir <- ifelse(rownames(rpmm_df_raspir) %in% AS_B5_raspir$Species,
                                      rpmm_df_raspir$AS.B5, 0)

S54_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049161_S54_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S54_raspir <- ifelse(rownames(counts_df_raspir) %in% S54_raspir$Species,
                                      counts_df_raspir$S54, 0)
rpmm_df_raspir$S54_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S54_raspir$Species,
                                      rpmm_df_raspir$S54, 0)

S55_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049162_S55_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S55_raspir <- ifelse(rownames(counts_df_raspir) %in% S55_raspir$Species,
                                      counts_df_raspir$S55, 0)
rpmm_df_raspir$S55_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S55_raspir$Species,
                                      rpmm_df_raspir$S55, 0)

S56_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049163_S56_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S56_raspir <- ifelse(rownames(counts_df_raspir) %in% S56_raspir$Species,
                                      counts_df_raspir$S56, 0)
rpmm_df_raspir$S56_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S56_raspir$Species,
                                      rpmm_df_raspir$S56, 0)

S57_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049164_S57_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S57_raspir <- ifelse(rownames(counts_df_raspir) %in% S57_raspir$Species,
                                      counts_df_raspir$S57, 0)
rpmm_df_raspir$S57_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S57_raspir$Species,
                                      rpmm_df_raspir$S57, 0)

S58_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049165_S58_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S58_raspir <- ifelse(rownames(counts_df_raspir) %in% S58_raspir$Species,
                                      counts_df_raspir$S58, 0)
rpmm_df_raspir$S58_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S58_raspir$Species,
                                      rpmm_df_raspir$S58, 0)

S59_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049166_S59_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S59_raspir <- ifelse(rownames(counts_df_raspir) %in% S59_raspir$Species,
                                      counts_df_raspir$S59, 0)
rpmm_df_raspir$S59_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S59_raspir$Species,
                                      rpmm_df_raspir$S59, 0)

S60_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049167_S60_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S60_raspir <- ifelse(rownames(counts_df_raspir) %in% S60_raspir$Species,
                                      counts_df_raspir$S60, 0)
rpmm_df_raspir$S60_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S60_raspir$Species,
                                      rpmm_df_raspir$S60, 0)

S61_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049168_S61_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S61_raspir <- ifelse(rownames(counts_df_raspir) %in% S61_raspir$Species,
                                      counts_df_raspir$S61, 0)
rpmm_df_raspir$S61_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S61_raspir$Species,
                                      rpmm_df_raspir$S61, 0)

S62_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049169_S62_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S62_raspir <- ifelse(rownames(counts_df_raspir) %in% S62_raspir$Species,
                                      counts_df_raspir$S62, 0)
rpmm_df_raspir$S62_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S62_raspir$Species,
                                      rpmm_df_raspir$S62, 0)

S63_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049170_S63_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$S63_raspir <- ifelse(rownames(counts_df_raspir) %in% S63_raspir$Species,
                                      counts_df_raspir$S63, 0)
rpmm_df_raspir$S63_raspir <- ifelse(rownames(rpmm_df_raspir) %in% S63_raspir$Species,
                                      rpmm_df_raspir$S63, 0)

FP73_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049173_FP73_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP73_raspir <- ifelse(rownames(counts_df_raspir) %in% FP73_raspir$Species,
                                      counts_df_raspir$FP73, 0)
rpmm_df_raspir$FP73_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP73_raspir$Species,
                                      rpmm_df_raspir$FP73, 0)

FP74_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049174_FP74_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP74_raspir <- ifelse(rownames(counts_df_raspir) %in% FP74_raspir$Species,
                                      counts_df_raspir$FP74, 0)
rpmm_df_raspir$FP74_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP74_raspir$Species,
                                      rpmm_df_raspir$FP74, 0)

FP76_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049183_FP76_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP76_raspir <- ifelse(rownames(counts_df_raspir) %in% FP76_raspir$Species,
                                      counts_df_raspir$FP76, 0)
rpmm_df_raspir$FP76_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP76_raspir$Species,
                                      rpmm_df_raspir$FP76, 0)

FP75_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049184_FP75_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP75_raspir <- ifelse(rownames(counts_df_raspir) %in% FP75_raspir$Species,
                                      counts_df_raspir$FP75, 0)
rpmm_df_raspir$FP75_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP75_raspir$Species,
                                      rpmm_df_raspir$FP75, 0)

FP80_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049187_FP80_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP80_raspir <- ifelse(rownames(counts_df_raspir) %in% FP80_raspir$Species,
                                      counts_df_raspir$FP80, 0)
rpmm_df_raspir$FP80_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP80_raspir$Species,
                                      rpmm_df_raspir$FP80, 0)

FP79_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049188_FP79_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP79_raspir <- ifelse(rownames(counts_df_raspir) %in% FP79_raspir$Species,
                                      counts_df_raspir$FP79, 0)
rpmm_df_raspir$FP79_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP79_raspir$Species,
                                      rpmm_df_raspir$FP79, 0)

FP64_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049201_FP64_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP64_raspir <- ifelse(rownames(counts_df_raspir) %in% FP64_raspir$Species,
                                      counts_df_raspir$FP64, 0)
rpmm_df_raspir$FP64_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP64_raspir$Species,
                                      rpmm_df_raspir$FP64, 0)

FP63_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049202_FP63_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP63_raspir <- ifelse(rownames(counts_df_raspir) %in% FP63_raspir$Species,
                                      counts_df_raspir$FP63, 0)
rpmm_df_raspir$FP63_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP63_raspir$Species,
                                      rpmm_df_raspir$FP63, 0)

FP62_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049225_FP62_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP62_raspir <- ifelse(rownames(counts_df_raspir) %in% FP62_raspir$Species,
                                      counts_df_raspir$FP62, 0)
rpmm_df_raspir$FP62_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP62_raspir$Species,
                                      rpmm_df_raspir$FP62, 0)

FP61_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049226_FP61_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$FP61_raspir <- ifelse(rownames(counts_df_raspir) %in% FP61_raspir$Species,
                                      counts_df_raspir$FP61, 0)
rpmm_df_raspir$FP61_raspir <- ifelse(rownames(rpmm_df_raspir) %in% FP61_raspir$Species,
                                      rpmm_df_raspir$FP61, 0)

VS_B4_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049247_VS.B4_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$VS_B4_raspir <- ifelse(rownames(counts_df_raspir) %in% VS_B4_raspir$Species,
                                      counts_df_raspir$VS.B4, 0)
rpmm_df_raspir$VS_B4_raspir <- ifelse(rownames(rpmm_df_raspir) %in% VS_B4_raspir$Species,
                                      rpmm_df_raspir$VS.B4, 0)

VS_B3_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049248_VS.B3_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$VS_B3_raspir <- ifelse(rownames(counts_df_raspir) %in% VS_B3_raspir$Species,
                                      counts_df_raspir$VS.B3, 0)
rpmm_df_raspir$VS_B3_raspir <- ifelse(rownames(rpmm_df_raspir) %in% VS_B3_raspir$Species,
                                      rpmm_df_raspir$VS.B3, 0)

MP71_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049253_MP71_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP71_raspir <- ifelse(rownames(counts_df_raspir) %in% MP71_raspir$Species,
                                      counts_df_raspir$MP71, 0)
rpmm_df_raspir$MP71_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP71_raspir$Species,
                                      rpmm_df_raspir$MP71, 0)

MP70_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049255_MP70_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP70_raspir <- ifelse(rownames(counts_df_raspir) %in% MP70_raspir$Species,
                                      counts_df_raspir$MP70, 0)
rpmm_df_raspir$MP70_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP70_raspir$Species,
                                      rpmm_df_raspir$MP70, 0)

MP73_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049256_MP73_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP73_raspir <- ifelse(rownames(counts_df_raspir) %in% MP73_raspir$Species,
                                      counts_df_raspir$MP73, 0)
rpmm_df_raspir$MP73_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP73_raspir$Species,
                                      rpmm_df_raspir$MP73, 0)

MP72_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049257_MP72_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP72_raspir <- ifelse(rownames(counts_df_raspir) %in% MP72_raspir$Species,
                                      counts_df_raspir$MP72, 0)
rpmm_df_raspir$MP72_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP72_raspir$Species,
                                      rpmm_df_raspir$MP72, 0)

MP75_raspir <- read_csv("human_placenta_samples/raspir_output/final_stats.SRR7049258_MP75_shotgun.trim.bwa.sorted.raspir.csv")
counts_df_raspir$MP75_raspir <- ifelse(rownames(counts_df_raspir) %in% MP75_raspir$Species,
                                      counts_df_raspir$MP75, 0)
rpmm_df_raspir$MP75_raspir <- ifelse(rownames(rpmm_df_raspir) %in% MP75_raspir$Species,
                                      rpmm_df_raspir$MP75, 0)

raspir_list_S <- c(
  "S47_raspir", "S54_raspir", "S55_raspir", 
  "S57_raspir", "S58_raspir", "S59_raspir", 
  "S60_raspir", "S61_raspir", 
  "S62_raspir", "S63_raspir")

raspir_list_MP <- c(
  "MP79_raspir", "MP78_raspir", "MP74_raspir", 
  "MP45_raspir", "MP44_raspir",
  "MP47_raspir", "MP46_raspir", "MP41_raspir", "MP43_raspir",
  "MP42_raspir", "MP49_raspir", "MP48_raspir", 
  "MP71_raspir", "MP70_raspir", 
  "MP73_raspir", "MP72_raspir", "MP75_raspir")

raspir_list_FP <- c(
  "FP56_raspir", "FP55_raspir", "FP58_raspir",  
  "FP57_raspir", "FP60_raspir",
  "FP59_raspir", "FP73_raspir", "FP74_raspir", "FP76_raspir", "FP75_raspir", 
  "FP80_raspir", "FP79_raspir", "FP64_raspir", 
  "FP63_raspir", "FP62_raspir", 
  "FP61_raspir")

# select random samples
set.seed(1)
random_raspir_S <- sample(raspir_list_S, 5)
random_raspir_MP <- sample(raspir_list_MP, 5)
random_raspir_FP <- sample(raspir_list_FP, 5)
blank_raspir <- c("AS_B5_raspir", "AS_B4_raspir", 
                  "VS_B3_raspir", "VS_B4_raspir", 
                  "VS_B1_raspir")

random_S <- str_replace(random_raspir_S, "_raspir", "")
random_MP <- str_replace(random_raspir_MP, "_raspir", "")
random_FP <- str_replace(random_raspir_FP, "_raspir", "")
blank_c <- c("AS.B5", "AS.B4", 
             "VS.B3", "VS.B4", 
             "VS.B1")
samples_to_use <- c(blank_c, random_MP, random_FP, random_S,
                    blank_raspir, random_raspir_MP, random_raspir_FP,
                    random_raspir_S)

counts_df_raspir_select <- select(counts_df_raspir, samples_to_use)
counts_df_raspir_pres_abs <- ifelse(counts_df_raspir_select > 3, 1, 0)

counts_df_raspir_pres_abs <- data.frame(t(counts_df_raspir_pres_abs))
counts_df_raspir_pres_abs$specCount <- rowSums(counts_df_raspir_pres_abs)
counts_df_raspir_pres_abs$ID <- rownames(counts_df_raspir_pres_abs)
counts_df_raspir_pres_abs$type <- c(
  "Without raspir", "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", "Without raspir", 
  "Without raspir", "Without raspir", 
  
  "With raspir", "With raspir", "With raspir", 
  "With raspir", "With raspir", 
  "With raspir", "With raspir", "With raspir",   
  "With raspir","With raspir", 
  "With raspir", "With raspir", "With raspir", 
  "With raspir",  "With raspir",  
  "With raspir",  "With raspir",  "With raspir",  
  "With raspir",  "With raspir")

counts_df_raspir_pres_abs$sample <- c(
  "Blank", "Blank", "Blank", "Blank", "Blank", 
  "Placental (M)", "Placental (M)", "Placental (M)", 
  "Placental (M)", "Placental (M)", 
  "Placental (F)", "Placental (F)", "Placental (F)",  
  "Placental (F)", "Placental (F)",
  "Saliva", "Saliva", "Saliva", "Saliva", "Saliva", 
  
  "Blank", "Blank", "Blank", "Blank", "Blank", 
  "Placental (M)", "Placental (M)", "Placental (M)", 
  "Placental (M)", "Placental (M)", 
  "Placental (F)", "Placental (F)", "Placental (F)",  
  "Placental (F)", "Placental (F)",
  "Saliva", "Saliva", "Saliva", "Saliva", "Saliva")


counts_df_raspir_pres_abs_L <- gather(
  counts_df_raspir_pres_abs, 
  key="species", value = "count",
  -c("ID", "type", "sample", "specCount"))

counts_df_raspir_pres_abs_L$ID <- str_replace(
  counts_df_raspir_pres_abs_L$ID, "_raspir", "")
counts_df_raspir_pres_abs_L$ID <- str_replace(
  counts_df_raspir_pres_abs_L$ID, "_", ".")

plot_raspir_vs_nonraspir <-
  ggplot(counts_df_raspir_pres_abs_L) +
  geom_tile(aes(x=ID, y=species, fill=as.factor(count)), 
            height=1, width=0.8) +
  facet_grid(~type ~ sample, scales = "free_x") +
  theme_pubr(border=TRUE, legend = "none", 
             base_size = 12) +
  xlab("") +
  ylab("") +
  scale_fill_manual(values=c("white", "black")) +
  theme(axis.text.y = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        strip.text = element_text(size = 12))

ggsave("images/raspir_real_world_comparison.tif",
       plot_raspir_vs_nonraspir, device="tiff",
       width=11, height=8, dpi=600)

# How does sequencing depth /read count affect the prediction?
the_samples <- c("AS.B5", "AS.B4", "VS.B3", "VS.B4", "VS.B1",
                 "MP49", "MP70", "MP78", "MP75", "MP74",
                 "FP56", "FP60", "FP62", "FP75", "FP59",
                 "S62", "S57", "S60", "S47", "S54")

sample_type <- c("Blank", "Blank", "Blank", "Blank", "Blank",
                 "Placental (M)", "Placental (M)", "Placental (M)", 
                 "Placental (M)", "Placental (M)", 
                 "Placental (F)", "Placental (F)", "Placental (F)",  
                 "Placental (F)", "Placental (F)",
                 "Saliva", "Saliva", "Saliva", "Saliva", "Saliva")
# after trimming and removal of duplicates
reads_qc_passed_total <- c(
  1181920, 37866, 12678, 17192, 44262,
  42064, 72298, 49616, 91212, 50566,
  63978, 67246, 96830, 144840, 74792,
  4223982, 1597616, 3935052, 877178, 1141774)

ralstonia_reads <- c(
  654, 337, 1093, 1267, 589, 188, 455, 354, 809, 
  248, 666, 539, 1066, 430, 385, 184, 248, 
  242, 165, 85)

seqdepth_ralstonia_df <- data.frame(cbind(
  the_samples, sample_type, reads_qc_passed_total, ralstonia_reads))

seqdepth_plot <- ggplot(
  seqdepth_ralstonia_df, aes(
  x=the_samples, 
  y=as.numeric(as.character(reads_qc_passed_total)))) +
  geom_col() +
  xlab("") +
  ylab("Sequencing depth\n") +
  scale_y_continuous(labels = function(
    x) format(x, big.mark = " ", scientific = FALSE)) +
  facet_wrap(~sample_type, nrow=1, scales = "free_x") +
  theme_pubr(border=TRUE) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        strip.text = element_text(size = 12))

ralstonia_plot <-
  ggplot(seqdepth_ralstonia_df, aes(
  x=the_samples, 
  y=as.numeric(as.character(ralstonia_reads)))) +
  geom_col() +
  xlab("") +
  ylab("\n\nRaw reads (Ralstonia pickettii)\n") +
  scale_y_continuous(labels = function(x) format(x, big.mark = " ",
                                                 scientific = FALSE)) +
  facet_wrap(~sample_type, nrow=1, scales = "free_x") +
  theme_pubr(border=TRUE) +
  geom_hline(yintercept = 100, linetype="dashed", 
             color="orangered2", size=1) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        strip.text = element_text(size = 12))

depth_ralstonia_plot <-
  ggarrange(seqdepth_plot,
          ralstonia_plot, nrow=2)

ggsave("images/ralstonia_plot.tif",
       depth_ralstonia_plot, device="tiff",
       width=10, height=10, dpi=1200)

min(reads_qc_passed_total)
max(reads_qc_passed_total)

min(ralstonia_reads)
max(ralstonia_reads)

# How much does raspir affect the core community?
sputum_raspir_raspir <- c(
  "S53_raspir", "S47_raspir", "S54_raspir", "S55_raspir", "S56_raspir",
  "S57_raspir", "S58_raspir", "S59_raspir", "S60_raspir", "S61_raspir", 
  "S62_raspir", "S63_raspir")

sputum_no_raspir <- c(
  "S53", "S47", "S54", "S55", "S56",
  "S57", "S58", "S59", "S60", "S61", 
  "S62", "S63")

sputum_all <- c(sputum_raspir_raspir, sputum_no_raspir)
rpmm_df_no_raspir_selected <- select(
  rpmm_df_raspir, sputum_no_raspir)
rpmm_df_raspir_selected <- select(
  rpmm_df_raspir, sputum_raspir_raspir)

# 95 % of most abundant species
# no raspir
core_species_no_raspir <- rpmm_df_no_raspir_selected
core_species_no_raspir$sum_row <- rowSums(
  core_species_no_raspir)
sum_total = sum(core_species_no_raspir$sum_row)
core_species_no_raspir$abundance <- (
  core_species_no_raspir$sum_row / sum_total) * 100
# sort abundance column (decreasing)
core_species_no_raspir <- core_species_no_raspir[
  order(core_species_no_raspir$abundance, 
        decreasing = TRUE),]  
# sum abundance values
core_species_no_raspir$cumsum <- cumsum(
  core_species_no_raspir$abundance)
core_species_no_raspir_95 <- subset(
  core_species_no_raspir, cumsum <= 95)
core_species_no_raspir_95$sum_row <- NULL
core_species_no_raspir_95$abundance <- NULL
core_species_no_raspir_95$cumsum <- NULL
core_species_no_raspir_95 <- rownames(
  core_species_no_raspir_95)

# raspir
core_species_raspir <- rpmm_df_raspir_selected
core_species_raspir$sum_row <- rowSums(
  core_species_raspir)
sum_total2 = sum(core_species_raspir$sum_row)
core_species_raspir$abundance <- (
  core_species_raspir$sum_row / sum_total2) * 100
# sort abundance column (decreasing)
core_species_raspir <- core_species_raspir[
  order(core_species_raspir$abundance, 
        decreasing = TRUE),]  
# sum abundance values
core_species_raspir$cumsum <- cumsum(
  core_species_raspir$abundance)
core_species_raspir$sum_row <- NULL
core_species_raspir_95 <- subset(
  core_species_raspir, cumsum <= 95)
core_species_raspir_95$sum_row <- NULL
core_species_raspir_95$abundance <- NULL
core_species_raspir_95$cumsum <- NULL
core_species_raspir_95 <- rownames(
  core_species_raspir_95)

core_species_merged_95 <- c(
  core_species_no_raspir_95, core_species_raspir_95)
core_species_merged_95 <- core_species_merged_95[
  !duplicated(core_species_merged_95)]

rpmm_core <- select(rpmm_df_raspir, sputum_all)
rpmm_core_95 <- filter(rpmm_core, rownames(
  rpmm_core) %in% core_species_merged_95)

# Calculate pairwise weighted Jaccard distances from an OTU table
# Generates a square matrix of pairwise weighted Jaccard distances from an OTU table.
pwd_distances_95_core <- calcWJstudy(
  rpmm_core_95)
pwd_distances_95_core <- data.frame(
  pwd_distances_95_core)
pwd_distances_95_core
raspir_vs_non_raspir <- c(
  pwd_distances_95_core[1,2],
  pwd_distances_95_core[3,4],
  pwd_distances_95_core[5,6],
  pwd_distances_95_core[7,8],
  pwd_distances_95_core[9,10],
  pwd_distances_95_core[11,12],
  pwd_distances_95_core[13,14],
  pwd_distances_95_core[15,16],
  pwd_distances_95_core[17,18],
  pwd_distances_95_core[19,20],
  pwd_distances_95_core[21,22],
  pwd_distances_95_core[23,24])

raspir_vs_raspir <- 
  select(pwd_distances_95_core, 
         sputum_raspir_raspir)
raspir_vs_raspir <-
  filter(raspir_vs_raspir, rownames(
    raspir_vs_raspir) %in% sputum_raspir_raspir)
rownames(raspir_vs_raspir) <- NULL

nraspir_vs_nraspir <-
  select(pwd_distances_95_core, 
         sputum_no_raspir)
nraspir_vs_nraspir <-
  filter(nraspir_vs_nraspir, rownames(
    nraspir_vs_nraspir) %in% sputum_no_raspir)
rownames(nraspir_vs_nraspir) <- NULL

all_merged0 <- 
  cbind(raspir_vs_raspir, nraspir_vs_nraspir, 
        raspir_vs_non_raspir)
all_merged0$abund <- "95% most abundant"
names(all_merged0)[
  names(all_merged0) == 'raspir_vs_non_raspir'] <- "pairwise"
all_merged0 <- all_merged0[1:8,]

# 99 % most abundant species
core_species_no_raspir_99 <- subset(
  core_species_no_raspir, cumsum <= 99)
core_species_no_raspir_99$sum_row <- NULL
core_species_no_raspir_99$abundance <- NULL
core_species_no_raspir_99$cumsum <- NULL
core_species_no_raspir_99 <- rownames(
  core_species_no_raspir_99)

core_species_raspir_99 <- subset(
  core_species_raspir, cumsum <= 99)
core_species_raspir_99$sum_row <- NULL
core_species_raspir_99$abundance <- NULL
core_species_raspir_99$cumsum <- NULL
core_species_raspir_99 <- rownames(
  core_species_raspir_99)

core_species_merged_99 <- c(
  core_species_no_raspir_99, core_species_raspir_99)
core_species_merged_99 <- core_species_merged_99[
  !duplicated(core_species_merged_99)]

# rpmm_core <- select(rpmm_df_raspir, sputum_all)
rpmm_core_99 <- filter(rpmm_core, rownames(
  rpmm_core) %in% core_species_merged_99)
pwd_distances_99_core <- calcWJstudy(rpmm_core_99)
pwd_distances_99_core <- data.frame(
  pwd_distances_99_core)

raspir_vs_non_raspir_99 <- c(
  pwd_distances_99_core[1,2],
  pwd_distances_99_core[3,4],
  pwd_distances_99_core[5,6],
  pwd_distances_99_core[7,8],
  pwd_distances_99_core[9,10],
  pwd_distances_99_core[11,12],
  pwd_distances_99_core[13,14],
  pwd_distances_99_core[15,16],
  pwd_distances_99_core[17,18],
  pwd_distances_99_core[19,20],
  pwd_distances_99_core[21,22],
  pwd_distances_99_core[23,24])

raspir_vs_raspir_99 <- 
  select(pwd_distances_99_core, 
         sputum_raspir_raspir)
raspir_vs_raspir_99 <-
  filter(raspir_vs_raspir_99, rownames(
    raspir_vs_raspir_99) %in% sputum_raspir_raspir)
rownames(raspir_vs_raspir_99) <- NULL

nraspir_vs_nraspir_99 <-
  select(pwd_distances_99_core, 
         sputum_no_raspir)
nraspir_vs_nraspir_99 <-
  filter(nraspir_vs_nraspir_99, rownames(
    nraspir_vs_nraspir_99) %in% sputum_no_raspir)
rownames(nraspir_vs_nraspir_99) <- NULL

all_merged1 <- 
  cbind(raspir_vs_raspir_99, 
        nraspir_vs_nraspir_99, 
        raspir_vs_non_raspir_99)
all_merged1$abund <- "99% most abundant"
names(all_merged1)[
  names(all_merged1) == 'raspir_vs_non_raspir_99'] <- "pairwise"
all_merged1 <- all_merged1[1:8,]

# 99 % most abundant species
core_species_no_raspir_97 <- subset(
  core_species_no_raspir, cumsum <= 97)
core_species_no_raspir_97$sum_row <- NULL
core_species_no_raspir_97$abundance <- NULL
core_species_no_raspir_97$cumsum <- NULL
core_species_no_raspir_97 <- rownames(
  core_species_no_raspir_97)

core_species_raspir_97 <- subset(
  core_species_raspir, cumsum <= 97)
core_species_raspir_97$sum_row <- NULL
core_species_raspir_97$abundance <- NULL
core_species_raspir_97$cumsum <- NULL
core_species_raspir_97 <- rownames(
  core_species_raspir_97)

core_species_merged_97 <- c(
  core_species_no_raspir_97, 
  core_species_raspir_97)
core_species_merged_97 <- core_species_merged_97[
  !duplicated(core_species_merged_97)]

# rpmm_core <- select(rpmm_df_raspir, sputum_all)
rpmm_core_97 <- filter(rpmm_core, 
                       rownames(rpmm_core) %in% core_species_merged_97)
pwd_distances_97_core <- calcWJstudy(
  rpmm_core_97)
pwd_distances_97_core <- data.frame(
  pwd_distances_97_core)

raspir_vs_non_raspir_97 <- c(
  pwd_distances_97_core[1,2],
  pwd_distances_97_core[3,4],
  pwd_distances_97_core[5,6],
  pwd_distances_97_core[7,8],
  pwd_distances_97_core[9,10],
  pwd_distances_97_core[11,12],
  pwd_distances_97_core[13,14],
  pwd_distances_97_core[15,16],
  pwd_distances_97_core[17,18],
  pwd_distances_97_core[19,20],
  pwd_distances_97_core[21,22],
  pwd_distances_97_core[23,24])

raspir_vs_raspir_97 <- 
  select(pwd_distances_97_core, 
         sputum_raspir_raspir)
raspir_vs_raspir_97 <-
  filter(raspir_vs_raspir_97, 
         rownames(raspir_vs_raspir_97) %in% sputum_raspir_raspir)
rownames(raspir_vs_raspir_97) <- NULL

nraspir_vs_nraspir_97 <-
  select(pwd_distances_97_core, 
         sputum_no_raspir)
nraspir_vs_nraspir_97 <-
  filter(nraspir_vs_nraspir_97, rownames(
    nraspir_vs_nraspir_97) %in% sputum_no_raspir)
rownames(nraspir_vs_nraspir_97) <- NULL

all_merged2 <- 
  cbind(raspir_vs_raspir_97, 
        nraspir_vs_nraspir_97, 
        raspir_vs_non_raspir_97)
all_merged2$abund <- "97% most abundant"
names(all_merged2)[
  names(all_merged2) == 'raspir_vs_non_raspir_97'] <- "pairwise"
all_merged2 <- all_merged2[1:8,]


# 1 % least abundant species
core_species_no_raspir_1 <- subset(
  core_species_no_raspir, cumsum > 99)
core_species_no_raspir_1$sum_row <- NULL
core_species_no_raspir_1$abundance <- NULL
core_species_no_raspir_1$cumsum <- NULL
core_species_no_raspir_1 <- rownames(
  core_species_no_raspir_1)

core_species_raspir_1 <- subset(
  core_species_raspir, cumsum > 99)
core_species_raspir_1$sum_row <- NULL
core_species_raspir_1$abundance <- NULL
core_species_raspir_1$cumsum <- NULL
core_species_raspir_1 <- rownames(
  core_species_raspir_1)

core_species_merged_1 <- c(
  core_species_no_raspir_1, core_species_raspir_1)
core_species_merged_1 <- core_species_merged_1[
  !duplicated(core_species_merged_1)]

# rpmm_core <- select(rpmm_df_raspir, sputum_all)
rpmm_core_1 <- filter(rpmm_core, 
                      rownames(rpmm_core) %in% core_species_merged_1)
pwd_distances_1_core <- calcWJstudy(
  rpmm_core_1)
pwd_distances_1_core <- data.frame(
  pwd_distances_1_core)

raspir_vs_non_raspir_1 <- c(
  pwd_distances_1_core[1,2],
  pwd_distances_1_core[3,4],
  pwd_distances_1_core[5,6],
  pwd_distances_1_core[7,8],
  pwd_distances_1_core[9,10], 
  pwd_distances_1_core[11,12],
  pwd_distances_1_core[13,14],
  pwd_distances_1_core[15,16],
  pwd_distances_1_core[17,18],
  pwd_distances_1_core[19,20],
  pwd_distances_1_core[21,22],
  pwd_distances_1_core[23,24])

raspir_vs_non_raspir_1
raspir_vs_raspir_1 <- 
  select(pwd_distances_1_core, 
         sputum_raspir_raspir)
raspir_vs_raspir_1 <-
  filter(raspir_vs_raspir_1, 
         rownames(raspir_vs_raspir_1) %in% sputum_raspir_raspir)
rownames(raspir_vs_raspir_1) <- NULL

nraspir_vs_nraspir_1 <-
  select(pwd_distances_1_core, 
         sputum_no_raspir)
nraspir_vs_nraspir_1 <-
  filter(nraspir_vs_nraspir_1, 
         rownames(nraspir_vs_nraspir_1) %in% sputum_no_raspir)
rownames(nraspir_vs_nraspir_1) <- NULL

all_merged3 <- 
  cbind(raspir_vs_raspir_1, 
        nraspir_vs_nraspir_1, 
        raspir_vs_non_raspir_1)
all_merged3$abund <- "1% least abundant"
names(all_merged3)[
  names(all_merged3) == 'raspir_vs_non_raspir_1'] <- "pairwise"
all_merged3 <- all_merged3[1:8,]

# 3 % least abundant species
core_species_no_raspir_3 <- subset(
  core_species_no_raspir, cumsum > 97)
core_species_no_raspir_3$sum_row <- NULL
core_species_no_raspir_3$abundance <- NULL
core_species_no_raspir_3$cumsum <- NULL
core_species_no_raspir_3 <- rownames(
  core_species_no_raspir_3)

core_species_raspir_3 <- subset(
  core_species_raspir, cumsum > 97)
core_species_raspir_3$sum_row <- NULL
core_species_raspir_3$abundance <- NULL
core_species_raspir_3$cumsum <- NULL
core_species_raspir_3 <- rownames(
  core_species_raspir_3)

core_species_merged_3 <- c(
  core_species_no_raspir_3, 
  core_species_raspir_3)
core_species_merged_3 <- core_species_merged_3[
  !duplicated(core_species_merged_3)]

rpmm_core_3 <- filter(
  rpmm_core, rownames(
    rpmm_core) %in% core_species_merged_3)
pwd_distances_3_core <- calcWJstudy(
  rpmm_core_3)
pwd_distances_3_core <- data.frame(
  pwd_distances_3_core)

raspir_vs_non_raspir_3 <- c(
  pwd_distances_3_core[1,2],
  pwd_distances_3_core[3,4],
  pwd_distances_3_core[5,6],
  pwd_distances_3_core[7,8],
  pwd_distances_3_core[9,10], 
  pwd_distances_3_core[11,12],
  pwd_distances_3_core[13,14],
  pwd_distances_3_core[15,16],
  pwd_distances_3_core[17,18],
  pwd_distances_3_core[19,20],
  pwd_distances_3_core[21,22],
  pwd_distances_3_core[23,24])

raspir_vs_raspir_3 <- 
  select(pwd_distances_3_core, 
         sputum_raspir_raspir)
raspir_vs_raspir_3 <-
  filter(raspir_vs_raspir_3, 
         rownames(raspir_vs_raspir_3) %in% sputum_raspir_raspir)
rownames(raspir_vs_raspir_3) <- NULL

nraspir_vs_nraspir_3 <-
  select(pwd_distances_3_core, 
         sputum_no_raspir)
nraspir_vs_nraspir_3 <-
  filter(nraspir_vs_nraspir_3, rownames(
    nraspir_vs_nraspir_3) %in% sputum_no_raspir)
rownames(nraspir_vs_nraspir_3) <- NULL

all_merged4 <- 
  cbind(raspir_vs_raspir_3, 
        nraspir_vs_nraspir_3, 
        raspir_vs_non_raspir_3)
all_merged4$abund <- "3% least abundant"
names(all_merged4)[
  names(all_merged4) == 'raspir_vs_non_raspir_3'] <- "pairwise"
all_merged4 <- all_merged4[1:8,]


# 5 % least abundant species
core_species_no_raspir_5 <- subset(
  core_species_no_raspir, cumsum > 95)
core_species_no_raspir_5$sum_row <- NULL
core_species_no_raspir_5$abundance <- NULL
core_species_no_raspir_5$cumsum <- NULL
core_species_no_raspir_5 <- rownames(
  core_species_no_raspir_5)

core_species_raspir_5 <- subset(
  core_species_raspir, cumsum > 95)
core_species_raspir_5$sum_row <- NULL
core_species_raspir_5$abundance <- NULL
core_species_raspir_5$cumsum <- NULL
core_species_raspir_5 <- rownames(
  core_species_raspir_5)

core_species_merged_5 <- c(
  core_species_no_raspir_5, 
  core_species_raspir_5)
core_species_merged_5 <- core_species_merged_5[
  !duplicated(core_species_merged_5)]

rpmm_core_5 <- filter(
  rpmm_core, rownames(
    rpmm_core) %in% core_species_merged_5)
pwd_distances_5_core <- calcWJstudy(
  rpmm_core_5)
pwd_distances_5_core <- data.frame(
  pwd_distances_5_core)

raspir_vs_non_raspir_5 <- c(
  pwd_distances_5_core[1,2],
  pwd_distances_5_core[3,4],
  pwd_distances_5_core[5,6],
  pwd_distances_5_core[7,8],
  pwd_distances_5_core[9,10], 
  pwd_distances_5_core[11,12],
  pwd_distances_5_core[13,14],
  pwd_distances_5_core[15,16],
  pwd_distances_5_core[17,18],
  pwd_distances_5_core[19,20],
  pwd_distances_5_core[21,22],
  pwd_distances_5_core[23,24])

raspir_vs_raspir_5 <- 
  select(pwd_distances_5_core, 
         sputum_raspir_raspir)
raspir_vs_raspir_5 <-
  filter(raspir_vs_raspir_5, 
         rownames(raspir_vs_raspir_5) %in% sputum_raspir_raspir)
rownames(raspir_vs_raspir_5) <- NULL

nraspir_vs_nraspir_5 <-
  select(pwd_distances_5_core, 
         sputum_no_raspir)
nraspir_vs_nraspir_5 <-
  filter(nraspir_vs_nraspir_5, rownames(
    nraspir_vs_nraspir_5) %in% sputum_no_raspir)
rownames(nraspir_vs_nraspir_5) <- NULL

all_merged5 <- 
  cbind(raspir_vs_raspir_5, 
        nraspir_vs_nraspir_5, 
        raspir_vs_non_raspir_5)
all_merged5$abund <- "5% least abundant"
names(all_merged5)[names(all_merged5) == 'raspir_vs_non_raspir_5'] <- "pairwise"
all_merged5 <- all_merged5[1:8,]

final_merged <- data.frame(rbind(
  all_merged0, all_merged1, all_merged2,
  all_merged3, all_merged4, all_merged5))
final_merged <- na_if(final_merged, 0)
final_merged_L <- gather(
  final_merged, key="sample", value="similarity", -c(abund))
final_merged_L$type <- with(
  final_merged_L, ifelse(
    final_merged_L$sample == "pairwise", 
    "raspir-nraspir", ifelse(
      final_merged_L$sample %in% sputum_raspir_raspir == TRUE,
      "raspir", "nraspir")))

final_merged_L1 <- subset(final_merged_L, type != "raspir")

final_merged_L1_core <-
  subset(
    final_merged_L1, 
    abund == "95% most abundant" | abund == "97% most abundant" | abund == "99% most abundant")

final_merged_L1_rare <-
  subset(
    final_merged_L1, 
    abund == "1% least abundant" | abund == "3% least abundant" | abund == "5% least abundant")

core_plot <-
  ggplot(final_merged_L1_core, aes(
  x=type, y=similarity, colour=type)) +
  geom_boxplot() +
  geom_jitter(width=0.03, size=3, alpha=0.2) +
  facet_wrap(~abund, nrow=1) +
  scale_color_manual(values = c("black", "darkgreen")) +
  ylim(0.00, 1.20) +
  theme_pubr(border=TRUE, legend="bottom", base_size = 12) +
  ylab("Weighted Jaccard similarity\n") +
  xlab("") +
  stat_compare_means(label =  "p.signif", 
                     label.x = 1.5, size=5, label.y = 1.10) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        legend.title = element_blank(),
        legend.text = element_text(size=12),
        strip.text = element_text(size = 12))

rare_plot <-
  ggplot(final_merged_L1_rare, aes(
  x=type, y=similarity, colour=type)) +
  geom_boxplot() +
  geom_jitter(width=0.03, size=3, alpha=0.2) +
  facet_wrap(~abund, nrow=1) +
  scale_color_manual(values = c("black", "darkgreen")) +
  ylim(0.00, 1.20) +
  theme_pubr(border=TRUE, legend="bottom", base_size = 12) +
  ylab("") +
  xlab("") +
  stat_compare_means(label =  "p.signif", 
                     label.x = 1.5, size=5, label.y = 1.10) +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(),
        legend.title = element_blank(),
        legend.text = element_text(size=12),
        strip.text = element_text(size = 12))

jaccard_plot <-
  ggarrange(core_plot, rare_plot, 
          nrow=1, labels=c("A", "B"),
          common.legend = TRUE, 
          legend="bottom")

ggsave("images/jaccard_similarity.tif",
       jaccard_plot, device="tiff",
       width=12, height=5.64,
       dpi= 1200)

# Calculate effect sizes (core species)
final_merged_L1_core_95 <- subset(
  final_merged_L1_core, abund == "95% most abundant")
final_merged_L1_core_95 <- na.omit(final_merged_L1_core_95)
wilcoxonR(final_merged_L1_core_95$similarity,
          final_merged_L1_core_95$type, ci=TRUE)
# r = 0.48, CI = 0.3 - 0.61
 
final_merged_L1_core_97 <- subset(
  final_merged_L1_core, abund == "97% most abundant")
final_merged_L1_core_97 <- na.omit(final_merged_L1_core_97)
wilcoxonR(final_merged_L1_core_97$similarity,
          final_merged_L1_core_97$type, ci=TRUE)
# r = 0.48, CI = 0.3 - 0.61

final_merged_L1_core_99 <- subset(
  final_merged_L1_core, abund == "99% most abundant")
final_merged_L1_core_99 <- na.omit(final_merged_L1_core_99)
wilcoxonR(final_merged_L1_core_99$similarity,
          final_merged_L1_core_99$type, ci=TRUE)
# r = 0.48, CI = 0.3 - 0.59

# Calculate effect sizes (rare species)
final_merged_L1_rare_1 <- subset(
  final_merged_L1_rare, abund == "1% least abundant")
final_merged_L1_rare_1 <- na.omit(final_merged_L1_rare_1)
wilcoxonR(final_merged_L1_rare_1$similarity,
          final_merged_L1_rare_1$type, ci=TRUE)
# r = -0.44, CI = (-0.57) - (-0.25)

final_merged_L1_rare_3 <- subset(
  final_merged_L1_rare, abund == "3% least abundant")
final_merged_L1_rare_3 <- na.omit(final_merged_L1_rare_3)
wilcoxonR(final_merged_L1_rare_3$similarity,
          final_merged_L1_rare_3$type, ci=TRUE)
# r = -0.39, CI= (-0.55) - (-0.16)

final_merged_L1_rare_5 <- subset(
  final_merged_L1_rare, abund == "5% least abundant")
final_merged_L1_rare_5 <- na.omit(final_merged_L1_rare_5)
wilcoxonR(final_merged_L1_rare_5$similarity,
          final_merged_L1_rare_5$type, ci=TRUE)
# r = -0.31, CI= (-0.50) - (-0.01)

##############################################################################
# sessionInfo()
# R version 4.0.3 (2020-10-10)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 19041)
# 
# attached base packages:
# [1] grid      stats     graphics  grDevices utils     datasets  methods   base     

#other attached packages:
# reshape2_1.4.4    vegan_2.5-7       lattice_0.20-41   micropower_0.4    
# permute_0.9-5     devtools_2.3.2    usethis_2.0.0     rcompanion_2.3.26
# ggplotify_0.0.5   forcats_0.5.0     stringr_1.4.0     dplyr_1.0.2       
# purrr_0.3.4       tidyr_1.1.2       tibble_3.0.4      tidyverse_1.3.0  
# pheatmap_1.0.12   plyr_1.8.6        ggpubr_0.4.0      ggplot2_3.3.3     
# readr_1.4.0      

# loaded via a namespace (and not attached):
# readxl_1.3.1         backports_1.2.0      splines_4.0.3        TH.data_1.0-10       
# inline_0.3.17        digest_0.6.27       fansi_0.4.1          magrittr_2.0.1       
# memoise_1.1.0        cluster_2.1.0        openxlsx_4.2.3       remotes_2.2.0       
# modelr_0.1.8         RcppParallel_5.0.2   matrixStats_0.57.0   sandwich_3.0-0      
# prettyunits_1.1.1    colorspace_2.0-0     rvest_0.3.6          haven_2.3.1          
# xfun_0.20            callr_3.5.1          crayon_1.3.4         jsonlite_1.7.2      
# libcoin_1.0-7        Exact_2.1            survival_3.2-7       zoo_1.8-8            
# ape_5.4-1            glue_1.4.2          gtable_0.3.0         V8_3.4.0             
# car_3.0-10           pkgbuild_1.2.0       rstan_2.21.2         abind_1.4-5         
# scales_1.1.1         mvtnorm_1.1-1        DBI_1.1.1            rstatix_0.6.0        
# Rcpp_1.0.6           gridGraphics_0.5-1  foreign_0.8-80       stats4_4.0.3         
# StanHeaders_2.21.0-7 httr_1.4.2           RColorBrewer_1.1-2   modeltools_0.2-23   
# ellipsis_0.3.1       pkgconfig_2.0.3      loo_2.4.1            farver_2.0.3         
# multcompView_0.1-8   dbplyr_2.0.0        tidyselect_1.1.0     labeling_0.4.2       
# rlang_0.4.9          munsell_0.5.0        cellranger_1.1.0     tools_4.0.3         
# cli_2.2.0            generics_0.1.0       broom_0.7.3          EMT_1.1              
# processx_3.4.5       knitr_1.30          fs_1.5.0             zip_2.1.1            
# coin_1.4-0           rootSolve_1.8.2.1    nlme_3.1-149         xml2_1.3.2          
# compiler_4.0.3       rstudioapi_0.13      curl_4.3             e1071_1.7-4          
# testthat_3.0.1       ggsignif_0.6.0      reprex_0.3.0         DescTools_0.99.39    
# stringi_1.5.3        ps_1.5.0             desc_1.2.0           Matrix_1.2-18       
# vctrs_0.3.5          pillar_1.4.7         lifecycle_0.2.0      BiocManager_1.30.10  
# lmtest_0.9-38        data.table_1.13.6   cowplot_1.1.1        lmom_2.8             
# R6_2.5.0             gridExtra_2.3        rio_0.5.16           gld_2.6.2           
# sessioninfo_1.1.1    codetools_0.2-16     boot_1.3-25          MASS_7.3-53          
# assertthat_0.2.1     pkgload_1.1.0       rprojroot_2.0.2      withr_2.4.0          
# nortest_1.0-4        multcomp_1.4-15      mgcv_1.8-33          expm_0.999-6        
# parallel_4.0.3       hms_1.0.0            class_7.3-17         rvcheck_0.1.8        
# carData_3.0-4        lubridate_1.7.9.2 