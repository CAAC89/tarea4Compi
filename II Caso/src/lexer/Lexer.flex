package lexer;
import java_cup.runtime.Symbol;
%%

%public
%cup
%line
%full
%char
%ignorecase
%class Yylex

%eofval{
  return new Symbol(sym.EOF);
%eofval}

D = [0-9]
ID = [a-zA-Z]
WHITE = [ ]
WHITEN = [\n]
WHITET = [\t]
WHITER = [\r]
%{
public String lexico = "";
public static int linea=1;
public static int pos=0;
public bool COM = false;
%}
%%

[\t\r ]+ {lexico += " ";}
[\n] {COM = false;}
[B][E][G][I][N] {if(COM == false){{lexico+=yytext();return new Symbol(sym.BEGIN);}else{lexico+=yytext();}}}
[E][N][D] {if(COM == false){{lexico+=yytext();return new Symbol(sym.END);}else{lexico+=yytext();}}}
[R][E][A][D] {if(COM == false){{lexico+=yytext();return new Symbol(sym.READ);}else{lexico+=yytext();}}}
[W][R][I][T][E] {if(COM == false){{lexico+=yytext();return new Symbol(sym.WRITE);}else{lexico+=yytext();}}}

[+-]?({D})* {if(COM == false){lexico=yytext();return new Symbol(sym.INT);}else{lexico+=yytext();}}
":=" {if(COM == false){lexico += yytext(); return new Symbol(sym.ASIGNA;)}else{lexico += yytext();}}
{ID}({ID})* {if(COM == false){lexico += yytext();lexico+=yytext();return new Symbol(sym.IDENTIFICADOR);}else{lexico+=yytext();}}
";" {if(COM ==false){{lexico+=yytext();return new Symbol(sym.PUNTO_COMA);}else{lexico+=yytext();}}}
"--" {{COM = true; {lexico+=yytext();return new Symbol(sym.COMETARIO);}else{lexico+=yytext();}}}
