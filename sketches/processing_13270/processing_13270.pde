
/**
 * Scale 
 * by Denis Grutze. 
 * 
 * Paramenters for the scale() function are values specified 
 * as decimal percentages. For example, the method call scale(2.0) 
 * will increase the dimension of the shape by 200 percent. 
 * Objects always scale from the origin. 
 */
 
float a = 0.0;
float s = 0.0;
PImage monright;
PImage moncenter;
PImage moncenterUp;
PImage monleft;
PImage building;

void setup()
{
  size(500,600);
  noStroke();
  frameRate(60);
  monright = loadImage("monster-right.png");
  moncenter = loadImage("monster-center.png");
  moncenterUp = loadImage("monster-centerUp.png");
  monleft = loadImage("monster-left.png");  
  building = loadImage("building.png");
}

void draw()
{
  background(210);
  
  a = a + 0.04;
  s = 100 + cos(a)*5;
  
  image(building, 60, 60, width - 150, height - 60);  
  image(monleft, 20,70, s + 120, s + 50);
  image(moncenterUp, 120, 40, s + 160, s + 55);
  image(moncenter, 120, 130, s + 160, s + 55);
  image(monright, 260, 90, s + 70, s + 30);
     
}

