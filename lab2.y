%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B
%%
input: S'\n'{printf("Valid String\n");exit(0);}
S: R B
R: A R|A
%%
main()
{
printf("Enter String\n");
yyparse();
}
yyerror()
{
printf("Invalid String\n");
exit(0);
}
