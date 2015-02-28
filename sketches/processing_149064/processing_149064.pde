
////////////////////////////////////////////////////////////////

//storage data type
class Token
{
int TokenType;
String Name;
}

//define char types
int LETTERS   =  200;
int NUMBERS   =  300;
int OPERATORS =  400;

int ERROR     =  600;

class Lex
{

boolean echo = true;  //enables program trace

String input = new String(); //input file
String buffer = new String(); //temp storage used in getNextToken()
int position = 0; //current position in file/string

//returns the character at location pos
char getCharacter(int pos){
if(echo){println(“\n —Start getCharacter— \n”);}
if(pos < input.length())
{
return input.charAt(pos);
}
else
{
return ”;
}

}//getCharacter

//returns the next token in the file/string
Token getNextToken(){
if(echo){println(“\n —Start getNextToken— “);}
Token result = new Token();
result.TokenType = ERROR;
buffer = “”;

//get first char
char c = getCharacter(this.position);

//eat whitespace
while(isWhite(c)){
this.position++;
c = getCharacter(this.position);
if(echo){println(“\t\t —isWhite– ” + c);}
};

//store all letters
while(isAlpha(c)){
result.TokenType = LETTERS;
buffer += c;
this.position++;
c = getCharacter(this.position);
if(echo){println(“\t\t —isAlpha– ” + c);}
};

//store all digits
while(isNum(c)){
result.TokenType = NUMBERS;
buffer += c;
this.position++;
c = getCharacter(this.position);
if(echo){println(“\t\t —isNum– \n”);}
};

if(result.TokenType != ERROR){
result.Name = buffer;
if(echo){println(“\n —Buffer— ” + buffer);}
}

if(echo){println(“\n —End getNextToken— \n”);}
return result;
}//getNextToken

//////////////////////////TESTS///////////////
// isApha test
boolean isAlpha(char c)
{
return ( (c >= ‘a’ && c <= ‘z’) || (c >= ‘A’ && c <= ‘Z’) );
}

// isNum test
boolean isNum(char c)
{
return (c >= ’0′ && c <= ’9′);
}

// isWhite test
boolean isWhite(char c)
{
return (c == ‘ ‘ || c == ‘\t’);
}

}//class lex

////////////////////////////////////////////////////////////////
//
//                           MAIN PROGRAM
//
////////////////////////////////////////////////////////////////

Lex lexer = new Lex();
String tempStr = new String();
int x = 10;
int y = 10;

void setup(){
size(400, 250);
int i = 0;
lexer.echo = false;
lexer.input = “bob ght 7867u print 10; “;
Token tok = new Token();
while(tok.TokenType != ERROR){

y = y + 15;
tok = lexer.getNextToken();
text(”  Token  ” +tok.Name + ”  type ” + tok.TokenType, x, y );
}//while

}

void draw(){

}
