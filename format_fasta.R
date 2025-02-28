## quick little function to convert our sequence table entries into fasta format 


get_fasta_format <- function(seq_tbl_row){
  
  # have to split it up into species X each base pair 
  D <- t(seq_tbl_row)
  D1<-t(as.data.frame(strsplit(D[,1], split = "")))

  return(D1)
}

# CODE TO TEST OUT THE FUNCTION : 
# library(ape)
# source("~/Documents/UChicago/UCOMBO/github/Phylogenetics/sequence_table.R")
# my_fasta <- read.dna("/Users/liz/Documents/UChicago/UCOMBO/github/Phylogenetics/test2_fasta.fasta",format="fasta")

# sequence_table <- temp
# seq_tbl_row <- sequence_table[1, , drop = FALSE]

# -- confirm this gives me the same values 
# dist.gene(my_fasta)
# dist.gene(D1)
