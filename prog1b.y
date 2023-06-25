%{
#include<stdio.h>
%}
%token NUM     
%left '+' '-'
%left '*' '/'
%left '(' ')'
%token .

%%
expr: e {printf("\n Result:%d\n",$$);return 0;}
|e:e'+'e  {$$=$1+$3;}
|e'-'e   {$$=$1-$3;}
|e'*'e   {$$=$1*$3;}
|e'/'e   {$$=$1/$3;}
|'('e')' {$$=$2;}
|NUM     {$$=$1;}  
|.
;
%%
main()
{
printf("enter the arithmetic expression \n");
yyparse();
printf("\n valid expression \n");
}
yyerror()
{
printf("\n Invalid expression \n");
exit(0);
}
