
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sigatlas

<!-- badges: start -->
<!-- badges: end -->

The sigatlas package was developed to deconvolute cell composition of bulk RNA-seq samples 
based on reference normal cell types, which were derived from tissue specific single cell RNA-seq. It can be applied to
analyze cell composition of samples from healthy and 
diseased tissues. The method is essentially based on the single sample gene set enrichment analysis (ssGSEA). Because ssGSEA scores are based on a non-parametric test and normalized across samples, they do not have a specific meaning; however, our simulation study confirmed its ability to differentiate cell type abundance across samples. Users need to provide the expression matrix and the tissue type and can optionally provide their customized gene markers of cells to deconvolute bulk expression profiles. While several deconvolution tools could be used, the package sigatlas leverages the emerging reference cell types resulted from cell atlas initiatives and companion efforts and will continue to add more manually curated tissue-specific markers. It is suitable to compare cell type enrichment across samples, yet it does not intend to estimate the absolute abundance of cell types when input samples are mixed with uncharacterized cell types.

### Installation
The development version from [Bin-Chen-lab
repository](https://github.com/Bin-Chen-Lab/sigatlas) with:

``` r
# install.packages("devtools")
devtools::install_github("Bin-Chen-Lab/sigatlas")
```
The installation time as well as example run time is less than five minutes

### Usage

This is a basic example showing you how to perform deconvolution for the tissues with known origin:

``` r
## basic example code
library(sigatlas)
#For Human samples
sigatlas(expr=Human_expdata, tissue="Liver", organism="Human")

#For Mouse samples
sigatlas(expr=Mouse_expdata, tissue="Liver", organism="Mouse")

#For Other samples
sigatlas(expr=other_expdata, cellmarker=geneSet, organism="Other")
```

This function performs cell enrichemnt based on a user-defined cell marker genes.

### Data input

The expression data should contain the normalized expression values with gene symbols in rows and samples in columns. sigatlas package uses the normalized expression value (TPM or FPKM value). The gene signatures for human and mouse tissues are provided in the package, but users can input gene signatures of the cells of their interest. The signatures comprise a list of genes. Currently, gene signatures of 16 healthy human organ tissues and 23 mouse tissues namely, "Adipose", "Adrenal_gland", "Bladder", "Blood", "Bone_marrow", "Brain", "Breast", "Eye", "Gut", "Heart", "Intestine", "Kidney", "Liver", "Lung", "Muscle", "Omentum", "Ovary", "Pancreas", "Placenta", "Pleura", "Prostate", "Retina", "Skin", "Spleen", "Stomach", "Testis", "Thymus", and "Uterus" are available. If users want to use their own signatures, they will need to create a list with cell names along with their markers and specify "Other" in the "organism". If users plan to compare the enrichment between two groups, it is recommended to combine samples into a single matrix.

### Contributors

sigatlas is developed and maintained by the Chen lab (http://binchenlab.org/). Any questions or feedback should be
addressed to Rama Shankar, PhD, <ramashan@msu.edu> or Bin Chen, PhD, PI,
<Chenbi12@msu.edu>.
