# Find and Display a randomly generated ISBN Number.
require(jsonlite)
require(httr)
key='AIzaSyCnGUC9tHEM7JjRKtXT_6J58GIyPew0-kU'


Find_Books= function(number_of_books){
  books=list()
  for(i in 1:number_of_books){
  books[i]=Create_ISBN()
  }
  book_info=list()
  for(i in 1:length(books)){
    url=paste0('https://www.googleapis.com/books/v1/volumes?q=isbn:',books[[i]],'&key=',key)
    req=fromJSON(url)
    book_info[i]=ifelse(req$totalItems==0,"ISBN not in use",req)
  }
  return(book_info)
}