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

int | float | char | double | void | 
main { fprintf(yyout," \n %s is keyword",yytext);}
{num} { fprintf(yyout,"\n %s is float",yytext);}
{id} { fprintf(yyout,"\n %s is identifier",yytext); cnt++;
if(!look_up(st,yytext,i))
strcpy(st[i++],yytext);
}
{digit} {fprintf(yyout,"\n %s is digit",yytext);}

%%
main()
{
yyin =fopen("x.txt","r");
yyout=fopen("y.txt","w");
yylex();
printf("\n the contents of symbol table are :\n");
for(j=0;j<i;j++)
printf("\n %s",st[j]); printf("\n\n");
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
