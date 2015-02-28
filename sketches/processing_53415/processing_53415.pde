
float angle = 0.0;


PFont Locator;
String t = "So Tired";
int xpos;
int speed = -300; 



void setup ()
{
  size (400, 400);
  background(0);
  smooth();
  noStroke();
  Locator = loadFont ("Locator-Bold-48.vlw");
  textFont(Locator);
}

void draw ()
{
  // background (255);


  smooth();
  translate(width/2, height/2);

  float x = cos(angle) * 100;
  float y= sin(angle) * 100;

  fill(255,255,0,40);
  text(t, x, y);
  stroke(0);

  angle +=-.01;
}


