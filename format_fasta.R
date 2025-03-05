## quick little function to convert our sequence table entries into fasta format 

get_fasta_format <- function(seq_tbl_row){
  
  # have to split it up into species X each base pair 
  D <- t(seq_tbl_row)
  D1<-t(as.data.frame(strsplit(D[,1], split = "")))

  return(D1)
}

genome_fasta_format <- function(genome_df){
  
  # slightly different formatting than above
  D <- genome_df
  row.names(D) <- D$Species
  D$Species <- NULL
  D <- as.matrix(D)
  
  # have to split it up into species X each base pair 
  D2<-t(as.data.frame(strsplit(D[,1], split = "")))
  return(D2)
}





