digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]*\.[0-9]*
%{
#include<stdio.h>
#include<string.h>
int cnt=0,i=0,j=0;
char st[10][10];
int look_up(char st[10][10],char *id,int n);
%}
%%

int | float | char | double | void |
main { printf(" \n %s is keyword",yytext);}
{num} { printf("\n %s is float",yytext);}
{id} { printf("\n %s is identifier",yytext);
if (!lookup(st,yytext,i)){
 strcpy(st[i++],yytext);cnt++;}
}

{digit} {printf("\n %s is digit",yytext);}

%%
main()
{
yylex();
printf(" No of id are : %d ",cnt);
printf("\n the contents of symbol table are :\n");
for(j=0;j<i;j++)
 printf("\n %s",st[j]);
}

int yywrap()
{
return 1;
}
int lookup(char st[10][10],char *id,int n)
{
for(j=0;j<n;j++)
if(!strcmp(st[j],id))
 return 1;
return 0;
}
