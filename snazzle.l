/*CG: control section*/
%{ /*CG: insert directly into generated code */
#include <cstdio>
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()

#include "snazzle.tab.h"  // to get the token types that we return
int line_no = 1;
%}

/*
General Notes:
. represents everything; in our case we are escaping it
*/

%%
[ \t]           ; //ignoring space - in all forms
sNaZZle         { return SNAZZLE;}
type            { return TYPE;}
end             { return END;} 
[0-9]+\.[0-9]+  { yylval.fval = atof(yytext); return FLOAT;}
[0-9]+          { yylval.ival = atoi(yytext); return INT;}
[a-zA-Z0-9]+    { yylval.sval = strdup(yytext); return STRING;}
\n              { line_no++; }
%%
//CG: directly copied into generated code

//this main will have to go: now that we are using bison as well

/*
main() {

  //to make lexer read from a file
  // open a file handle to a particular file:
	FILE *myfile = fopen("a.snazzle.file", "r");
	// make sure it's valid:
	if (!myfile) {
		cout << "I can't open a.snazzle.file!" << endl;
		return -1;
	}
	// set lex to read from it instead of defaulting to STDIN:
	yyin = myfile;

	//CG: lex through the input:
	yylex();
}
*/
