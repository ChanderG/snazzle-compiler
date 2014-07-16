#snazzle-compiler

###Lexer
Flex generates the lexer for you.You just have to specify the tokens.The first command does just that.The second command links flex and compiles the lexer.

```
flex snazzle.l
g++ lex.yy.c -lfl -o snazzle
```
To run the lexer, 

```
./snazzle
```

This will recogonize the tokens you have specified.
