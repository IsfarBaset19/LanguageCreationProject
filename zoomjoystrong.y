%{
  #include <stdio.h>
  #include <stdlib.h>
  #include "zoomjoystrong.h"
  void yyerror(const char *s);
%}


%union {

 int iVal;
}

// Now, we provide the type information
// for our tokens (tokens are defined in)
// our Flex file.  We want the value to be
// stored from Flex in the proper data
// structure.

%token END
%token EOS    //End of Statement with a Semicolon 
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE 
%token SET_COLOR
%token <iVal> INT

%%

program: statement_list;
statement_list: statement statement_list
              | statement
              ;

statement:  END EOS {finish();}
          | POINT INT INT EOS {point($2,$3);}
          | LINE INT INT INT INT EOS {line($2,$3,$4,$5);}
          | CIRCLE INT INT INT EOS {line($2,$3,$4);}
          | RECTANGLE INT INT INT INT EOS {rectangle($2,$3,$4,$5);}
          | SET_COLOR INT INT INT EOS {set_color($2,$3,$4);}
          ;

%%

int main(int argc, char** argv){

setup();

yyparse();

return 0;

}

void yyerror (const char *s){

fprintf (stderr, "%s\n", s);

}
