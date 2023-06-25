%{
#include "y.tab.h"
extern int yylval;
%}
%%
[0-9] {yylval = atoi(yytext); return DIG;}
int|main|printf|float|return|void {printf("this is a key word %s",yytext);return KW;}
[+|-|*|/|%|<|>] {return OP;}
[a-zA-z]+[0-9][a-zA-Z] {return ID;}
. ;
%%