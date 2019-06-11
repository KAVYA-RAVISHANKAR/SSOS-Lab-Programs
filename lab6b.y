%{
#include<stdio.h>
#include<stdlib.h>
int id = 0, key = 0, digit = 0, op = 0;
%}
%token KEY ID OP DIGIT
%%
input : 
	DIGIT input {digit++;}
|   ID input {id++;}
|	KEY input{key++;}
|	OP input{op++;}
|	ID {id++;}
|	KEY{key++;}
|	OP {op++;}
|	DIGIT {digit++;}
;

%%
extern int yylex();
extern int yyparse();
extern FILE *yyin;
main()
{
FILE *f = fopen("abc.c","r");
if(!f)
{
printf("File doesn't exist");
return -1;
}
else
yyin = f;
do 
{
yyparse();
}
while(!feof(yyin));
printf("Numbers: %d\nKeywords:%d\nIdentifiers:%d\nOperators:%d\n",digit,key,id,op);
}
void yyerror()
{
printf("Parse error.");
exit(-1);
}
