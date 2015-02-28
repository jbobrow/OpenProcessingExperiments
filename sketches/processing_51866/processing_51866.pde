
PImage backing;
PFont brush;
String s = "SHY";
int xshy;
int yshy;

void setup()
{
  xshy = 25;
  yshy = int(random(400));
  size(500,500);
  smooth();
  brush = loadFont("BrushScriptMT-48.vlw");
  backing = loadImage("blackdesign.jpg");
}
void draw()
{
  image(backing,0,0,500,500);
  fill(255);
  
  textFont(brush);
  textAlign(LEFT,CENTER);
  text(s,xshy,yshy,100,100);
  
if (((dist(mouseX,mouseY,xshy+100,yshy+100)) < 200) && (mouseX < 200))
{
  xshy = xshy -5;
}
if (xshy < -100)
{ 
  xshy = 500;
  yshy = int(random (400));
}
if ((xshy > 400) && (mouseX <250))
{
 xshy = xshy - 1; 
}

if (((dist(mouseX,mouseY,xshy,yshy)) < 200) && (mouseX > 300))
{
 xshy = xshy + 5; 
}
if (xshy > 505)
{
  xshy = -99;
}
if (((dist(mouseX,mouseY,xshy+100,yshy+100)) > 350) && (mouseX > 250))
{
  xshy = xshy + 2;
}
}

