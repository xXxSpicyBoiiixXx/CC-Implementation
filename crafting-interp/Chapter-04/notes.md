# Scanning 

The first step is a scanner. 

This is common in most interpretators. Now that we have a general understanding of our lanugae lox. Let's look back at our scanner. 

The core of the scanner is a loop. Starting with the first character of the source code, it figures out what the lexemem it belongs to, and consumes it and any following characters that are part of that lexemem. When it reaches the end of that lexeme, it will emit a token. 

There is tools to automatically do this and there is similaries into theory of computation as well as some PL thoery but we won't get into that or use the tools and will handcraft the scanner. 

Start at page 48
