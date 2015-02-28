
// Ethan Frier 
// Homework 6 
// 2/7/13
// Copywrite 2013


float x1, y1, wd1, ht1;
float x2, y2, wd2, ht2;

float x1speed, y1speed, x2speed, y2speed;
  
PImage finn;  
PImage jake;

void setup () 
{
  size(400, 400);
  smooth();
  
  finn = loadImage("finn.png");
  jake = loadImage("jake.png");
  
  x1 = 50;     // finn x
  y1 = 50;     // finn y
  wd1 = 102;   // finn width 
  ht1 = 166;   // finn height 
  x2 = 200;    // jake x 
  y2 = 200;    // jake y
  wd2 = 100;   // jake width  
  ht2 = 100;   // jake height 
  
  x1speed = 2;
  y1speed = 2;
  x2speed = 2;
  y2speed = 2;
  
  
}


void draw ()
{
  background(255);
  
  bounceFinn();
  wrapJake();
  drawfinn(x1, y1, wd1, ht1);
  drawjake(x2, y2, wd2, ht2);
  
}


void drawfinn (float x1, float y1, float wd1, float ht1)
{
  image (finn, x1, y1, wd1, ht1);
}


void drawjake (float x2, float y2, float wd2, float ht2)
{
  image (jake, x2, y2, wd2, ht2);
}



void bounceFinn ()
{
  x1 = x1 + x1speed;
  
  if(x1 > width-wd1)
  {x1speed = -x1speed;}
  else if (x1 < 0)
  {x1speed = -x1speed;}
  
 
  y1 = y1 + y1speed;
  
  if(y1 > height-ht1)
  {y1speed=-y1speed;}
  else if (y1<0)
  {y1speed=-y1speed;}
}


void wrapJake ()
{
  x2 = x2 + x2speed;
  
  if (x2 > width)
  {x2 = -width + width*.9;}
  
  
  y2 = y2 + y2speed;
  if (y2 > height)
  {y2 = -height + height*.9;}
}

void keyPressed()
{
  x1 = random(0, width - width/2);
  y1 = random(0, width - width/2);
  x2 = random(0, width - width/2);
  y2 = random(0, width - width/2);
  
  x1speed = random(0, 5);
  x2speed = random(0, 5);
  y1speed = random(0, 5);
  y2speed = random(0, 5);
}

