
//homework 5
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin September 2012 Pittsburgh PA 15213 All Rights Reserved

//global variables
PImage shark, sardine, underwater;
float wd, ht, y, y1, y2, y3;

void setup()
{
  size(700, 400);
  smooth();
  shark = loadImage("shark.png");
  sardine = loadImage("sardine.png");
  underwater = loadImage("underwater.png");
  imageMode(CENTER);
  noCursor();
  y = random(0, 400);
  y1 = random(0, 400);
  y2 = random(0, 400);
  y3 = random(0, 400);
  wd = 60;
  ht = 30;
}

void draw()
{
  //environment
  image(underwater, 350, 200);

  //sardine
  drawSardine(width-frameCount%width, y);
  drawSardine(width-((frameCount-.5*width)*1.5), y1);
  drawSardine(width-(frameCount%width*2), y2);
  drawSardine(width-(frameCount%width*2.5), y3);

  moveSardine(width-frameCount%width);


  //shark
  image(shark, mouseX, mouseY, wd, ht);
}

void drawSardine(float x, float y)
{
  image(sardine, x, y);
}

void moveSardine(float x)
{
  if (x < - 5)
  {
    y = random (0, 400);
  }
}

void keyPressed( )
{
  if ( key == 'f')  // [f] key
  {
    wd = wd + 1;
    ht = ht + .6;
  }
  if ( key == 'd')  // lower case [d] key
  {
   wd = wd - 1;
   ht = ht - .6; 
  }
}


