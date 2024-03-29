# Integrated_EBV_genomes_NPC_South_China
This repository contains genotype information and codes necessary to generate the results of the 38 SNPs that characterised the high-risk EBV lineage for NPC in South China.

`sample_pos_GT.rds`: contains sample information:
	- `SRRid`: Sample identifier (NCBI SRR ID)
	- `POS`: Genomic position in the EBV genome, according to NC_007605.1
	- `GT`: Genotype
	- `GT_alleles`: Observed allele
	- `Dataset`: Source of EBV genomes; "HK": Hong Kong; "GZ": Guangzhou
	- `Phenotype`: Case/control
	- `Cluster`: Population cluster by rhierbaps

`SNP_profile_for_highrisk_EBV.R`: R script for generating the SNP profile that characterise the high-risk EBV lineage for NPC in South China.

