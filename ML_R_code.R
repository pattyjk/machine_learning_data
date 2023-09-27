##Machine learning R analysis
library(ggplot2)
library(reshape2)
library(dplyr)
library(tibble)
library(purrr)

###Process bates data
#read in Bates data
bates_metag <- read.delim("C:/Users/patty/OneDrive/Documents/GitHub/machine_learning_data/bates_metag_comparison.txt")

#reshape Bates data
bates_m<-melt(bates_metag)
bates_m$type<-bates_m$variable
bates_m$type2<-bates_m$variable
bates_m$type<-gsub("^[^:]*_", "", bates_m$type)
bates_m$type2<-gsub("_[^_]+$", "", bates_m$type2)
bates_split<-split(bates_m, bates_m$type)
bates_m<-merge(bates_split$m, bates_split$S16, by='function.')

# Calculate correlations 
bates_correlations <- by(bates_m, INDICES = bates_m$type2.x, FUN = function(sub_df) {
  cor(sub_df$value.x, sub_df$value.y, method = "spearman")
})

#bind to a dataframe, add column for study name, and fix column names
bates_correlations2<-map_dfr(bates_correlations, enframe, .id = 'type2.x')
bates_correlations2<-bates_correlations2[,-2]
names(bates_correlations2)<-c("SampleID", "Spearman_rho")
bates_correlations2$Study<-'Bates et al (2022)'

###Analyze Eria's data
#read in Bates data
eria_metag <- read.delim("C:/Users/patty/OneDrive/Documents/GitHub/machine_learning_data/eria_metag_comparison.txt")

#reshape Eria's data
eria_m<-melt(eria_metag)
eria_m$type<-eria_m$variable
eria_m$type2<-eria_m$variable
eria_m$type<-gsub("^[^:]*_", "", eria_m$type)
eria_m$type2<-gsub("_[^_]+$", "", eria_m$type2)
eria_split<-split(eria_m, eria_m$type)
eria_m<-merge(eria_split$m, eria_split$S16, by='function.')



# Calculate correlations 
eria_correlations <- by(eria_m, INDICES = eria_m$type2.x, FUN = function(sub_df) {
  cor(sub_df$value.x, sub_df$value.y, method = "spearman")
})

#bind to a dataframe, add column for study name, and fix column names
eria_correlations2<-map_dfr(eria_correlations, enframe, .id = 'type2.x')
eria_correlations2<-eria_correlations2[,-2]
names(eria_correlations2)<-c("SampleID", "Spearman_rho")
eria_correlations2$Study<-'Rebollar et al (2018)'


###Analyze Joe's data
#read in Joe's data
joe_metag <- read.delim("C:/Users/patty/OneDrive/Documents/GitHub/machine_learning_data/joe_metag_comparison.txt")

#reshape Bates data
joe_m<-melt(joe_metag)
joe_m$type<-joe_m$variable
joe_m$type2<-joe_m$variable
joe_m$type<-gsub("^[^:]*_", "", joe_m$type)
joe_m$type2<-gsub("_[^_]+$", "", joe_m$type2)
joe_split<-split(joe_m, joe_m$type)
joe_m<-merge(joe_split$m, joe_split$S16, by='function.')

# Calculate correlations 
joe_correlations <- by(joe_m, INDICES = joe_m$type2.x, FUN = function(sub_df) {
  cor(sub_df$value.x, sub_df$value.y, method = "spearman")
})

#bind to a dataframe, add column for study name, and fix column names
joe_correlations2<-map_dfr(joe_correlations, enframe, .id = 'type2.x')
joe_correlations2<-joe_correlations2[,-2]
names(joe_correlations2)<-c("SampleID", "Spearman_rho")
joe_correlations2$Study<-'Madison et al (2023)'

#bind all data together to plot for figure
all_correlations<-rbind(eria_correlations2, bates_correlations2, joe_correlations2)
ggplot(all_correlations, aes(Study, Spearman_rho))+
  geom_boxplot()+
  theme_bw()+
  xlab("")+
  coord_flip()+
  geom_jitter()+
  ylab("Spearman Rho")




################Permutation analyis via Sun et al. 2020, Microbiome

###load in data frames
joe_metag <- read.delim("C:/Users/patty/OneDrive/Documents/GitHub/machine_learning_data/joe_metag_comparison.txt")
eria_metag <- read.delim("C:/Users/patty/OneDrive/Documents/GitHub/machine_learning_data/eria_metag_comparison.txt")
bates_metag <- read.delim("C:/Users/patty/OneDrive/Documents/GitHub/machine_learning_data/bates_metag_comparison.txt")

#split into separate tables for 16S/metaG for each study
library(dplyr)
eria_S16<- eria_metag %>% select(-contains("m")) 
eria_metag<-eria_metag %>% select(-contains("S16"))

bates_S16<-bates_metag %>% select(-contains("m")) 
bates_metag<-bates_metag %>% select(-contains("S16"))

joe_S16<-joe_metag %>% select(-contains("m"))
joe_metag<-joe_metag %>% select(-contains("S16"))

# Function to randomize values in all columns of a data frame
randomize_data_frame <- function(df, num_iterations = 1000) {
  randomized_dfs <- list()  # Initialize a list to store the randomized data frames
  
  for (i in 1:num_iterations) {
    # Create a copy of the original data frame
    randomized_df <- df
    
    # Randomize values in all columns
    for (col in 1:ncol(randomized_df)) {
      randomized_df[, col] <- sample(randomized_df[, col])
    }
    
    # Generate a unique name for the data frame
    df_name <- paste("Randomized_df_", i, sep = "")
    
    # Add the randomized data frame to the list with a unique name
    randomized_dfs[[df_name]] <- randomized_df
  }
  
  return(randomized_dfs)
}

#permutate data frames 1000 times, write to list of dataframes
eria_rando<-randomize_data_frame(eria_metag, 1000)
eria_rando2<-randomize_data_frame(eria_S16, 1000)

##reshape the dataframes
library(reshape2)

#write function
melt_data_frame <- function(df) {
  melted_df <- melt(df)
  return(melted_df)
}

#apply function (will get a lot of output from reshape, ignore)
eria_melt<-lapply(eria_rando, melt_data_frame)
eria_melt2<-lapply(eria_rando2, melt_data_frame)

#make some metadata (just sample name) for each with a function to use with lapply
add_new_column <- function(df) {
  df$type2 <- df$variable 
  return(df)
}

#run function to add new column
eria_melt<-lapply(eria_melt, add_new_column)
eria_melt2<-lapply(eria_melt2, add_new_column)

#use gsub to rename the columns
apply_gsub_to_column <- function(df, column_name, pattern, replacement) {
  df[[column_name]] <- gsub(pattern, replacement, df[[column_name]])
  return(df)
}

#define pieces in dataframe I want to change
column_name <- "type2"  
pattern <- "_[^_]+$"               
replacement <- ""

#apply function to get a column in each data frame for sample name
eria_melt <- lapply(eria_melt, function(df) {
  apply_gsub_to_column(df, column_name, pattern, replacement)
})

eria_melt2 <- lapply(eria_melt2, function(df) {
  apply_gsub_to_column(df, column_name, pattern, replacement)
})

##add the name of the dataframe to each unique dataframe
# Function to add a column with the data frame name
add_data_frame_name_column <- function(df, df_name) {
  df$DataFrameName <- df_name  
  return(df)
}

# Apply the add_data_frame_name_column function to each data frame in the list
eria_melt <- lapply(names(eria_melt), function(df_name) {
  add_data_frame_name_column(eria_melt[[df_name]], df_name)
})

eria_melt2 <- lapply(names(eria_melt2), function(df_name) {
  add_data_frame_name_column(eria_melt2[[df_name]], df_name)
})

#bind all the data into data frames for 16S and metaG
eria_melt_metaG<-do.call(rbind, eria_melt)
eria_melt_S16<-do.call(rbind, eria_melt2)
names(eria_melt_S16)<-c("function", 'variable', 'value_16s', 'type2', 'DataFrameName')

#bind data
eria_melt_full<-cbind(as.data.frame(eria_melt_S16$value_16s), eria_melt_metaG)
names(eria_melt_full)<-c("value16s", 'function', 'variable', 'valuemeta', 'type2', 'dataframename')

# Calculate Spearman correlations for each combination of factor levels
eria_suffled_correlations <- by(eria_melt_full, INDICES = list(eria_melt_full$type2, eria_melt_full), FUN = function(sub_df) {
  result <- cor.test(sub_df$X, sub_df$Y, method = "spearman")
  return(result$estimate)
})