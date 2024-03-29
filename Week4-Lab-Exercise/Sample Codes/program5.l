digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num digit*\.digit*

%{
#include<stdio.h>
#include<string.h>
int cnt=0,i=0,j=0;
char st[10][10];
int look_up(char st[10][10],char *id,int n);
%}

%%

int | float | char | double | 
void { printf(" \n %s is keyword",yytext);}
{num} { printf("\n %s is float",yytext);}
{id} { printf("\n %s is identifier",yytext);
cnt++;
if(!look_up(st,yytext,i))
strcpy(st[i++],yytext);
}
{digit} {printf("\n %s is digit",yytext);}

%%

main(int argc, char **argv) {
yyin=fopen(argv[1],"r");
yylex();
return 0;
}

int yywrap()
{
return 1;
}

int look_up(char st[10][10],char *id,int n)
{
for(j=0;j<n;j++)
if(!strcmp(st[j],id))
return 1;
return 0;
}
