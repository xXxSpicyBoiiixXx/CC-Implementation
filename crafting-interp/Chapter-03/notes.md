# The Lox Language 

Lox's syntax is a member of the  C family. Lox doesn't do static types but it is dynamically typed .

So what is dynamically typed language? 
Variable can store values of any type, and a single variable can even store values of different types at different times. 
If you try to perform an operation on values of the wrong type - e,g. dividing a number by a string then an error is detected and reported at runtime. 

Lox also offers an automatic memory managemnet.... there is two managing memory: reference counting and garbage collection. 

So in terms of reference counting do some tracing to handle ctcles and the write barriers of a generational collector look a bit like retain calls if you squint. 

But in terms of garbage collection, most things do this and what we're going to be implementing.  

### Hello, Lox

print "Hello, world!"; 

# Data Types

* Booleans - True/False 

true; // not false 
fasle; // not *not* false 

* Numbers - One kind, just double-precision floating point

1234; // An integer 
12.34; // A decimal number 

* Strings - Enclosed in double quotes

"I am a string"; 
""; // The empty string 
"123"; // This is a string, not a number 

* Nil - Basically, a no value equivalent to C's and Java's null operand. 

# Expressions 

* Arithmetic - Basic operations 

add + me; 
subtract - me; 
multiply * me; 
divide / me; 

* Comparison and Equality 

less < than; 
lessThan <= orEqual; 
greater > than; 
greaterThan >= orEqual; 

1 == 2; // false 
"cat" != "dog" // true 

Even different types: 314 == "pi" // false 

Values of different types are never equivalent: 

123 == "123"; // false 

# Logical Operators 

!true; // false 
!false; // true 

We won't be using || && and just use and and or for our logical operators.

true and false; // false 
true and true;  // true 
false or false; // false 
true or false;  // true 

# Statements

print "Hello, world"; 

"some expression"; 

We can pack a series of statements where a single one is expected, you can wrap them up in a block: 

{ 
    print "One statement."; 
    print "Two statements."; 
}

# Variables 

var imAVarible = "here is my value"; 
var iAmNil; 

var breakfast = "bagels"; 
print breakfast; // "bagels"
breakfast = "beignents"; 
print breakfast; // "beignets"

# Control Flow 

We have three here which are if statements, while loops, and for loops. 

if(condition) { 
    print "yes"; 
} else { 
    print "no"; 
}

var a = 1; 
while(a < 10) { 
    print a; 
    a = a + 1; 
}    

for(var a = 1; a < 10; a = a + 1) { 
    print a; 
}

# Functions 

function calls look like C so, 

makeBreakfast(bacon, eggs, toast); 
makeBreakfast(): 

We can also define our own languages, 

fun printSum(a, b) { 
    print a + b; 
}

fun returnSum(a, b) { 
    return a + b; 
}

# Closures 

fun addPair(a, b) { 
    return a + b; 
}

fun identity(addPair)(1, 2); // prints 3

You can also nest function together with outer and inner loops. 






