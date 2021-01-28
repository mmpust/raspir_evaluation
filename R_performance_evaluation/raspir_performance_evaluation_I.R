# title: "Raspir: Performance evaluation I (simulation)"
# author: "Marie-Madlen Pust"
# last update: "24 1 2021"
# contact: pust.marie-madlen@mh-hannover.de


# clear R environment
rm(list = ls())

# load packages
library("readr")
library("ggplot2")
library("ggpubr")
library("pheatmap")
library("tidyverse")
library("grid")
library("ggplotify")
library("rcompanion")

# define functions
make_bold_names <- function(mat, rc_fun, rc_names) {
  newnames <- rc_fun(mat)
  bold_names <- lapply(newnames, function(x) bquote(italic(.(x))))
  ids <- rc_names %>% match(rc_fun(mat))
  ids %>%
    walk(
      function(i)
        bold_names[i] <<-
        bquote(bolditalic(.(rc_fun(mat)[i]))) %>%
        as.expression()
    )
  as.expression(bold_names)
}

set_base_size = 9

# import table 1 
makeHeatmap_222 <- read_delim(
  "simulation_samples/exampleRun_mockCommunity_seed222.csv", ";", 
  escape_double = FALSE, trim_ws = TRUE)
makeHeatmap_222 <- data.frame(makeHeatmap_222)
rownames(makeHeatmap_222) <- makeHeatmap_222$Species
makeHeatmap_222$Species <- NULL

# import table 2
stats02 <- read_delim("simulation_samples/raspir_run_statistics.csv", 
    ";", escape_double = FALSE, trim_ws = TRUE)
stats02 <- data.frame(stats02)

theHeatmap <-
  pheatmap(as.matrix(makeHeatmap_222),
         cluster_rows = FALSE, 
         cluster_cols = FALSE,
         border_color = "black",
         labels_row = make_bold_names(as.matrix(makeHeatmap_222), rownames,
                                      c("Rothia mucilaginosa", 
                                        "Pseudomonas aeruginosa",
                                        "Streptococcus salivarius", 
                                        "Streptococcus pneumoniae",
                                        "Streptococcus mitis", 
                                        "Streptococcus thermophilus",
                                        "Streptococcus equinus", 
                                        "Staphylococcus aureus",
                                        "Eubacterium sulci", 
                                        "Escherichia coli")),
         gaps_col = 8, 
         legend = FALSE, 
         color = c("white", 
                   "palegreen2", 
                   "orange", 
                   "forestgreen"), 
         angle_col = 0, 
         cellwidth = 30,
         fontsize = 12,
         labels_col = c("30", "50", "70", "100", 
                        "200", "300", "400", "500",
                        "30", "50", "70", "100", 
                        "200", "300", "400", "500"))

theHeatmap_gg <-
  as.ggplot(theHeatmap, scale=0.95) +
  geom_label(aes(x=0.2, y = 0.96, 
                 label = " with raspir "), fill="white", size=4.5) +
  geom_label(aes(x=0.5, y = 0.96, 
                 label = " without raspir "), fill="white", size=4.5) +
  geom_text(aes(x=0.4, y=0.04, 
                label = "Number of short reads (rare species)"), size=4.5)

#ggsave("images/Figure01.tif",
 #      plot=theHeatmap_gg,
  #     device = "tiff",
   #    width = 9.95,
    #   height = 8.71,
     #  dpi = 600,
     #  scale = 1)


# Sensitivity ####
stats02_30 <- 
  subset(stats02, Count == 30)
sens30_raspir_median = median(stats02_30$Sensitivity_raspir)
sens30_raspir_min = min(stats02_30$Sensitivity_raspir)
sens30_raspir_max = max(stats02_30$Sensitivity_raspir)
  
sens30_normal_median = median(stats02_30$Sensitivity_normal)
sens30_normal_min = min(stats02_30$Sensitivity_normal)
sens30_normal_max = max(stats02_30$Sensitivity_normal)

stats02_100 <- 
  subset(stats02, Count == 100)
sens100_raspir_median = median(stats02_100$Sensitivity_raspir)
sens100_raspir_min = min(stats02_100$Sensitivity_raspir)
sens100_raspir_max = max(stats02_100$Sensitivity_raspir)
  
sens100_normal_median = median(stats02_100$Sensitivity_normal)
sens100_normal_min = min(stats02_100$Sensitivity_normal)
sens100_normal_max = max(stats02_100$Sensitivity_normal)

stats02_200 <- 
  subset(stats02, Count == 200)
sens200_raspir_median = median(stats02_200$Sensitivity_raspir)
sens200_raspir_min = min(stats02_200$Sensitivity_raspir)
sens200_raspir_max = max(stats02_200$Sensitivity_raspir)
  
sens200_normal_median = median(stats02_200$Sensitivity_normal)
sens200_normal_min = min(stats02_200$Sensitivity_normal)
sens200_normal_max = max(stats02_200$Sensitivity_normal)

stats02_300 <- 
  subset(stats02, Count == 300)
sens300_raspir_median = median(stats02_300$Sensitivity_raspir)
sens300_raspir_min = min(stats02_300$Sensitivity_raspir)
sens300_raspir_max = max(stats02_300$Sensitivity_raspir)
  
sens300_normal_median = median(stats02_300$Sensitivity_normal)
sens300_normal_min = min(stats02_300$Sensitivity_normal)
sens300_normal_max = max(stats02_300$Sensitivity_normal)

stats02_400 <- 
  subset(stats02, Count == 400)
sens400_raspir_median = median(stats02_400$Sensitivity_raspir)
sens400_raspir_min = min(stats02_400$Sensitivity_raspir)
sens400_raspir_max = max(stats02_400$Sensitivity_raspir)
  
sens400_normal_median = median(stats02_400$Sensitivity_normal)
sens400_normal_min = min(stats02_400$Sensitivity_normal)
sens400_normal_max = max(stats02_400$Sensitivity_normal)

sens_raspir_median <-
  c(sens30_raspir_median, 
        sens100_raspir_median,
        sens200_raspir_median,
        sens300_raspir_median,
        sens400_raspir_median)

sens_raspir_min <-
  c(sens30_raspir_min,
        sens100_raspir_min,
        sens200_raspir_min,
        sens300_raspir_min,
        sens400_raspir_min)

sens_raspir_max <-
  c(sens30_raspir_max,
        sens100_raspir_max,
        sens200_raspir_max,
        sens300_raspir_max,
        sens400_raspir_max)

sens_normal_median <-
  c(sens30_normal_median, 
        sens100_normal_median,
        sens200_normal_median,
        sens300_normal_median,
        sens400_normal_median)

sens_normal_min <-
  c(sens30_normal_min,
        sens100_normal_min,
        sens200_normal_min,
        sens300_normal_min,
        sens400_normal_min)

sens_normal_max <-
  c(sens30_normal_max,
        sens100_normal_max,
        sens200_normal_max,
        sens300_normal_max,
        sens400_normal_max)

cCount <- c(30, 100, 200, 300, 400)

sens_data <- 
  as.data.frame(cbind(cCount,
                      sens_raspir_median, 
                      sens_raspir_max,
                      sens_raspir_min, sens_normal_median,
                      sens_normal_max, sens_normal_min))
                      

# Specificity ###
spec30_raspir_median = median(stats02_30$Specificity_raspir)
spec30_raspir_min = min(stats02_30$Specificity_raspir)
spec30_raspir_max = max(stats02_30$Specificity_raspir)
  
spec30_normal_median = median(stats02_30$Specificity_normal)
spec30_normal_min = min(stats02_30$Specificity_normal)
spec30_normal_max = max(stats02_30$Specificity_normal)

spec100_raspir_median = median(stats02_100$Specificity_raspir)
spec100_raspir_min = min(stats02_100$Specificity_raspir)
spec100_raspir_max = max(stats02_100$Specificity_raspir)
  
spec100_normal_median = median(stats02_100$Specificity_normal)
spec100_normal_min = min(stats02_100$Specificity_normal)
spec100_normal_max = max(stats02_100$Specificity_normal)

spec200_raspir_median = median(stats02_200$Specificity_raspir)
spec200_raspir_min = min(stats02_200$Specificity_raspir)
spec200_raspir_max = max(stats02_200$Specificity_raspir)
  
spec200_normal_median = median(stats02_200$Specificity_normal)
spec200_normal_min = min(stats02_200$Specificity_normal)
spec200_normal_max = max(stats02_200$Specificity_normal)

spec300_raspir_median = median(stats02_300$Specificity_raspir)
spec300_raspir_min = min(stats02_300$Specificity_raspir)
spec300_raspir_max = max(stats02_300$Specificity_raspir)
  
spec300_normal_median = median(stats02_300$Specificity_normal)
spec300_normal_min = min(stats02_300$Specificity_normal)
spec300_normal_max = max(stats02_300$Specificity_normal)

spec400_raspir_median = median(stats02_400$Specificity_raspir)
spec400_raspir_min = min(stats02_400$Specificity_raspir)
spec400_raspir_max = max(stats02_400$Specificity_raspir)
  
spec400_normal_median = median(stats02_400$Specificity_normal)
spec400_normal_min = min(stats02_400$Specificity_normal)
spec400_normal_max = max(stats02_400$Specificity_normal)

spec_raspir_median <-
  c(spec30_raspir_median, 
        spec100_raspir_median,
        spec200_raspir_median,
        spec300_raspir_median,
        spec400_raspir_median)

spec_raspir_min <-
  c(spec30_raspir_min,
        spec100_raspir_min,
        spec200_raspir_min,
        spec300_raspir_min,
        spec400_raspir_min)

spec_raspir_max <-
  c(spec30_raspir_max,
        spec100_raspir_max,
        spec200_raspir_max,
        spec300_raspir_max,
        spec400_raspir_max)

spec_normal_median <-
  c(spec30_normal_median, 
        spec100_normal_median,
        spec200_normal_median,
        spec300_normal_median,
        spec400_normal_median)

spec_normal_min <-
  c(spec30_normal_min,
        spec100_normal_min,
        spec200_normal_min,
        spec300_normal_min,
        spec400_normal_min)

spec_normal_max <-
  c(spec30_normal_max,
        spec100_normal_max,
        spec200_normal_max,
        spec300_normal_max,
        spec400_normal_max)

spec_data <- 
  as.data.frame(cbind(cCount,
                      spec_raspir_median, 
                      spec_raspir_max,
                      spec_raspir_min, spec_normal_median,
                      spec_normal_max, spec_normal_min))


# False discovery rate
FDR_30_raspir_median = median(stats02_30$FDR_raspir)
FDR_30_raspir_min = min(stats02_30$FDR_raspir)
FDR_30_raspir_max = max(stats02_30$FDR_raspir)
  
FDR_30_normal_median = median(stats02_30$FDR_normal)
FDR_30_normal_min = min(stats02_30$FDR_normal)
FDR_30_normal_max = max(stats02_30$FDR_normal)


FDR_100_raspir_median = median(stats02_100$FDR_raspir)
FDR_100_raspir_min = min(stats02_100$FDR_raspir)
FDR_100_raspir_max = max(stats02_100$FDR_raspir)
  
FDR_100_normal_median = median(stats02_100$FDR_normal)
FDR_100_normal_min = min(stats02_100$FDR_normal)
FDR_100_normal_max = max(stats02_100$FDR_normal)

FDR_200_raspir_median = median(stats02_200$FDR_raspir)
FDR_200_raspir_min = min(stats02_200$FDR_raspir)
FDR_200_raspir_max = max(stats02_200$FDR_raspir)
  
FDR_200_normal_median = median(stats02_200$FDR_normal)
FDR_200_normal_min = min(stats02_200$FDR_normal)
FDR_200_normal_max = max(stats02_200$FDR_normal)

FDR_300_raspir_median = median(stats02_300$FDR_raspir)
FDR_300_raspir_min = min(stats02_300$FDR_raspir)
FDR_300_raspir_max = max(stats02_300$FDR_raspir)
  
FDR_300_normal_median = median(stats02_300$FDR_normal)
FDR_300_normal_min = min(stats02_300$FDR_normal)
FDR_300_normal_max = max(stats02_300$FDR_normal)

FDR_400_raspir_median = median(stats02_400$FDR_raspir)
FDR_400_raspir_min = min(stats02_400$FDR_raspir)
FDR_400_raspir_max = max(stats02_400$FDR_raspir)
  
FDR_400_normal_median = median(stats02_400$FDR_normal)
FDR_400_normal_min = min(stats02_400$FDR_normal)
FDR_400_normal_max = max(stats02_400$FDR_normal)

FDR_raspir_median <-
  c(FDR_30_raspir_median, 
        FDR_100_raspir_median,
        FDR_200_raspir_median,
        FDR_300_raspir_median,
        FDR_400_raspir_median)

FDR_raspir_min <-
  c(FDR_30_raspir_min,
        FDR_100_raspir_min,
        FDR_200_raspir_min,
        FDR_300_raspir_min,
        FDR_400_raspir_min)

FDR_raspir_max <-
  c(FDR_30_raspir_max,
        FDR_100_raspir_max,
        FDR_200_raspir_max,
        FDR_300_raspir_max,
        FDR_400_raspir_max)

FDR_normal_median <-
  c(FDR_30_normal_median, 
        FDR_100_normal_median,
        FDR_200_normal_median,
        FDR_300_normal_median,
        FDR_400_normal_median)

FDR_normal_min <-
  c(FDR_30_normal_min,
        FDR_100_normal_min,
        FDR_200_normal_min,
        FDR_300_normal_min,
        FDR_400_normal_min)

FDR_normal_max <-
  c(FDR_30_normal_max,
        FDR_100_normal_max,
        FDR_200_normal_max,
        FDR_300_normal_max,
        FDR_400_normal_max)

FDR_data <- 
  as.data.frame(cbind(cCount,
                      FDR_raspir_median, 
                      FDR_raspir_max,
                      FDR_raspir_min, FDR_normal_median,
                      FDR_normal_max, FDR_normal_min))

# False omission rate
FOR_30_raspir_median = median(stats02_30$FOR_raspir)
FOR_30_raspir_min = min(stats02_30$FOR_raspir)
FOR_30_raspir_max = max(stats02_30$FOR_raspir)
  
FOR_30_normal_median = median(stats02_30$FOR_normal)
FOR_30_normal_min = min(stats02_30$FOR_normal)
FOR_30_normal_max = max(stats02_30$FOR_normal)


FOR_100_raspir_median = median(stats02_100$FOR_raspir)
FOR_100_raspir_min = min(stats02_100$FOR_raspir)
FOR_100_raspir_max = max(stats02_100$FOR_raspir)
  
FOR_100_normal_median = median(stats02_100$FOR_normal)
FOR_100_normal_min = min(stats02_100$FOR_normal)
FOR_100_normal_max = max(stats02_100$FOR_normal)

FOR_200_raspir_median = median(stats02_200$FOR_raspir)
FOR_200_raspir_min = min(stats02_200$FOR_raspir)
FOR_200_raspir_max = max(stats02_200$FOR_raspir)
  
FOR_200_normal_median = median(stats02_200$FOR_normal)
FOR_200_normal_min = min(stats02_200$FOR_normal)
FOR_200_normal_max = max(stats02_200$FOR_normal)

FOR_300_raspir_median = median(stats02_300$FOR_raspir)
FOR_300_raspir_min = min(stats02_300$FOR_raspir)
FOR_300_raspir_max = max(stats02_300$FOR_raspir)
  
FOR_300_normal_median = median(stats02_300$FOR_normal)
FOR_300_normal_min = min(stats02_300$FOR_normal)
FOR_300_normal_max = max(stats02_300$FOR_normal)

FOR_400_raspir_median = median(stats02_400$FOR_raspir)
FOR_400_raspir_min = min(stats02_400$FOR_raspir)
FOR_400_raspir_max = max(stats02_400$FOR_raspir)
  
FOR_400_normal_median = median(stats02_400$FOR_normal)
FOR_400_normal_min = min(stats02_400$FOR_normal)
FOR_400_normal_max = max(stats02_400$FOR_normal)

FOR_raspir_median <-
  c(FOR_30_raspir_median, 
        FOR_100_raspir_median,
        FOR_200_raspir_median,
        FOR_300_raspir_median,
        FOR_400_raspir_median)

FOR_raspir_min <-
  c(FOR_30_raspir_min,
        FOR_100_raspir_min,
        FOR_200_raspir_min,
        FOR_300_raspir_min,
        FOR_400_raspir_min)

FOR_raspir_max <-
  c(FOR_30_raspir_max,
        FOR_100_raspir_max,
        FOR_200_raspir_max,
        FOR_300_raspir_max,
        FOR_400_raspir_max)

FOR_normal_median <-
  c(FOR_30_normal_median, 
        FOR_100_normal_median,
        FOR_200_normal_median,
        FOR_300_normal_median,
        FOR_400_normal_median)

FOR_normal_min <-
  c(FOR_30_normal_min,
        FOR_100_normal_min,
        FOR_200_normal_min,
        FOR_300_normal_min,
        FOR_400_normal_min)

FOR_normal_max <-
  c(FOR_30_normal_max,
        FOR_100_normal_max,
        FOR_200_normal_max,
        FOR_300_normal_max,
        FOR_400_normal_max)

FOR_data <- 
  as.data.frame(cbind(cCount,
                      FOR_raspir_median, 
                      FOR_raspir_max,
                      FOR_raspir_min, FOR_normal_median,
                      FOR_normal_max, FOR_normal_min))


# Data visualisation
set_base_size = 9
sens_plot <-
  ggplot(data=sens_data) +
  geom_pointrange(aes(x=cCount, 
                      y=sens_raspir_median, 
                      ymin=sens_raspir_min,
                      ymax=sens_raspir_max), 
                  color="red") +
  geom_line(aes(x=cCount, y=sens_raspir_median), 
            color="red", size=1, alpha=0.5) +
  geom_pointrange(aes(x=cCount, 
                      y=sens_normal_median,
                      ymin=sens_normal_min,
                      ymax=sens_normal_max),
                  color="black") +
  geom_line(aes(x=cCount, y=sens_normal_median), 
            color="black", size=1, alpha=0.5) +
  ylab("Sensitivity   ") +
  ylim(-2,102) +
  xlab(" ") +
  theme_pubr(border=TRUE, base_size = 6) +
  theme(axis.text.x = element_blank())



spec_plot <-
  ggplot(data=spec_data) +
  geom_pointrange(aes(x=cCount, 
                      y=spec_raspir_median, 
                      ymin=spec_raspir_min,
                      ymax=spec_raspir_max),
                  color="red") +
  geom_line(aes(x=cCount, y=spec_raspir_median), 
            color="red", size=1, alpha=0.5) +
  geom_pointrange(aes(x=cCount, 
                      y=spec_normal_median,
                      ymin=spec_normal_min,
                      ymax=spec_normal_max),
                  color="black") +
  geom_line(aes(x=cCount, y=spec_normal_median), 
            color="black", size=1, alpha=0.5) +
  ylab("  Specificity   ") +
  ylim(-2,102) +
  xlab(" ") +
  theme_pubr(border=TRUE, base_size = 6) +
  theme(axis.text.x = element_blank())


FDR_plot <-
  ggplot(data=FDR_data) +
  geom_pointrange(aes(x=cCount, 
                      y=FDR_raspir_median, 
                      ymin=FDR_raspir_min,
                      ymax=FDR_raspir_max), color="red") +
  geom_line(aes(x=cCount, y=FDR_raspir_median), 
            color="red", size=1, alpha=0.5) +
  geom_pointrange(aes(x=cCount, 
                      y=FDR_normal_median,
                      ymin=FDR_normal_min,
                      ymax=FDR_normal_max),
                  color="black") +
  geom_line(aes(x=cCount, y=FDR_normal_median), 
            color="black", size=1, alpha=0.5) +
  ylab("False discovery rate    ") +
  ylim(-2,102) +
  xlab("Number of reads (rare species)") +
  theme_pubr(border=TRUE, base_size = 6) 



FOR_plot <-
  ggplot(data=FOR_data) +
  geom_pointrange(aes(x=cCount, 
                      y=FOR_raspir_median, 
                      ymin=FOR_raspir_min,
                      ymax=FOR_raspir_max), color="red") +
  geom_line(aes(x=cCount, y=FOR_raspir_median), color="red", 
            size=1, alpha=0.5) +
  geom_pointrange(aes(x=cCount, 
                      y=FOR_normal_median,
                      ymin=FOR_normal_min,
                      ymax=FOR_normal_max),
                  color="black") +
  geom_line(aes(x=cCount, y=FOR_normal_median), color="black", 
            size=1, alpha=0.5) +
  ylab("False omission rate     ") +
  ylim(-2,102) +
  xlab("Number of reads (rare species)") +
  theme_pubr(border=TRUE, base_size = 6)

raspir_statistics <-
  ggarrange(sens_plot, spec_plot,
            FDR_plot, FOR_plot, nrow = 2, ncol = 2,
            labels = c("A", "B", "C", "D"),
            font.label = list(size = 6, color = "black"))

#ggsave("images/Figure02.tif",
 #      raspir_statistics,
  #     device="tiff",
   #    width=4,
    #   height = 4,
     #  dpi=600)



# Statistical comparison
stats02 <- subset(stats02, Count != 500)

# Normality testing
# shapiro.test(stats02$Sensitivity_raspir)
# shapiro.test(stats02$Sensitivity_normal)
# shapiro.test(stats02$Specificity_raspir)
# shapiro.test(stats02$Specificity_normal)
# shapiro.test(stats02$FDR_raspir)
# shapiro.test(stats02$FDR_normal)
# shapiro.test(stats02$FOR_raspir)
# shapiro.test(stats02$FOR_normal)
# Conclusion: The data has no normal distribution

stats02_raspir <- 
  select(stats02, c(Count, Specificity_raspir, Sensitivity_raspir,
                    FDR_raspir, FOR_raspir))
stats02_raspir$Tool <- "raspir"
colnames(stats02_raspir) <- c("Count", "Specificity", 
                              "Sensitivity", "FDR", "FOR", "Tool")

stats02_normal <- 
  select(stats02, c(Count, Specificity_normal, Sensitivity_normal,
                    FDR_normal, FOR_normal))
stats02_normal$Tool <- "normal"
colnames(stats02_normal) <- c("Count", "Specificity", 
                              "Sensitivity", "FDR", "FOR", "Tool")

stat_compare_df <-
  rbind(stats02_raspir,
        stats02_normal)


# Mann whitney U test
# Specificity
wilcox.test(stat_compare_df$Specificity ~ stat_compare_df$Tool)
wilcoxonR(x = stat_compare_df$Specificity,
          g = stat_compare_df$Tool,
          ci = TRUE)

# Sensitivity
wilcox.test(stat_compare_df$Sensitivity ~ stat_compare_df$Tool)
wilcoxonR(x = stat_compare_df$Sensitivity,
          g = stat_compare_df$Tool,
          ci = TRUE)

# False discovery rate
wilcox.test(stat_compare_df$FDR ~ stat_compare_df$Tool)
wilcoxonR(x = stat_compare_df$FDR,
          g = stat_compare_df$Tool,
          ci = TRUE)

# False omission rate
wilcox.test(stat_compare_df$FOR ~ stat_compare_df$Tool)
wilcoxonR(x = stat_compare_df$FOR,
          g = stat_compare_df$Tool,
          ci = TRUE)

# The influence of the aligner tool (bwa vs bowtie) on raspir's performance
# Mann-Whitey-U test
# Sensitivity
wilcox.test(stats02$Sensitivity_raspir ~ stats02$Aligner)
wilcoxonR(x = stats02$Sensitivity_raspir,
          g = stats02$Aligner,
          ci = TRUE)


# Specificity
wilcox.test(stats02$Specificity_raspir ~ as.factor(stats02$Aligner))
wilcoxonR(x = stats02$Specificity_raspir,
          g = as.factor(stats02$Aligner),
          ci = TRUE)


# FOR
wilcox.test(stats02$FOR_raspir ~ stats02$Aligner)
wilcoxonR(x = stats02$FOR_raspir,
          g = stats02$Aligner,
          ci = TRUE)

# FDR
wilcox.test(stats02$FDR_raspir ~ stats02$Aligner)
wilcoxonR(x = stats02$FDR_raspir,
          g = stats02$Aligner,
          ci = TRUE)

##############################################################################
# sessionInfo()
# R version 4.0.3 (2020-10-10)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 10 x64 (build 19041)

# attached base packages:
# grid      stats     graphics  grDevices utils     datasets  methods   base     

# other attached packages:
# rcompanion_2.3.26 ggplotify_0.0.5   forcats_0.5.0     stringr_1.4.0     
# dplyr_1.0.2       purrr_0.3.4       tidyr_1.1.2       tibble_3.0.4      
# tidyverse_1.3.0   pheatmap_1.0.12  ggpubr_0.4.0      ggplot2_3.3.3     
# readr_1.4.0      

# loaded via a namespace (and not attached):
# TH.data_1.0-10       colorspace_2.0-0     ggsignif_0.6.0       ellipsis_0.3.1       
# class_7.3-17         modeltools_0.2-23    rio_0.5.16           fs_1.5.0            
# gld_2.6.2            rstudioapi_0.13      farver_2.0.3         rstan_2.21.2         
# fansi_0.4.1          mvtnorm_1.1-1        lubridate_1.7.9.2    coin_1.4-0          
# xml2_1.3.2           codetools_0.2-16     splines_4.0.3        rootSolve_1.8.2.1    
# libcoin_1.0-7        knitr_1.30           jsonlite_1.7.2       broom_0.7.3         
# dbplyr_2.0.0         BiocManager_1.30.10  compiler_4.0.3       httr_1.4.2           
# rvcheck_0.1.8        backports_1.2.0      assertthat_0.2.1     Matrix_1.2-18       
# cli_2.2.0            prettyunits_1.1.1    tools_4.0.3          gtable_0.3.0         
# glue_1.4.2           lmom_2.8             V8_3.4.0             Rcpp_1.0.6          
# carData_3.0-4        cellranger_1.1.0     vctrs_0.3.5          lmtest_0.9-38        
# xfun_0.20            ps_1.5.0             openxlsx_4.2.3       rvest_0.3.6         
# lifecycle_0.2.0      rstatix_0.6.0        MASS_7.3-53          zoo_1.8-8            
# scales_1.1.1         hms_1.0.0            parallel_4.0.3       sandwich_3.0-0      
# inline_0.3.17        expm_0.999-6         RColorBrewer_1.1-2   curl_4.3             
# Exact_2.1            gridExtra_2.3        loo_2.4.1            StanHeaders_2.21.0-7
# EMT_1.1              stringi_1.5.3        nortest_1.0-4        e1071_1.7-4          
# boot_1.3-25          pkgbuild_1.2.0       zip_2.1.1            rlang_0.4.9         
# pkgconfig_2.0.3      matrixStats_0.57.0   lattice_0.20-41      labeling_0.4.2       
# cowplot_1.1.1        tidyselect_1.1.0     processx_3.4.5       plyr_1.8.6          
# magrittr_2.0.1       R6_2.5.0             DescTools_0.99.39    generics_0.1.0       
# multcompView_0.1-8   multcomp_1.4-15      DBI_1.1.1            pillar_1.4.7        
# haven_2.3.1          foreign_0.8-80       withr_2.4.0          survival_3.2-7       
# abind_1.4-5          modelr_0.1.8         crayon_1.3.4         car_3.0-10   
# readxl_1.3.1         data.table_1.13.6    callr_3.5.1          reprex_0.3.0         
# digest_0.6.27        gridGraphics_0.5-1   RcppParallel_5.0.2   stats4_4.0.3   
# munsell_0.5.0       



