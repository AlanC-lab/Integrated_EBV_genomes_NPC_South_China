library(tidyverse)

sample_pos_GT <- readRDS("sample_pos_GT.rds")

GT_38SNPs <- sample_pos_GT |> 
  filter(grepl("[ATCG.]", GT_alleles)) |> 
  summarize(sumGT = n(), .by = c(POS, GT_alleles, Cluster)) |> 
  slice_max(sumGT, by = c(POS, Cluster)) |> 
  summarize(GT_alleles = paste0(sort(GT_alleles), collapse = ""),
            sumGT = unique(sum(sumGT)), 
            Group = ifelse(Cluster %in% c(2, 3, 7), "High", "Low"), 
            .by = c(POS, Cluster)) |> 
  select(POS, GT_alleles, Group) |> 
  summarize(GT_alleles = paste0(unique(sort(GT_alleles)), collapse = ""), 
            .by = c(POS, Group)) |> 
  distinct_all() |> 
  pivot_wider(names_from = Group, values_from = GT_alleles, 
              values_fn = \(x) paste0(sort(unique(x)), collapse = "")) |> 
  filter(nchar(High) == 1 & str_detect(Low, fixed(High), negate = T))