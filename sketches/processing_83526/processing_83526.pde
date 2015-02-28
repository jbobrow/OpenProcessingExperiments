
//Robert Wohlforth
//Final Project 1 - "Marble Run"
//Copyright Pittsburgh 2012

//Click and drag to add a ramp, intercepting the falling marble.
//Press BACKSPACE to remove the last added ramp.
//Press TAB to reset the marble to its original location.

import processing.opengl.*;

mover ball = new mover();
construction run = new construction();
Solid barrier = new Solid();
float [] walls1 = new float[0];
float [] walls2 = new float[0];
float [] walls3 = new float[0];
float [] walls4 = new float[0];
float wallThick, amlX, amlY, amldY = 2, depth, mouseX1, mouseY1, slope;
boolean block = false, clicked=false, start = false;

void setup ()
{size (500, 700, P3D);
wallThick = width/30;
depth = width/10;
amlX = width/2;
amlY = 0;
}

void draw ()
{background (255);
ball.fall(depth);
ball.collision();
ball.roll();
ball.draw (amlX, amlY, depth);
run.draw ();
addNew();
instructions();
}

class mover
{
 void draw (float mx, float my, float mSize)
{pushMatrix();
translate(mx, my);
  sphere (mSize/2);
  popMatrix();
}

void fall(float mSize)
{if (block == false)
{amlY = amlY + amldY;
}
if (amlY > height+mSize/2)
{amlY = -mSize/2;
}
}

void collision()
{for (int i = 0; i < walls1.length; i++)
{if (findEdges (walls1[i], walls2[i], walls3[i], walls4[i], 0, 0) == true)
{block = true;
}
}
}

void roll()
{
if (block == true)
{for (int i = 0; i < walls1.length; i++)
{
 if (findEdges (walls1[i], walls2[i], walls3[i], walls4[i], wallThick, 0) == true)
{amlX = amlX - amldY/slope;
block=false;
}
if (findEdges (walls1[i], walls2[i], walls3[i], walls4[i], -wallThick, 0) == true)
{amlX = amlX + amldY/slope;
block=false;
}
}
}
}
}



boolean findEdges (float startX, float startY, float endX, float endY, float offsetX, float offsetY)
{float startAX = startX + ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float startAY = startY - ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);
float endAX = endX + ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float endAY = endY - ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);

float startBX = startX - ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float startBY = startY + ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);
float endBX = endX - ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float endBY = endY + ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);


if((endAX-startAX)/(endAY-startAY) > ((amlX+offsetX)-startAX)/((amlY+depth/2-offsetY)-startAY) && (amlX+offsetX) > startAX - depth/2 && (amlX+offsetX) < endAX + depth/2 && (endBX-startBX)/(endBY-startBY) < ((amlX+offsetX)-startBX)/((amlY+depth/2-offsetY)-startBY))
{slope = abs((endY-startY)/(endX-startX));
  return true;
}

else
{return false;
}
}




class construction
{void draw ()
{for (int i = 0; i < walls1.length; i++) {
    barrier.draw (walls1[i], walls2[i], walls3[i], walls4[i]);
}
}
}

void addNew ()
{if (mousePressed == true)
{
  if (clicked == false)
{mouseX1 = mouseX;
mouseY1 = mouseY;
clicked = true;
}
drawPreview (mouseX1, mouseY1, mouseX, mouseY);
}
}

void mouseReleased ()
{
  if (mouseX1 < mouseX)
{ 
  walls1 = append(walls1, mouseX1);
  walls2 = append(walls2, mouseY1);
 walls3 = append(walls3, mouseX);
  walls4 = append(walls4, mouseY);
}
else
{ walls1 = append(walls1, mouseX);
  walls2 = append(walls2, mouseY);
  walls3 = append(walls3, mouseX1);
  walls4 = append(walls4, mouseY1);
}
  clicked = false;
  start = true;
}

void keyPressed ()
{if (key == BACKSPACE)
{
  if (walls1.length > 0)
  {
walls1 = shorten(walls1);
  walls2 = shorten(walls2);
 walls3 = shorten(walls3);
  walls4 = shorten(walls4);
}
}
if (key == TAB)
{amlX = width/2;
amlY = -depth/2;
block = false;
}
}

void drawPreview (float startX, float startY, float endX, float endY)
{
float startAX = startX + ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float startAY = startY - ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);
float endAX = endX + ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float endAY = endY - ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);

float startBX = startX - ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float startBY = startY + ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);
float endBX = endX - ((wallThick/2)/dist (startX, startY, endX, endY))*(endY-startY);
float endBY = endY + ((wallThick/2)/dist (startX, startY, endX, endY))*(endX-startX);
  
  
//line (startX, startY, endX, endY);
line (startX, startY, startAX, startAY);
line (endX, endY, endAX, endAY);
line (startAX, startAY, endAX, endAY);

line (startX, startY, startBX, startBY);
line (endX, endY, endBX, endBY);
line (startBX, startBY, endBX, endBY);
}

class Solid
{
  void draw (float startX, float startY, float endX, float endY)
{float locX = startX + ((endX-startX)/2), locY = startY + ((endY-startY)/2), locZ = 0, widthV=wallThick , heightV = dist(startX, startY, endX, endY), depthV = depth, rotation = -atan (((endX-startX)/(endY-startY)));
pushMatrix();
  translate (locX,locY,locZ);
rotate (rotation);
  //Back
  pushMatrix();
  pushStyle();
  fill (50);
translate (0,0,-depthV/2);
rect (-widthV/2, -heightV/2, widthV, heightV);
 popMatrix();
 //Left
 pushMatrix();
 translate (-widthV/2,0,0);
 rotateY (PI/2);
 rect (-depthV/2, -heightV/2, depthV, heightV);
 popStyle();
 popMatrix();
 //Right
  pushMatrix();
   pushStyle ();
 //fill (col);
 translate (widthV/2,0,0);
 rotateY (PI/2);
 rect (-depthV/2, -heightV/2, depthV, heightV);
 popStyle();
 popMatrix();
 //Top
 pushMatrix();
 pushStyle ();
 //fill (col);
 translate (0,-heightV/2,0);
 rotateX (PI/2);
 rect (-widthV/2, -depthV/2, widthV, depthV);
 popStyle();
 popMatrix();
 //Bottom
  pushMatrix();
  pushStyle();
  fill(50);
 translate (0,heightV/2,0);
 rotateX (PI/2);
 rect (-widthV/2, -depthV/2, widthV, depthV);
 popMatrix();
 //Front
 pushMatrix();
translate (0,0,depthV/2);
rect (-widthV/2, -heightV/2, widthV, heightV);
 popStyle();
 popMatrix();
 popMatrix();
}
}

void instructions()
{if (start == false)
{pushMatrix();
translate(0,0, 50);
  pushStyle();
fill(255,0,0);
textAlign(CENTER, CENTER);
textSize(18);
  text ("Marble Run\nClick and drag to add a ramp,\nintercepting the marble.",width/2, height/2);
  popStyle();
  popMatrix();
}
}


