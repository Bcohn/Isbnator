# # ISBN's (International Standard Book Numbers) are identifiers for books. 
# #Given the correct sequence of digits, one book can be identified out of millions of others thanks to this ISBN. 
# #But when is an ISBN not just a random slurry of digits? That's for you to find out.
# # Rules
# # 
# # Given the following constraints of the ISBN number, you should write a 
# function that can return True if a number is a valid ISBN and False otherwise.
# # An ISBN is a ten digit code which identifies a book. 
# The first nine digits represent the book and the last digit is used to make sure the ISBN is correct.
# # To verify an ISBN you :-
# #   obtain the sum of 10 times the first digit, 9 times the second digit, 8 times the third digit... 
# all the way till you add 1 times the last digit. If the sum leaves no remainder when divided by 11 the code is a valid ISBN.
# # For example :
# #   0-7475-3269-9 is Valid because
# # (10 * 0) + (9 * 7) + (8 * 4) + (7 * 7) + (6 * 5) + (5 * 3) + (4 * 2) + (3 * 6) + (2 * 9) + (1 * 9) = 242 
# # which can be divided by 11 and have no remainder.
# # For the cases where the last digit has to equal to ten, the last digit is written as X. For example 156881111X.
# # Bonus
# # 
# # Write an ISBN generator. That is, a programme that will output a valid ISBN number (bonus if you output an ISBN that is already in use :P )
Clean_ISBN= function(isbn){
  internal_isbn=isbn
  if(!is.numeric(isbn)){
    internal_isbn=as.character(isbn)
    internal_isbn=gsub("-","",internal_isbn)
    internal_isbn=gsub("[a-z]","",internal_isbn)
    internal_isbn=gsub("[A-Z]","",internal_isbn)
    internal_isbn=gsub("[[:punct:]]", " ",internal_isbn)
  }
  if(nchar(internal_isbn)!=10){
    stop("Invalid ISBN: ISBN must be 10 digits long")
  }
  return(as.character(internal_isbn))
}
Check_ISBN=function(isbn){
  internal_isbn=Clean_ISBN(isbn)
  isbn_vector=unlist(strsplit(internal_isbn,""))
  print(internal_isbn)
  isbn_values=seq(nchar(internal_isbn),1,-1)
  weights=as.numeric(isbn_vector)*as.numeric(isbn_values)
  if(sum(weights)%%11!=0){
    stop("Invalid ISBN")
  }
  print("Valid ISBN")
  return(internal_isbn)
}

## Create a valid ISBN randomly
Create_ISBN=function(){
  num_vect=vector()
  first_num=sample(1:09,1)
  second_num=sample(1:09,1)
  third_num=sample(1:09,1)
  fourth_num=sample(1:09,1)
  fifth_num=sample(1:09,1)
  sixth_num=sample(1:09,1)
  seventh_num=sample(1:09,1)
  eigth_num=sample(1:09,1)
  nineth_num=ifelse((first_num*10+second_num*9+third_num*8+fourth_num*7+
                       fifth_num*6+sixth_num*5+seventh_num*4+eigth_num*3)
                    %%11==0,
                    0,sample(0:9,1))
  if(((first_num*10+second_num*9+third_num*8+fourth_num*7+
      fifth_num*6+sixth_num*5+seventh_num*4+eigth_num*3+nineth_num*2)%%11)==10){nineth_num=nineth_num-1}
  ISBN_sum=((first_num*10+second_num*9+third_num*8+fourth_num*7+
               fifth_num*6+sixth_num*5+seventh_num*4+eigth_num*3+nineth_num*2)%%11)
  tenth_num=ifelse((ISBN_sum+ISBN_sum%%11)%%11==0,ISBN_sum+ISBN_sum%%11,11-ISBN_sum%%11)
  ISBN=as.character(c(first_num,second_num,third_num,fourth_num,fifth_num,sixth_num,
                      seventh_num,eigth_num,nineth_num,tenth_num))
  ISBN=paste(ISBN, sep="", collapse="") 
  return(ISBN)
}

