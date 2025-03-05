
# CODE TO TEST OUT THE FUNCTION : 
library(ape)
source("./sequence_table.R")
source("./format_fasta.R")


# params for func
my_species <- c('human', 'monkey', 'mouse', 'lizard', 'tuna')
my_similarity <- c(1, 0.9, 0.8, 0.7, 0.5)

g <- 16
nucleotides <- c('A', 'T', 'C', 'G')
ngenes = 5

testdir = "~/Documents/stupid_test/"
dir.create(testdir, showWarnings = T)
setwd(testdir)


# ---- make sure added random seed yields a stable tree

for(i in 1:20){
  sequence_table <- generate_sequence_table(species = my_species, 
                                            similarity = my_similarity, 
                                            gene_length = g,
                                            nucleotides, 
                                            num_genes = ngenes, 
                                            rseed = 100)
  print(sequence_table)
  # make a tree for each gene 
  for(j in 1:ngenes){
    seq_tbl_row <- sequence_table[j, , drop = FALSE]
    D1 <- get_fasta_format(seq_tbl_row)
    # -- confirm this gives me the same values 
    fd <- ape::dist.gene(D1)
    # build the phylogenetic tree
    nj_tree <- nj(fd)
    png(paste0("./gene", j, "_iter", i,".png"))
    plot.phylo(nj_tree, use.edge.length=F)
    dev.off()
  }
  
  
  # Make dataframe to store all species and their genomes
  species_genomes_df <- data.frame(Species = character(), Genome = character(), stringsAsFactors = FALSE)
  
  # Loop over species (columns) and concatenate sequences using rbind()
  for (species in colnames(sequence_table)) {
    # Combine all sequences for the current species
    genome_sequence <- paste(sequence_table[[species]], collapse = "")
    
    # Append to dataframe using rbind
    species_genomes_df <- rbind(species_genomes_df, data.frame(Species = species, Genome = genome_sequence))
  }
  
  print(species_genomes_df)
  
  
  D2 <- genome_fasta_format(species_genomes_df)
  fd <- ape::dist.gene(D2)
  nj_tree <- nj(fd)
  png(paste0("./genome_iter", i,".png"))
  plot.phylo(nj_tree, use.edge.length=F)
  dev.off()
  
}


# ---- can do this again without random seed for more variable trees 

testdir = "~/Documents/stupid_test2/"
dir.create(testdir, showWarnings = T)
setwd(testdir)

for(i in 1:20){
  sequence_table <- generate_sequence_table(species = my_species, 
                                            similarity = my_similarity, 
                                            gene_length = g,
                                            nucleotides, 
                                            num_genes = ngenes)
  print(sequence_table)
  # make a tree for each gene 
  for(j in 1:ngenes){
    seq_tbl_row <- sequence_table[j, , drop = FALSE]
    D1 <- get_fasta_format(seq_tbl_row)
    # -- confirm this gives me the same values 
    fd <- ape::dist.gene(D1)
    # build the phylogenetic tree
    nj_tree <- nj(fd)
    png(paste0("./gene", j, "_iter", i,".png"))
    plot.phylo(nj_tree, use.edge.length=F)
    dev.off()
  }
  
  
  # Make dataframe to store all species and their genomes
  species_genomes_df <- data.frame(Species = character(), Genome = character(), stringsAsFactors = FALSE)
  
  # Loop over species (columns) and concatenate sequences using rbind()
  for (species in colnames(sequence_table)) {
    # Combine all sequences for the current species
    genome_sequence <- paste(sequence_table[[species]], collapse = "")
    
    # Append to dataframe using rbind
    species_genomes_df <- rbind(species_genomes_df, data.frame(Species = species, Genome = genome_sequence))
  }
  
  print(species_genomes_df)
  
  
  D2 <- genome_fasta_format(species_genomes_df)
  fd <- ape::dist.gene(D2)
  nj_tree <- nj(fd)
  png(paste0("./genome_iter", i,".png"))
  plot.phylo(nj_tree, use.edge.length=F)
  dev.off()
  
}

