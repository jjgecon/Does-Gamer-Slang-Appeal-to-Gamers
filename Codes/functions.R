# functions

finder = function(word, d_term_dfm_matrix){
  b = subset(as.data.frame(t(d_term_dfm_matrix)), names(d_term_dfm_matrix[1,]) == word)
  if (is.na(b[1,1])){
    stop("No match was found")
  }
  a = 0
  for(i in 1:(nrow(d_term_dfm_matrix)-1)) {
    if (b[1,i] == 1) {
      if (a == 0){
        indexforword = c(names(b[i]))
        a = 1
        c = 1
      }
      else{
        indexforword = c(indexforword,names(b[i]))
      }
    }
  }
  return(indexforword)
}

TF = function(row){
  row / sum(row)
}

IDF = function(column){
  corpus_size = length(column)
  doc_count = length(which(column > 0))
  log10(corpus_size / doc_count)
}

TF_IDF <- function(tf,idf){
  tf * idf
}
