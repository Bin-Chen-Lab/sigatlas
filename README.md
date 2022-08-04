
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sigatlas

<!-- badges: start -->
<!-- badges: end -->

sigatlas package can be used to deconvolute the cell composition from
any specified tissue using its RNA-seq data. It can be helpful to
analyse the cell composition of samples related to healthy and any
diseases stage.

## Installation

And the development version from [Bin-Chen-lab
repository](https://github.com/Bin-Chen-Lab/sigatlas) with:

``` r
# install.packages("devtools")
devtools::install_github("Bin-Chen-Lab/sigatlas")
```

## Usage

This is a basic example which shows you how to solve a common problem:

``` r
## basic example code
library(sigatlas)
For Human samples
sigatlas(expr=Human_expdata, tissue="Liver", organism="Human")

For Mouse samples
sigatlas(expr=Mouse_expdata, tissue="Liver", organism="Mouse")

For Other samples
sigatlas(expr=other_expdata, cellmarker=geneSet, organism="Other")
```

This function performed the cell enrichemnt for the different tissues.

## Data input

The expression data should contains the normalized expression values with gene symbols in rows and samples in columns. sigatlas package uses the normalized expression value (TPM or FPKM value). The gene signatures for Human and mouse tissues are provided in the package, but if anyone wants to use their own gene signature for the cells, they can use their own signature. The signatures should be a list of genes. Currently, gene signature of 16 healthy human organ tissues and 23 mouse tissues namely, "Adipose", "Adrenal_gland", "Bladder", "Blood", "Bone_marrow", "Brain", "Breast", "Eye", "Gut", "Heart", "Intestine", "Kidney", "Liver", "Lung", "Muscle", "Omentum", "Ovary", "Pancreas", "Placenta", "Pleura", "Prostate", "Retina", "Skin", "Spleen", "Stomach", "Testis", "Thymus", and "Uterus" are available. So, users can perform the analysis for these tissues. if anyone wants to use their own signature they can also use this package. They will have to create a list with cell names with their markers. Additionally, they will have to provide “Other” in the 'organism' name. If anyone have control and disease dataset, they can combined all the samples in one matrix and use it.

## Contributors

sigatlas is developed by BinChen lab. Any questions or feedback can be
addressed to Rama Shankar, PhD, <ramashan@msu.edu> or Bin Chen, PhD, PI,
<Chenbi12@msu.edu>
