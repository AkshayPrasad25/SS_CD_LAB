%{
#include <stdio.h>
int c=0;
%}
%%
[/][*].*["*/"]*[*][/] {c++; fprintf(yyout," ");}
"//".* {c++;fprintf(yyout," ");}
%%
int main(int argc, char** argv){
	if(argc!=3){
		printf("Invalid input\n");
		return 0;
	}
	yyin = fopen(argv[1],"r");
	yyout = fopen(argv[2],"w");
	yylex();
	printf("No. of comment lines: %d\n",c);
	return 0;
}
