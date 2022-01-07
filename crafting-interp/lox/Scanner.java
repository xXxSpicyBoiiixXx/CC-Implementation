package com.craftinginterpreters.lox;

import java.util.ArrayList;
import java.util.HashMap; 
import java.util.List; 
import java.util.Map; 

import static com.craftinginterpreters.lox.TokenType.*; 

class Scanner { 
	private final String source; 
	private final List<Token> tokens = new ArrayList<>(); 
	private int start = 0; 
	private int current = 0; 
	private int line = 1; 

	Scanner(String source) { 
		this.source = source;
	}

	List<Token> scanTokens() { 
		while(!isAtEnd()) { 
			// Beginning of the next lexeme
			start = current; 
			scanToken(); 
		}
		
		tokens.add(new Token(EOF, "", null, line)); 
	}
	
	// This is the real heart of the scanner.
	private void scanToken() { 
		char c = advance(); 
		
		switch(c) { 
			case '(': addToken(LEFT_PAREN); 
				  break; 
			case ')': addToken(RIGHT_PAREN); 
				  break;
			case '{': addToken(LEFT_BRACE); 
				  break; 
			case '}': addToken(RIGHT_BRACE); 
				  break;
			case ',': addToken(COMMA);
				  break; 
			case '.': addToken(DOT); 
				  break;
			case '-': addToken(MINUS); 
				  break;
			case '+': addToken(PLUS);
				  break;
			case ';': addToken(SEMICOLON); 
				  break;
			case '*': addToken(STAR); 
				  break;
			case '!': addToken(match('=') ? BANG_EQUAL : BANG);
				  break;
			case '=': addToken(match('=') ? EQUAL_EQUAL : EQUAL);
				  break; 
			case '<': addToken(match('=') ? LESS_EQUAL : LESS);
				  break; 
			case '>': addToken(match('=') ? GREATER_EQUAL : GREATER); 
				  break;
			case '/': 
				  if(match('/')) { 
				  	while(peek() != '\n' && !isAtEnd()) advance();
				  } else { 
					  addToken(SLASH); 
				  }
				  break; 

			default: 
				Lox.error(line, "Unexpected character.");
				  break; 
		}
	}

	private boolean match(char expected) { 
		
		if(isAtEnd()) {
			return false; 
		}
		
		if(source.charAt(current) != expected) { 
			return false; 
		}

		current++; 

		return true; 
	}

	private char peek() { 
		if(isAtEnd()) { 
			return '\0'; 
		}

		return source.charAt(current); 
	}

	// Helper fucntions that helps us if we've consumed all the char
	private boolean isAtEnd() { 
		return current >= source.length(); 
	}
	
	// Consumes the next character in the source file and returns it
	private char advance() { 
		current++; 
		return source.charAt(current - 1); 
	}

	// So the addToken function is for output of the advance(). 
	// It grabs the text of the current lexeme and creates a new 
	// token. The other addToken is to handle literal values 
	// which are covered later. 
	private void addToken(TokenType type) { 
		addToken(type, null);
	}
	
	private void addToken(TokenType type, Object literal) { 
		String text = source.substring(start, current); 
		tokens.add(new Token(type, text, literal, line));
	}

/*
 * At this point the scanner goes through the source code and 
 * makes it's way though until it runs out of characters which 
 * it then appends one file EOF token. 
 */

}

