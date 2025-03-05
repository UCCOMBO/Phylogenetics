library(ggplot2)
library(tidyr)

####################################
# Graph 1: bar plot of number of features associated with each species
species_features <- data.frame("Mouse" = c(1, 1, 1, 0, 1), "Dolphin" = c(1, 1, 1, 0, 0),
                               "Worm" = c(0, 1, 0, 0, 0), "Human" = c(1, 1, 1, 1, 1),
                               "Clownfish" = c(1, 1, 0, 0, 0))
row.names(species_features) <- c("Bones", "Skin", "Lungs", "2 Legs", "Fur or Hair")

print(species_features)

# Sum up total number of species with each feature and save in simpler table
sum_species <- data.frame("Features" = row.names(species_features), 
                          "Count" = rowSums(species_features))
row.names(sum_species) <- NULL
print(sum_species)

# Create bar plot
ggplot(sum_species, aes(x=Features, y=Count )) +
  geom_bar(stat = "identity", fill="blue") +
  theme_bw()

####################################

####################################
# Graph 2: box plot of lengths / heights of various species
species_lengths <- data.frame("Mouse" = c(5, 7.2, 6.5, 8, 5.3, 4.2, 6.1, 5.8, 6.9, 7.4), 
                              "Dolphin" = c(60.0, 81.6, 114, 144, 372, 
                                            280.8, 211.2, 124.8, 93.6, 134.4),
                              "Worm" = c(3, 5.5, 8.1, 8.4, 8.9, 13.7, 12.1, 9.4, 7.2, 10.4), 
                              "Human" = c(52, 64, 69, 75.3, 76, 57, 72.1, 66, 56.4, 60.4),
                              "Clownfish" = c(3.9, 4.8, 5.9, 7.1, 6.4, 4.2, 6.8, 7, 6.1, 5.9))
print(species_lengths)

# Reformat so that we have two columns containing the same data
species_length_reformat <- pivot_longer(species_lengths, 
                                        cols = everything(), 
                                        names_to = "Species", 
                                        values_to = "Length")

# Create boxplot of all species
ggplot(species_length_reformat, aes(x=Species, y=Length)) + 
  geom_boxplot() + 
  theme_bw()

# Zoom in on just humans
human_only <- data.frame("Species" = rep("Human", 10), 
                         "Length" = c(52, 64, 69, 75.3, 76, 57, 72.1, 66, 56.4, 60.4))

ggplot(human_only, aes(x=Species, y=Length)) + 
  geom_boxplot() + 
  theme_bw()

####################################
