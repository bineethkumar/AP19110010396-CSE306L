digit [0-9]*
id [a-zA-Z][a-zA-Z0-9]*
num [0-9]*\.[0-9]*

%{
#include<stdio.h>
#include<string.h>
%}

%%

int | float | char | double | 
void { printf("\n %s is keyword",yytext);}
"<=" {printf("\n %s is Relational operator Lessthan or Equal to",yytext);}
"<" {printf("\n %s is Relational operator Lessthan",yytext);}
">=" {printf("\n %s is Relational operator Greaterthan or Equal to",yytext);}
">" {printf("\n %s is Relational operator Greaterthan",yytext);}
"==" {printf("\n %s is Relational operator Equal to",yytext);}
"!=" {printf("\n %s is Relational operator Not Equal to",yytext);}
"=" {printf("\n %s is Assignment operator",yytext);}
{id} {printf("\n %s is identifier",yytext); }
{num} {printf("\n %s is float",yytext);}
{digit} {printf("\n %s is digit",yytext);}

%%

main()
{
yylex();
}

int yywrap()
{
return 1;
}
