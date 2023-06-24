%{
#include<stdio.h>
int b=0,o=0,a=0,s=0,m=0,d=0;
%}

%%
[(] {b++;}
[+][(] {b++; a++;}
[-][(] {b++; s++;}
[*][+][(] {b++; a++; m++;}
[/][+][(] {b++; a++; d++;}
[*][-][(] {b++; s++; m++;}
[/][-][(] {b++; s++; d++;}
[*][(] {b++; m++;}
[/][(] {b++; d++;}
[)] {b--;}
[aA-zZ 0-9]+ {o++;}
[+][aA-zZ 0-9]+ {o++; a++;}
[-][aA-zZ 0-9]+ {o++; s++;}
[*][+][aA-zZ 0-9]+ {o++; a++; m++; if (o==1) {o=-9999; return(0);}}
[*][-][aA-zZ 0-9]+ {o++; s++; m++; if (o==1) {o=-9999; return(0);}}
[/][+][aA-zZ 0-9]+ {o++; a++; if (o==1) {o=-9999; return(0);}}
[/][-][aA-zZ 0-9]+ {o++; d++; if (o==1) {o=-9999; return(0);}}
[*][aA-zZ 0-9]+ {o++; m++; if (o==1) {o=-9999; return(0);}}
[/][aA-zZ 0-9]+ {o++; d++; if (o==1) {o=-9999; return(0);}}
. {o=-9999; return(0);}
%%

int main()
{
printf("Enter an arithmetic expression : ");
yylex();
if (b==0 && o>1)
{
printf("<<<<<Valid Expression>>>>>\n");
printf("No. of operands : %d\n",o);
printf("No. of + : %d\n",a);
printf("No. of - : %d\n",s);
printf("No. of * : %d\n",m);
printf("No. of / : %d\n",d);
}
else
{
printf("\nInvalid Expression!\n");
}
return(0);
}