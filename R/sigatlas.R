#'sigatlas is A package for deconvolute the liver RNA-seq data for cell composition
#'
#'This function  provide the cell composition in any liver tissue
#'@param expr is the gene expression data set. A matrix with rownames as gene symbol and colmanes as samples
#'@param cellmarker Gene sets provided either as a list marker genes for each cells or as a GeneSetCollection object.
#'@param genes list of genes to use in the analysis.
#'@param parallel.sz integer for the number of threads to use. Default is 4.
#'@param parallel.type Type of cluster architecture when using snow. 'SOCK' or 'FORK'. Fork is faster, but is not supported in windows.
#'@param tissue Name of tissue should be  "Adipose", "Adrenal_gland", "Bladder", "Blood", "Bone_marrow", "Brain", "Breast", "Eye", "Gut", "Heart", "Intestine", "Kidney", "Liver", "Lung", "Muscle", "Omentum", "Ovary", "Pancreas", "Placenta", "Pleura", "Prostate", "Retina", "Skin", "Spleen", "Stomach", "Testis", "Thymus", and "Uterus"
#'@param organism For human sample provide 'Human', for mouse sample provide 'Mouse' and for other samples provide 'Other'
#'@exampls:
#'For Human samples
#'sigatlas(expr=Human_expdata, tissue="liver", organism="Human")
#'
#'For Mouse samples
#'sigatlas(expr=Mouse_expdata, tissue="liver", organism="Mouse")
#'
#'For Other samples
#'sigatlas(expr=other_expdata, cellmarker=geneSet organism="Other")
#'
#'```
#'@author Rama Shankar
#'@return data frame with enrichment score for each cells in every samples




## Created by Rama from Chen lab @MSU http://binchenlab.org





#'@export
# ##Function to perform the deconvolution for any tissue

sigatlas <- function(expr, cellmarker=NULL, tissue=NULL, organism=NULL, parallel.sz = 4, parallel.type = 'SOCK') {
  if(organism=="Human"){
    print(paste(organism, "organism has been selected", sep=" "))
    tissues= names(human_signature)
    if (tissue %in% tissues){
      print(paste(tissue, "tissue is present in the list", sep = " "))
      ## install the package if not available
      if ("GSVA" %in% rownames(installed.packages())== FALSE){
        BiocManager::install("GSVA")
        library(GSVA)
      }else{
        require("GSVA")
      }
      # If the expression file is provided as the dataframe changed it to the matrix
      # as GSVA work with only matrix
      if(class(expr)[1]=="data.frame"){
        expr=as.matrix(expr)
      }else{
        print("No need to convert the matrix file")
      }
      ### If signature is not provided then signature along with this function will be used

      if (is.null(cellmarker)){
        signatures = human_signature[[tissue]]
      }

      ### Perfom the analysis for the liver deconvolutions
      if(packageVersion("GSVA") >= "1.36.0") {
        # GSVA >= 1.36.0 does not support `parallel.type` any more.
        # Instead it automatically uses the backend registered by BiocParallel.
        scores <- GSVA::gsva(ssgseaParam(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz, min.sz >1))
      } else {
        scores <- GSVA::gsva(ssgseaParam(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz,parallel.type = parallel.type, min.sz >1))
      }
    }else{
      print("tissue name is not correct or present")
      }

  } else if (organism=="Mouse"){
    tissues= names(mouse_signature)
    print(paste(organism, "organism has been selected", sep=" "))

    if (tissue %in% tissues){
      print(paste(tissue, "tissue is present in the list", sep = " "))
       ## install the package if not available
      if ("GSVA" %in% rownames(installed.packages())== FALSE){
        BiocManager::install("GSVA")
        library(GSVA)
      }else{
        require("GSVA")
      }
      # If the expression file is provided as the dataframe changed it to the matrix
      # as GSVA work with only matrix
      if(class(expr)[1]=="data.frame"){
        expr=as.matrix(expr)
      }else{
        print("No need to convert the matrix file")
      }
      ### If signature is not provided then signature along with this function will be used

      if (is.null(cellmarker)){
        signatures = mouse_signature[[tissue]]
      }

      ### Perfom the analysis for the liver deconvolutions
      if(packageVersion("GSVA") >= "1.36.0") {
        # GSVA >= 1.36.0 does not support `parallel.type` any more.
        # Instead it automatically uses the backend registered by BiocParallel.
        scores <- GSVA::gsva(ssgseaParam(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz, min.sz >1))
      } else {
        scores <- GSVA::gsva(ssgseaParam(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz,parallel.type = parallel.type, min.sz >1))
      }
    }else{
      print("tissue name is not correct or present")
    }
  }else{
    if(organism =="Other"){
      print("Other organism has been selected")
      print("User cell signatures has been submitted")
      signatures=cellmarker
      if ("GSVA" %in% rownames(installed.packages())== FALSE){
        BiocManager::install("GSVA")
        library(GSVA)
      }else{
        require("GSVA")
      }
      # If the expression file is provided as the dataframe changed it to the matrix
      # as GSVA work with only matrix
      if(class(expr)[1]=="data.frame"){
        expr=as.matrix(expr)
      }else{
        print("No need to convert the matrix file")
      }
      if(packageVersion("GSVA") >= "1.36.0") {
        # GSVA >= 1.36.0 does not support `parallel.type` any more.
        # Instead it automatically uses the backend registered by BiocParallel.
        scores <- GSVA::gsva(ssgseaParam(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz, min.sz >1))
      } else {
        scores <- GSVA::gsva(ssgseaParam(expr, signatures, method = "ssgsea",
                             ssgsea.norm = T,parallel.sz = parallel.sz,parallel.type = parallel.type, min.sz >1))
      }
    }
  }
  options(warn=-1)
    scores[scores < 0]=0
    scores
}






