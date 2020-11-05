
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sigatlas

<!-- badges: start -->

<!-- badges: end -->

sigatlas package can be used to deconvolute the cell composition from
any specified tissue using its RNA-seq data. It can be helpful to
analyse the cell composition of samples related to healthy or any
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
library(sigatlas)
exp.matrix=read.csv("exp_data.csv", header = T, row.names = 1)
liver.enriched.cell=sigatlas(exp.matrix, tissue = "liver")
```

This function performed the cell enrichemnt of any specified tissue.

## Data input

The expression data should contains the normalized expression values
with gene in rows and samples in columns. The rownames should be gene
Symbols. livercells package uses the normalized expression value (TPM
value). The gene signatures are provided in the package, but if anyone
wants to use their own signature they can do that. if anyone have
control and disease dataset, they can combined all the samples in one
matrix and use it.

## Contributors

sigatlas is developed by BinChen lab. Any questions or feedback can be
addressed to Rama Shankar, PhD, <ramashan@msu.edu> or Bin Chen, PhD, PI,
<bin.chen@hc.msu.edu>
