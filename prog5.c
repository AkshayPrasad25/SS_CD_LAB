#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
char op[2],arg1[5],arg2[5],res[5];
void main()
{
FILE *fp1,*fp2;
fp1=fopen("input.txt","r");
fp2=fopen("output.txt","w");
while(!feof(fp1))
{
fscanf(fp1,"%s%s%s%s",res,arg1,op,arg2);
if(strcmp(op,"+")==0)
{
fprintf(fp2,"\n MOV R0,%s",arg1);
fprintf(fp2,"\n ADD R0,%s",arg2);
fprintf(fp2,"\n MOV %s,R0",res);
}
if(strcmp(op,"*")==0)
{
fprintf(fp2,"\n MOV R0,%s",arg1);
fprintf(fp2,"\n MUL R0,%s",arg2);
fprintf(fp2,"\n MOV %s,R0",res);
}
if(strcmp(op,"-")==0)
{
fprintf(fp2,"\n MOV R0,%s",arg1);
fprintf(fp2,"\n SUB R0,%s",arg2);
fprintf(fp2,"\n MOV %s,R0",res);
}
if(strcmp(op,"/")==0)
{
fprintf(fp2,"\n MOV R0,%s",arg1);
fprintf(fp2,"\n DIV R0,%s",arg2);
fprintf(fp2,"\n MOV %s,R0",res);
}
if(strcmp(op,"=")==0)
{
fprintf(fp2,"\n MOV R0,%s",arg1);
//fprintf(fp2,"\n ADD R0,%s",arg2);
fprintf(fp2,"\n MOV %s,R0",res);
}
}
fclose(fp1);
fclose(fp2);
//getch();
}