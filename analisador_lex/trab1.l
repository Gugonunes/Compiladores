%option noyywrap

%{
    #include<stdio.h>
    #include<stdlib.h>
    int line = 1;
%}

dig [0-9]
INT -?{dig}+
REAL {INT}"."{dig}
id [a-zA-Z][a-zA-Z0-9]*

PROG "programa"
VAR "var"
BOOL "booleano"
INI "inicio"
FIM "fim"
IF "se"
THEN "entao"
ELSE "senao"
WHILE "enquanto"
DO "faca"
READ "leia"
ABREP "("
FECHAP ")"
WRITE "escreva"
DIF "<>"
IGUAL "="
MENOR "<"
MAIOR ">"
MENORIGUAL "<="
MAIORIGUAL ">="
SOMA "+"
SUB "-"
OR "ou"
MULTI "*"
DIV "div"
AND "e"
ATRIB ":="

%%
"{"[^}\n]*"}"

; { line++; printf("<PontoV, %d>", line);} 
{ATRIB} { printf("<ATRIB, %d>", line); }
{PROG} { printf("<PROG, %d>", line); }
{VAR} { printf("<VAR, %d>", line); }
{REAL} { printf("<REAL, %d>", line); }
{BOOL} { printf("<BOOL, %d>", line); }
{INI} { printf("<INI, %d>", line); }
{FIM} { printf("<FIM, %d>", line); }
{IF} { printf("<IF, %d>", line); }
{THEN} { printf("<THEN, %d>", line); }
{ELSE} { printf("<ELSE, %d>", line); }
{WHILE} { printf("<WHILE, %d>", line); }
{DO} { printf("<DO, %d>", line); }
{READ} { printf("<READ, %d>", line); }
{ABREP} { printf("<ABREP, %d>", line); }
{FECHAP} { printf("<FECHAP, %d>", line); }
{WRITE} { printf("<WRITE, %d>", line); }
{DIF} { printf("<DIF, %d>", line); }
{IGUAL} { printf("<IGUAL, %d>", line); }
{MENOR} { printf("<MENOR, %d>", line); }
{MAIOR} { printf("<MAIOR, %d>", line); }
{MENORIGUAL} { printf("<MENORIGUAL, %d>", line); }
{MAIORIGUAL} { printf("<MAIORIGUAL, %d>", line); }
{SOMA} { printf("<SOMA, %d>", line); }
{SUB} { printf("<SUB, %d>", line); }
{OR} { printf("<OR, %d>", line); }
{MULTI} { printf("<MULTI, %d>", line); }
{DIV} { printf("<DIV, %d>", line); }
{AND} { printf("<AND, %d>", line); }
{id} { printf("<ID, %d>", line);}
{INT} { printf("<INT, %d>", line);}


%%

int main(int argc, char* argv[]){
    FILE*file = fopen("test.l", "r");
    yyin = file;
    yylex();
    printf("\n\n\n");
}

