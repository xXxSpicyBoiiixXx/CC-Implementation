# Mapping the Territory

The first step is scanning (lexing) or lexical analysis. 

A scanner or lexer take in the linear stream of character and chunks them together into a series of something more akin to words. 

In programming langugages, each of these words is called a token. 

A parser takes the flat sequence of tokens and builds a tree structure that mirrors the nested nature of the grammar. 

The parsar's job essentially let's us know about syntax errors. 

The language we'll build in this books is dynamically typeds, so it will do its type checking later, at runtime. 

A compiler is like a pipeline, where each stage's job is to organize the data representing the user's code in a way that makes the next stage simpler to implement. 

So the difference between front end and back end is that the front end of the pipeline is specific to the source language the program is written in while the back end is the final architecture where the program will run. 

The code will stored in some intermediate representation (IR). This is acting like a interface between these two languages. 

Generating code (code gen) is where we are refering to the kind of primitive assembly-like instructions a CPU runs and not source doe that we usually see. 

### Code Generation

In the back end, the code becomes more primitive, like closer to what a machine can understand. 

Instead of instructions for some real chip, they producedcode for a hypothetical, idealized machine. This is called p-code for portable but it's call it's bytecode because each instruction is often a single byte long.

You could write little mini compiler for each target architecture that converts the bytecode to native code for that machine. Or you can make a virtual machine (VM), a program that emulates a hypothetical chip supporting the virtual architecutre at runtime. 

### Virtual Macchine

Generally, running bytecode in a VM is slower than translating it to native code ahead of time beacuse every instruction must be simulated at runtime each time it executes. 

Here we get simplicity and portability over the performance hit. 

### Runtime 

If we compile things to machine code, we just tell the OS to laod the executable and there is goes. 

If we compiled it into byte code, we start up the VM and laod the program into that 

* All thgis is going into runtime. 

# Shortcuts and Alternate Routes 

The previous part was the long way and there is languages that do that but there are alternate paths... 

### Single-pass compilers 

Single-pass compilers put parsing, analysis, and code gen, in one go so the output code is directly in the parsar. THere is no intermediate data structures to store gloval infromations about the program, and you don't revist any previouslt parsed part of the code. 

### Tree-walk interpreters



