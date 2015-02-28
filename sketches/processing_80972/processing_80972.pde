
PFont myFont, myFont2;
char a,b;
int c;
void setup() {
  size(700,400);
  String[] fontList=PFont.list();
  println(fontList);
  myFont= createFont("Algerian",32);
  myFont2=createFont("Wide Latin",32);
  textFont(myFont);
  
 frameRate(2);
 a=65;
 b=97;
 c=0;
}

void draw(){
  textFont(myFont);
text(a,25+25*c,80);
textFont(myFont2);
text(b,25+25*c,100);
if (c<25)
{
a++;
b++;
c++;
}
else{ 
a=65;
b=97;
c=0;
background(0);
}
}



