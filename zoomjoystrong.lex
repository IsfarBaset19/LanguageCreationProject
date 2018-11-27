%{
    #include <stdio.h>
%}
 
 %%

 // This statement exits the interpreter.
 [E][N][D]                       { printf("Exit Interpreter\n"); }
 
 // All commands should end with a semicolon.
 [;$]                            { printf("End of Statement\n"); }
 
 // When we match the command to plot a point.
 [P][O][I][N][T]                 { printf("Plot a point\n"); }
 
 // When we match the command to draw a line.
 [L][I][N][E]                    { printf("Draw a line\n"); }
 
 // When we match the command to draw a circle.
 [C][I][R][C][L][E]              { printf("Draw a circle\n"); }
 
 // When we match the command to draw a rectangle.
 [R][E][C][T][A][N][G][L][E]     { printf("Draw a rectangle\n"); }
 
 // Matches the command to change colors.
 [D][I][F][F][C][O][L][O][R]     { printf("Change color\n"); }
 
 // Matches an integer value.
 [0-9]+                          { printf("Integer value\n"); }
 
 // Matches a floating-point value.
 [0-9]+\.[0-9]+                  { printf("Float value\n"); }
 
 // A way to match tabs, spaces, or newlines, and to ignore them.
 \t|\n|\s                        ; // Ignore these               
 
 // A way to match anything not listed above, and to tell the user they messed up, and on which line.
 .+                              { printf("Error. Invalid input\n"); }
                                  
 %%


 int main(int argc, char** argv){
  
  // Lexing occurs here 
  yylex();    
  
  return 0;
}

