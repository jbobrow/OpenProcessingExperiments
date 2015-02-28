
PFont miletra;
void setup ()
{
  size(600,300);
}
void draw ()
{
 
miletra=loadFont ("Baskerville-Bold-48.vlw");
textFont (miletra);
fill (204,24);
textSize (random (10,80));
rect (0,0,width,height);
fill (0);
text ("Mariana",random(600),random(300));
}
