# Representing Code 

The last chapter we took raw source code as a string and made it into a higer level of representation as a series of token. 

Now we need to write a parsar takes those tokens and transforms them to a more complex representation.

When we evalute 

1+2 /cdot 3 - 4 

We think of PEMDAS, So let's talk about Context Free Grammars 

So using thing we learned in the last chapter, we formed characters by grouped into tokens, called regular language. This was acceptable for our scanner which emits a flat sequenece of tokens. Unfortuatnly, regular languages aren't powerful enough to handle expressions. 

So this comes to the introduction of context free grammers (CFGs)  
