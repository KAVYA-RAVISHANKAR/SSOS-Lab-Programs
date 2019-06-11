%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
start: exp{ printf("%d\n",$$);} |
		exp : exp'+'exp{$$ = $1 + $3;} |
			  exp'-'exp{$$ = $1 - $3;} |
			  exp'*'exp{$$ = $1 * $3;} |
			  exp'/'exp{
		   	  	if($3 == 0)
					{yyerror("Error\n"); exit(0);}
				else 
					$$ = $1/$3;} |
			  '('exp')' {$$ = $2;} |
			  NUM {$$ = $1;}
%%
yywrap() {}
main()
{
printf("Enter expression.\n");
yyparse();
}
yyerror(){printf("Error\n");};


