package com.craftinginterpreters.lox; 

import java.io.BufferedReader; 
import java.io.IOException; 
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.nio.file.Files; 
import java.nio.file.Paths;
import java.util.List; 

public class Lox {
    static boolean hadError = false; 
    public static void main(String[] args) throws IOException { 
        if(args.length > 1) { 
            System.out.println("Useage: jlox [script]"); 
            System.exit(64); 
        } else if(args.length == 1) { 
            runFile(args[0]); 
        } else {
            runPrompt();  
        }
    }
}

private static void runFile(string path) throws IOException { 
    byte[] bytes = Files.readAllBytes(Paths.get(path));
    run(new String(bytes, Charset.defaultCharset()));
    if(hadError) System.exit(65); 
}

private static void runPrompt() throws IOException { 
    InputStreamReader input = new InputStreamReader(System.in);
    BufferedReader reader = new BufferedReader(input); 

    for(;;) { 
        System.out.print("> "); 
        String line = reader.readLine(); 
        if(line == null) { 
            break; 
        }
        run(line);
        hasError = false; 
    }
}

// This is not super useful yet since it only prints out tokens what our scanner would emit. 
private static void run(String source) { 
    Scanner scanner = new Scanner(source); 
    List<Token> tokens = scanner.scanTokens(); 

    // For now, just print the tokens. 
    for(Token token : tokens) { 
       System.out.println(token); 
    }
}

// Error handling is more of a practical thing instead of a computer science problem. 
// This gives the user all the information they need to understand
// We're sticking to line numbers as finding exactly where the error is isn't technically 
// difficult but just tedious.
static void error(int line, String message) { 
    report(line, "", message); 
}

private static void report(int line, String where, String message) { 
    System.err.println( "[line " + line + "] Error" + where + ": " + message); 
    hadError = true; 
}




