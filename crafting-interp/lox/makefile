JFLAGS = -g 
JCC = javac

default: Lox.class Scanner.class Token.class TokenType.class

Lox.class: Lox.java
	$(JCC) $(JFLAGS) Lox.java
	$(JCC) $(JFLAGS) Scanner.java
	$(JCC) $(JFLAGS) Token.java
	$(JCC) $(JFLAGS) TokenType.java

clean:
	$(RM) *.class
