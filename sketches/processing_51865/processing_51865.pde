
PImage painting;
PFont gabriola;
String s = "Hidden";
int transpar;
int xvar;
int yvar;

void setup()
{
  painting = loadImage("painting.jpg");
  gabriola = loadFont("Gabriola-48.vlw");
  size(500,500);
  transpar = 0;
  xvar = int(random(350));
  yvar = int(random(350));
  
 
}

void draw()
{
 image(painting,0,0,500,500);

textFont(gabriola);
color temp = painting.get(xvar, yvar);
fill(temp,transpar);
noCursor();
text(s,xvar, yvar,150,150);
transpar = transpar + 1;

if (transpar > 254)
{
xvar = int(random(350));
yvar = int(random(350));
transpar = 0;
}
}


