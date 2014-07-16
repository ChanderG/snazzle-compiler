#snazzle-compiler

###What?
My attempt at a compiler using flex/bison.The base-code is taken from [http://aquamentus.com/flex_bison.html](http://aquamentus.com/flex_bison.html).I will work upon it.

The headings below more-or-less coincide with commits. They are sort of extended comments and thoughts as I progress.

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

###Made It!
The snazzle-compiler now has a makefile and takes arguments for compiling.

Now the instructions are:
```
make snazzle
./snazzle <name of snazzle file>
```

####Line Numbers
The compiler now gives line number in case the parsing fails. 
