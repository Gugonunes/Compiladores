%option noyywrap
%{
int chars = 0;
int words = 0;
int lines = 0;
%}
%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
. { chars++; }
%%
int main()
{
yylex();
printf("Nro de linhas : %d\n", lines);
printf("Nro de palavras : %d\n", words);
printf("Nro de caracteres: %d\n", chars);
return 0;
}
