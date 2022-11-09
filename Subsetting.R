# 11/8/2022

# Libraries
library(qiime2R) #
library(readr) #
library(plyr) #
library(tidyr) #
library(ggplot2) #
library(dplyr) #
library(readxl) #
library(vegan) #
library(ape)
library(cowplot)

#setwd("SET YOUR WORKING DIRECTORY")
# Coded as if directory is set to the file I sent

#### Import Files ####
metadata <- read_xlsx("Full_Adult_Metadata.xlsx", sheet = 1)

# Reorder metadata - important so that order matches the asv table and distance matrices
metadata <- metadata[order(metadata$SampleID), ]
asv_table <- read_csv("ASV_table_for_Doug.csv")
taxonomy <- read_csv("master_taxonomy_file.csv")

# Beta diversity distance matrices
master_bray_q <- qiime2R::read_qza("bray_curtis_distance_matrix.qza") %>% .$data %>% as.matrix()
master_jaccard_q <- qiime2R::read_qza("jaccard_distance_matrix.qza") %>% .$data %>% as.matrix()
master_unweighted_q <- qiime2R::read_qza("unweighted_unifrac_distance_matrix.qza") %>% .$data %>% as.matrix()
master_weighted_q <- qiime2R::read_qza("weighted_unifrac_distance_matrix.qza") %>% .$data %>% as.matrix()




#### Subset to only Capture Data ####

# Filter to only capture samples (ALL - exposed and unexposed)
metadata_capture <- metadata %>% filter(exposure == "Capture")

# Select only capture samples (ALL - exposed and unexposed)
asv_table_capture <- asv_table %>% select(contains("CAP")) %>%
  # Remove ASVs that are not present in the capture samples (N = 301 removed)
  filter(rowSums(.) != 0)

# Filter to only capture samples (Only exposed)
modeling_adult_data_cap <- metadata_capture %>% 
  # select only individuals that were exposed in phase 1 
  filter(Exposed_E1 == 1)

# Reorder data so that the order in the metadata matches distance matricies
# THIS IS CRITICAL - analysis will be wrong without this!
modeling_adult_data_cap <- modeling_adult_data_cap[order(modeling_adult_data_cap$SampleID), ]

# Subset matrices to only capture samples of individuals exposed in the first phase
capture_weighted_dist <- master_weighted_q  %>% 
  as.data.frame() %>% 
  tibble::rownames_to_column(var = "t") %>% 
  filter(t %in% modeling_adult_data_cap$SampleID) %>% 
  tibble::column_to_rownames("t") %>% 
  t() %>% as.data.frame() %>% 
  tibble::rownames_to_column(var = "t")%>% 
  filter(t %in% modeling_adult_data_cap$SampleID) %>% 
  tibble::column_to_rownames("t") %>% 
  t() %>% as.dist()

capture_bray <-  master_bray_q %>% 
  as.data.frame() %>% 
  tibble::rownames_to_column(var = "t") %>% 
  filter(t %in% modeling_adult_data_cap$SampleID) %>% 
  tibble::column_to_rownames("t") %>% 
  t() %>% as.data.frame() %>% 
  tibble::rownames_to_column(var = "t")%>% 
  filter(t %in% modeling_adult_data_cap$SampleID) %>% 
  tibble::column_to_rownames("t") %>% 
  t() %>% as.dist()

capture_unweighted_dist <-  master_unweighted_q  %>% 
  as.data.frame() %>% 
  tibble::rownames_to_column(var = "t") %>% 
  filter(t %in% modeling_adult_data_cap$SampleID) %>% 
  tibble::column_to_rownames("t") %>% 
  t() %>% as.data.frame() %>% 
  tibble::rownames_to_column(var = "t")%>% 
  filter(t %in% modeling_adult_data_cap$SampleID) %>% 
  tibble::column_to_rownames("t") %>% 
  t() %>% as.dist()


# End subsetting to capture data








#### Data analysis I did to look at 'predictive' capacity of the microbiome at point of capture ####



### Check Dispersion

# Unweighted Unifrac Dispersion
disp_cap_uw <- betadisper(capture_unweighted_dist, modeling_adult_data_cap$survived_E1)
anova(disp_cap_uw) # Not significant

# Weighted Unifrac Dispersion
disp_cap_w <- betadisper(capture_weighted_dist, modeling_adult_data_cap$survived_E1)
anova(disp_cap_w) # Significant dispersion

# Bray Curtis Dispersion
disp_cap_b <- betadisper(capture_bray, modeling_adult_data_cap$survived_E1)
anova(disp_cap_b) # Significant dispersion

# Keep in mind the differences we see come out in the PERMANOVAs below
# are likely driven by the differences in dispersion, not locational effects
# This is reflected in the visualizations



### PERMANOVA Models
set.seed(382735)
ad_unW <- adonis2(capture_unweighted_dist ~  survived_E1 + Capture.Mass.g, 
                  data = modeling_adult_data_cap, permutations = 999)

set.seed(382735)
ad_W <- adonis2(capture_weighted_dist ~  survived_E1 + Capture.Mass.g, 
                data = modeling_adult_data_cap, permutations = 999)

set.seed(382735)
ad_B <- adonis2(capture_bray ~  survived_E1 + Capture.Mass.g, 
                data = modeling_adult_data_cap, permutations = 999)




### Data Visualization

# Calculate PCoA axis for Bray Curtis
pcoa_cap_b <- ape::pcoa(capture_bray %>% as.dist())
pcoa_cap_b$values$Relative_eig[1:3]

# Set color palette
cbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# Plot Bray Curtis
cap_predict_bray_plot <- pcoa_cap_b$vectors %>% as.data.frame() %>% tibble::rownames_to_column("SampleID") %>% 
  merge(modeling_adult_data_cap, by = "SampleID", all.x = TRUE) %>% 
  ggplot(aes(y = Axis.2, x = Axis.1, color = survived_E1)) +
  geom_point() + 
  #facet_wrap(.~days_post_exposure, nrow = 2) +
  stat_ellipse() +
  theme_classic() +
  scale_color_manual(values = cbPalette) +
  labs(y = "PCoA 2 (16.08% variation)",
       x = "PCoA 1 (47.64% variation)",
       color = "Survival Outcome",
       subtitle = "Capture - Bray Curtis",
       color = "Phase One Outcome") +
  theme(legend.position = "none")

# Calculate PCoA axis for Weighted Unifrac
pcoa_cap_w <- ape::pcoa(capture_weighted_dist %>% as.dist())
pcoa_cap_w$values$Relative_eig[1:3]

# Plot Weighted Unifrac
cap_predict_w_plot <- pcoa_cap_w$vectors %>% as.data.frame() %>% tibble::rownames_to_column("SampleID") %>% 
  merge(modeling_adult_data_cap, by = "SampleID", all.x = TRUE) %>% 
  ggplot(aes(y = Axis.2, x = Axis.1, color = survived_E1)) +
  geom_point() + 
  #facet_wrap(.~days_post_exposure, nrow = 2) +
  stat_ellipse() +
  theme_classic() +
  scale_color_manual(values = cbPalette) +
  labs(y = "PCoA 2 (17.48% variation)",
       x = "PCoA 1 (52.68% variation)",
       subtitle = "Capture - Weighted Unifrac",
       color = "Phase One\nOutcome") +
  theme(legend.position = c(.9,.8),
        legend.title = element_text(size = 9.5))

# Calculate PCoA axis for Unweighted Unifrac
pcoa_cap_uw <- ape::pcoa(capture_unweighted_dist %>% as.dist())
pcoa_cap_uw$values$Relative_eig[1:3]

# Plot Unweighted Unifrac
cap_predict_uw_plot <- pcoa_cap_uw$vectors %>% as.data.frame() %>% tibble::rownames_to_column("SampleID") %>% 
  merge(modeling_adult_data_cap, by = "SampleID", all.x = TRUE) %>% 
  ggplot(aes(y = Axis.2, x = Axis.1, color = survived_E1)) +
  geom_point() + 
  #facet_wrap(.~days_post_exposure, nrow = 2) +
  stat_ellipse() +
  theme_classic() +
  scale_color_manual(values = cbPalette) +
  labs(y = "PCoA 2 (7.67% variation)",
       x = "PCoA 1 (25.71% variation)",
       subtitle = "Capture - Unweighted Unifrac",
       color = "Phase One\nOutcome") +
  theme(legend.position = c(.9,.8),
        legend.title = element_text(size = 9.5))


# Plot together
plot_grid(cap_predict_bray_plot, cap_predict_w_plot,
                labels = "AUTO",
                ncol = 2)






