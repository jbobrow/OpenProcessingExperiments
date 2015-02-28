
PImage sun;
PImage space;

PImage moon;
float angle1;
float r1 = 200;

PImage planet;
float angle2;
float r2 = 50;

void setup()
{
  size(800, 800);
  smooth();
  space = loadImage("Space_Deep.jpg");
  sun = loadImage("sun.png"); 
  planet = loadImage("planet.png"); 
  moon = loadImage("moon.png"); 
  imageMode(CENTER);
}

void draw()
{
  image(space, width/2, height/2);
  translate (width/2, height/2);
  rotate(radians(180 + angle2));
  image(sun, 0, 0);


  angle1 += 0.01;
  float x = r1* cos(angle1);
  float y = r1* sin(angle1)*1.4;
  //how to rotate moon?
  image(moon, x, y);

  angle2 -= 0.03;
  translate (x, y);
  float v = r2* cos(angle2)*1.0;
  float w = r2* sin(angle2)*1.8;
  image(planet, v, w, 50, 50);
}


