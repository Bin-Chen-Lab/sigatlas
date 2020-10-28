
<!-- README.md is generated from README.Rmd. Please edit that file -->

# livercells

<!-- badges: start -->

<!-- badges: end -->

livercells package can be used to deconvolute the cell composition from
any liver tissue using its RNA-seq data. It can be helpful for to
analyse the cell composition for samples related to various liver
diseases and cancer.

## Installation

You can install the livercells from [Bin-Chen-lab
repository](https://github.com/Bin-Chen-Lab/livercells) with:

``` r
devtools::install('Bin-Chen-Lab/livercells')
```

## Usage

``` r
library(livercells)
exp.matrix=read.csv("../../exp_data.csv", header = T, row.names = 1)
livercells(exp.matrix)
#> Loading required package: GSVA
#> Warning: package 'GSVA' was built under R version 4.0.2
#> Setting parallel calculations through a MulticoreParam back-end
#> with workers=4 and tasks=100.
#> Estimating ssGSEA scores for 22 gene sets.
#>   |                                                                              |                                                                      |   0%  |                                                                              |===                                                                   |   4%  |                                                                              |=====                                                                 |   8%  |                                                                              |========                                                              |  12%  |                                                                              |===========                                                           |  15%  |                                                                              |=============                                                         |  19%  |                                                                              |================                                                      |  23%  |                                                                              |===================                                                   |  27%  |                                                                              |======================                                                |  31%  |                                                                              |========================                                              |  35%  |                                                                              |===========================                                           |  38%  |                                                                              |==============================                                        |  42%  |                                                                              |================================                                      |  46%  |                                                                              |===================================                                   |  50%  |                                                                              |======================================                                |  54%  |                                                                              |========================================                              |  58%  |                                                                              |===========================================                           |  62%  |                                                                              |==============================================                        |  65%  |                                                                              |================================================                      |  69%  |                                                                              |===================================================                   |  73%  |                                                                              |======================================================                |  77%  |                                                                              |=========================================================             |  81%  |                                                                              |===========================================================           |  85%  |                                                                              |==============================================================        |  88%  |                                                                              |=================================================================     |  92%  |                                                                              |===================================================================   |  96%  |                                                                              |======================================================================| 100%
```

This function performed the cell enrichemnt for the liver tissue.

## Data input

The expression data should contains the normalized expression values
with gene in rows and samples in columns. The rownames should be gene
Symbols. livercells package uses the normalized expression value (TPM
value). The gene signatures are provided in the package, but if anyone
wants to use their own signature they can do that. if anyone have
control and disease dataset, they can combined all the samples in one
matrix and use it.

## Contributors

livercells is developed by BinChen lab. Any questions or feedback can be
addressed to Rama Shankar, PhD, <ramashan@msu.edu> or Bin Chen, PhD, PI,
<bin.chen@hc.msu.edu>
