
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
repository](https://github.com/Bin-Chen-Lab/livercells) with:

``` r
# install.packages("devtools")
devtools::install_github("Bin-Chen-Lab/livercells")
```

## Usage

This is a basic example which shows you how to solve a common problem:

``` r
library(sigatlas)
exp.matrix=read.csv("exp_data.csv", header = T, row.names = 1)
liver.enriched.cell=sigatlas(exp.matrix, tissue = "liver")
#> Loading required package: GSVA
#> Warning: package 'GSVA' was built under R version 4.0.2
#> Setting parallel calculations through a MulticoreParam back-end
#> with workers=4 and tasks=100.
#> Estimating ssGSEA scores for 20 gene sets.
#>   |                                                                              |                                                                      |   0%  |                                                                              |===                                                                   |   4%  |                                                                              |=====                                                                 |   8%  |                                                                              |========                                                              |  12%  |                                                                              |===========                                                           |  15%  |                                                                              |=============                                                         |  19%  |                                                                              |================                                                      |  23%  |                                                                              |===================                                                   |  27%  |                                                                              |======================                                                |  31%  |                                                                              |========================                                              |  35%  |                                                                              |===========================                                           |  38%  |                                                                              |==============================                                        |  42%  |                                                                              |================================                                      |  46%  |                                                                              |===================================                                   |  50%  |                                                                              |======================================                                |  54%  |                                                                              |========================================                              |  58%  |                                                                              |===========================================                           |  62%  |                                                                              |==============================================                        |  65%  |                                                                              |================================================                      |  69%  |                                                                              |===================================================                   |  73%  |                                                                              |======================================================                |  77%  |                                                                              |=========================================================             |  81%  |                                                                              |===========================================================           |  85%  |                                                                              |==============================================================        |  88%  |                                                                              |=================================================================     |  92%  |                                                                              |===================================================================   |  96%  |                                                                              |======================================================================| 100%
## basic example code
```

This function performed the cell enrichemnt for the different tissues.

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
