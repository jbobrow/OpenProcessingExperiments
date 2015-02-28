
PFont myFont;
PFont my_letra;

void setup()
{
  size(800,500);
  background(0);
  String[] fontList = PFont.list();
  println(fontList); 
  //textwidth();
}

void draw()
{
 int x,z;
 int /*mov=5*/ movi=5;
 float mov = 5;
 
 myFont = createFont("Mathematica7Mono", 40);
 textFont(myFont);
 for(x=65; x<=90; x++)
 {
 fill(random(0,255),random(0,255),random(0,255));
 char letra = char(x);
 text(letra,mov,100);
 mov += textWidth(letra);
 }
 
 my_letra = createFont("Mangal", 20);
 textFont(my_letra);
 for(z=97; z<=122; z++)
 {
 fill(random(0,255),random(0,255),random(0,255));
 text(char(z),movi,150);
 movi += 30;
 }
}



