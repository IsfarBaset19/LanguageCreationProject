%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "zoomjoystrong.tab.h"
%}
 
%option yylineno


%%

 // This statement exits the interpreter.
 [E-e][N-n][D-d]                                   { return END; }
 
 // All commands should end with a semicolon.
 ;                                                 { return END_STMT; }
 
 // When we match the command to plot a point.
 [P-p][O-o][I-i][N-n][T-t]                         { return POINT; }
 
 // When we match the command to draw a line.
 [L-l][I-i][N-n][E-e]                              { return LINE; }
 
 // When we match the command to draw a circle.
 [C-c][I-i][R-r][C-c][L-l][E-e]                    { return CIRCLE; }
 
 // When we match the command to draw a rectangle.
 [R-r][E-e][C-c][T-t][A-a][N-n][G-g][L-l][E-e]     { return RECTANGLE; }
 
 // Matches the command to change colors.
 [S-s][E-e][T-t][C-c][O-o][L-l][O-o][R-r]          { return SET_COLOR; }
 
 // Matches an integer value.
 [0-9]+                                            { yylval=atoi(yytext); return INT; }
  
 // A way to match tabs, spaces, or newlines, and to ignore them.
 [\t|\n|\s]                                        ; // Ignore these               
 
 // A way to match anything not listed above, and to tell the user they messed up, and on which line.
 .+                                                { printf("Error on line %d (%s)\n", yylineno,yytext);}
                                  
%%


