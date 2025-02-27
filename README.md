Instructions: 

Prior to event, generate the sequence table by running: `./sequence_table.R`

The function is configured to take the following parameters. You can modify these/add more animals as desired: 

```{r}
species <- c('human', 'monkey', 'mouse', 'lizard', 'tuna')
similarity <- c(1, 0.9, 0.8, 0.7, 0.5)

gene_length <- 16
nucleotides <- c('A', 'T', 'C', 'G')


temp <- generate_sequence_table(species, similarity, gene_length = 16, nucleotides, num_genes = 5)

write_tsv(temp, 'sample_sequence_table.tsv')
```
