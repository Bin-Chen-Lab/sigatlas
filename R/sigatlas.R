#'sigatlas is A package for deconvolute the liver RNA-seq data for cell composition
#'
#'This function  provide the cell composition in any liver tissue
#'@param expr is the gene expression data set. A matrix with rownames as gene symbol and colmanes as samples
#'@param cellmarker Gene sets provided either as a list marker genes for each cells or as a GeneSetCollection object.
#'@param genes list of genes to use in the analysis.
#'@param parallel.sz integer for the number of threads to use. Default is 4.
#'@param parallel.type Type of cluster architecture when using snow. 'SOCK' or 'FORK'. Fork is faster, but is not supported in windows.
#'@param tissue Name of tissue should be 'liver', 'kidney', 'Bone.marrow', 'breast', 'bladder', 'Ratina', and 'Thymus'
#'@exampls:
#'liver_cells(expr, tissue="liver")
#'```
#'@author Rama Shankar
#'@return dataframe with enrichmnet score for each cells in every samples




## Created by Rama from Chen lab @MSU http://binchenlab.org

##Date Oct 25, 2020
## Code for deconvulation of liver tissue for liver cells published
# "MacParland, S.A., Liu, J.C., Ma, X. et al. Single cell RNA sequencing of human liver reveals distinct intrahepatic
# macrophage populations. Nat Commun 9, 4383 (2018).
# https://doi.org/10.1038/s41467-018-06318-7"



#'@export
# ##Function to perform the liver deconvulation

sigatlas <- function(expr, cellmarker=NULL, tissue=NULL, parallel.sz = 4, parallel.type = 'SOCK') {
  tissues= names(signature)
  if (tissue %in% tissues){
  ## install the package if not available
  if ("GSVA" %in% rownames(installed.packages())== FALSE){
    BiocManager::install("GSVA")
  }else{
    require("GSVA")
  }
  # If the expression file is provided as the dataframe changed it to the matrix
  # as GSVA work with only matrix
  if(class(expr)=="data.frame"){
    expr=as.matrix(expr)
  }else{
    print("No need to convert the matrix file")
  }
  ### If signature is not provided then signature along with this function will be used

    if (is.null(cellmarker)){
      signatures = signature[[tissue]]
    }

    ### Perfom the analysis for the liver deconvulations
    if(packageVersion("GSVA") >= "1.36.0") {
      # GSVA >= 1.36.0 does not support `parallel.type` any more.
      # Instead it automatically uses the backend registered by BiocParallel.
      scores <- GSVA::gsva(expr, signatures, method = "ssgsea",
                           ssgsea.norm = T,parallel.sz = parallel.sz)
    } else {
      scores <- GSVA::gsva(expr, signatures, method = "ssgsea",
                           ssgsea.norm = T,parallel.sz = parallel.sz,parallel.type = parallel.type)
    }
    }else if (tissue=="other"){
      signatures=cellmarker
      if ("GSVA" %in% rownames(installed.packages())== FALSE){
        BiocManager::install("GSVA")
      }else{
        require("GSVA")
      }
      # If the expression file is provided as the dataframe changed it to the matrix
      # as GSVA work with only matrix
      if(class(expr)=="data.frame"){
        expr=as.matrix(expr)
      }else{
        print("No need to convert the matrix file")
      }
      if(packageVersion("GSVA") >= "1.36.0") {
        # GSVA >= 1.36.0 does not support `parallel.type` any more.
        # Instead it automatically uses the backend registered by BiocParallel.
        scores <- GSVA::gsva(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz)
      } else {
        scores <- GSVA::gsva(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz,parallel.type = parallel.type)
    }
    }else{
    print("tissue name is not correct")
    }
}



