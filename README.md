#snazzle-compiler

###Lexer first.
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

Now, the lexer automatically takes in the file to be "lexed".

###Bison Incorporated.
Bison gives meaning to the tokens. We also specify the grammar now.

First change is to move the main to the Bison file snazzle.y.Next the bison file is included in the compilation process.

To run the setup now:
```
bison -d snazzle.y
flex snazzle.l
g++ snazzle.tab.c lex.yy.c -lfl -o snazzle
./snazzle
```

###A better grammar.
The grammar has been improved to atleast look like the specs.Now to run, a run.sh script has been included.

Now:
```
./run.sh
```

runs the lexer-parser, or the compiler on the input in.snazzle
