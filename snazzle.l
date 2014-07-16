/*CG: control section*/
%{ /*CG: insert directly into generated code */
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
%}

/*
General Notes:
. represents everything; in our case we are escaping it
*/

%%
[ \t\n]         ; //ignoring space - in all forms
[0-9]+\.[0-9]+  { cout << "Found a floating-point number:" << yytext << endl; }
[0-9]+          { cout << "Found an integer:" << yytext << endl; }
[a-zA-Z0-9]+    { cout << "Found a string: " << yytext << endl; }
%%
//CG: directly copied into generated code
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
