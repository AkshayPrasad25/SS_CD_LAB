%{
#include <stdio.h>
#include<stdlib.h>
%}
%token A B 
%%
str:s {}
s:A X B|B 
X:;|A X
;
%%
int main(){
printf("Enter");
yyparse();
printf("Valid");
return 0;
}
yyerror(){
printf("Invalid");
exit(0);
}