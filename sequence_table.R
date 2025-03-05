

generate_sequence_table <- function(species, similarity, gene_length, nucleotides, num_genes, rseed = sample(1:1000, size = 1)){
  
  # --- option to set random seed if want to keep results consistent
  set.seed(rseed)
  
  genes <- data.frame(matrix(ncol = 5, nrow = 0))
  for (times in 1:num_genes){
    human_gene <- ''
    for (i in 1:gene_length){
      nuc <- sample(nucleotides, 1)
      human_gene <- paste0(human_gene, nuc)
    }
    
    species_genes <- c()
    for (i in 2:length(species)){
      species_gene <- ''
      for (j in 1:gene_length){
        test <- runif(1)
        if (test > similarity[i]){
          nuc <- sample(nucleotides[-which(nucleotides == substr(human_gene, j, j))], 1)
        }
        else{
          nuc <- substr(human_gene, j, j)
        }
        species_gene <- paste0(species_gene, nuc)
      }
      species_genes <- c(species_genes, species_gene)
    }
    
    genes <- rbind(genes, c(human_gene, species_genes))
    
    
    colnames(genes) <- species
  }
  return(genes)
}


species <- c('human', 'monkey', 'mouse', 'lizard', 'tuna')
similarity <- c(1, 0.9, 0.8, 0.7, 0.5)

gene_length <- 16
nucleotides <- c('A', 'T', 'C', 'G')


temp <- generate_sequence_table(species, similarity, gene_length = 16, nucleotides, num_genes = 5, rseed = 100)

write.table(temp, 'sample_sequence_table.tsv')
