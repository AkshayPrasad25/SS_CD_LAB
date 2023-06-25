%{
#include <stdio.h>
int d=0,o=0,i=0,k=0;
extern FILE* yyin;
%}
%token DIG OP ID KW
%token .
%%
inp: DIG inp {d++;}
|OP inp {o++;}
|KW inp {k++;}
|ID inp {i++;}
|DIG {d++;}
|OP {o++;}
|ID {i++;}
|KW {k++;}
. ;
%%
int main(){
FILE *myfile = fopen("test.c","r");
if(!myfile){
printf("Cant open");
return 0;
}
yyin = myfile;
do{
yyparse();
}while(!feof(yyin));
printf("d=%d i=%d o=%d k=%d\n",d,i,o,k);
}
void yyerror(){
printf("invalid");
}