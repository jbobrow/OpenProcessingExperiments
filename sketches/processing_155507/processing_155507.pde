
// http://patakk.tumblr.com/post/54676098719/x-r-cos-alfa-y-r-sin-alfa-r
/*
x = r * cos(alfa);
 y = r * sin(alfa);
 r++;
 alfa++;
 by patakk
 */

float a, r, d;

float centerX, centerY, maxR = 470;

PImage img;

void setup ()
{
  size (800, 800);
  smooth();
  centerX = width/2.8;
  centerY = height/1.3;
  a = 0;
  r = 0.5;
  d = 3;
  img = loadImage ("Fritz2.jpg");
  img.resize (width, height);

  background (90,100,100);
  // frameRate (300);
}

void draw ()
{


  if (r <= maxR)
  {

    for (int i = 0; i < 200; i++)
    {
      displayEllipse ();

      if (r > maxR) break;
    }

    // if (frameCount % 30 == 0) saveFrame ("steichen/steichen_######.pmg");
  }
}

void displayEllipse ()
{
  float x = centerX + cos (a)*r;
  float y = centerY + sin (a)*r;

  color c = img.get (int (x), int (y));
  
  
  float currentD = map (brightness (c), 0, 255, 5, 1) + random (2);
  d = d*0.5 + currentD*0.3;
  
  x = centerX + cos (a)* (r-d);
   y = centerY + sin (a)*(r-d);
   
   float fillC = map (d, 90, 100, 100, 50);

  fill (fillC);
  noStroke();
  ellipse (x, y, d, d);

  updateAngle (x, y);
}


void updateAngle (float x, float y)
{
  float distance = dist (x, y, centerX, centerY);
  float maxDis = 200;
  float aSteps = map (distance, 0, maxDis, PI/160, 0.00000000001);


  r += aSteps;
  a += aSteps;
}



void mousePressed ()
{
  //background (240);
  centerX = mouseX;
  centerY = mouseY;
  a = 0;
  r = 0;
  d = 0.5;
}





