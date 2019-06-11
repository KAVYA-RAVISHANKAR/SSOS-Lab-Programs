%{
#include<stdio.h>
int ml = 0, sl = 0;
%}
%%
"/*"[a-zA-Z0-9\t\n' ']+"*/" {ml++;}
"//".* {sl++;}
%%
void main()
{
yyin = fopen("input.c","r");
yyout = fopen("output.c","w");
yylex();
printf("Multi-line comments: %d\n",ml);
printf("Single-line comments: %d\n",sl);
fclose(yyin);
fclose(yyout);
}
int yywrap(void) {}
