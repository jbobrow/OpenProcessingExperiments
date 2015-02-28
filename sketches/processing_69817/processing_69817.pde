
int i=0;
int y=400;
int x=5;
void setup()
{size(800,400);


}
void draw()
{
  background(0);
  PFont tipo_letra;
 tipo_letra=loadFont("SansSerif.bolditalic-48.vlw");
 textFont(tipo_letra,x);
 text("yarime",i,y);
 i=i+20;
 y=y-20;
 x=x+5;
}

