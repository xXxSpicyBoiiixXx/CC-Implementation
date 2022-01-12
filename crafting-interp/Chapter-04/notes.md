# Scanning 

The first step is a scanner. 

This is common in most interpretators. Now that we have a general understanding of our lanugae lox. Let's look back at our scanner. 

The core of the scanner is a loop. Starting with the first character of the source code, it figures out what the lexemem it belongs to, and consumes it and any following characters that are part of that lexemem. When it reaches the end of that lexeme, it will emit a token. 

There is tools to automatically do this and there is similaries into theory of computation as well as some PL thoery but we won't get into that or use the tools and will handcraft the scanner. 

So now at this point our scanner can handle a few things such as this 
// this is a comment
(()) {} // Grouping things 
// Even all basic operators

At this point we are able to handle like one character at this point for our scanner or things like != where we have to see if the next character is an equal sign. Now we should be able to handle string literals. 

In our Lox langauge we have that all numbers are floating points at runtime but it supports both integeres and decimal literals. So what the fuck is a number literal you might ask? A number literal is a series of digits optionally followed by a decimal point and one more trailing digits: 

1234
12.34 

We won't allow leading or trailing decimal points so theses are both invalid: 

.1234
1234. 

Maximal munch means we can't easily detect a reserved word until we get to the end for example in the Lox language we have that "or" where we can come across something like "orchild" this will obviously casue an error. 

So our goal here is to match "orchild" as an identifier and "or" as a keyword. 

This is where we come to the notion of a reserved word. So a reserved word is an identifer, it's just one that was claimed by the language for it's own use. 
