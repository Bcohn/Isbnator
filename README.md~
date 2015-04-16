# Isbnator
Making and faking ISBNs

### Overview

This repository contains code to do three things:

1. Generate valid ISBNs

2. Check if ISBNs are valid, and if so convert them into a standard format. 

3. Use the Google Books API to check if a randomly generated (valid) ISBN exists, and, if so, download its meta-data.

This, somewhat useless, project was inspired by the [Reddit Daily Programmer Challenge](http://www.reddit.com/r/dailyprogrammer/comments/2s7ezp/20150112_challenge_197_easy_isbn_validator/).

### Functions

The two .R files in this repo contain the following functions:
1. Clean_ISBN -- takes an unclean ISBN (maybe it has eaten pork?) and converts it into a format that is readable by the Check_ISBN function. If the ISBN contains too many/few digits, the funciton returns an informative error. Returns a Cleaned ISBN.

2. Check_ISBN -- checks an ISBN for compliance with the ISBN generating algorithm (calls clean ISBN). Returns a cleaned ISBN or an error.

3. Create_ISBN -- creates a random (algorithmically valid) ISBN. Calls Check_ISBN. Returns an ISBN.

4. Find_Books -- accepts an integer parameter, number of ISBNS, and randomly generates that amount of ISBNS, checks the Google Books API for their information, and returns this in a list. If the ISBN is not in use returns "ISBN not in use". 

### Disclaimer

The Google Books API key is a public one, but limited to one call per second and 1,000 requests per day. :( Sorry. 