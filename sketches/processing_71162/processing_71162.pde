
// Homework #6 Section 11:30
// Copyright 2012 Leyli Guliyeva

// press space bar to randomize location and size of the circles

float x, y, diam, xInc, yInc;
float qx, qy, qDiam, qXspeed, qYspeed;

void setup ()
{
  size (400, 400);
  smooth ();
  x = 50;
  y = 50;
  diam = 75;
  xInc = 2;
  yInc = 3;
  qx = 75;
  qy = 75;
  qDiam = 32;
  qXspeed = 6;
  qYspeed = -3;
  
}

void draw ()
{
  prepWindow();
  movePink();
  pink ();
  bounceBlueish();
  blueish ();
}

void prepWindow ()
{ 
  fill (255, 10);
  rect ( 0, 0, width, height);
}

void bounceBlueish() {
   
   qx += qXspeed;
   qy += qYspeed;
   
   if (qx < qDiam/2 || qx > width-qDiam/2) 
   {
      qXspeed = -qXspeed; 
   }
   
   if (qy < qDiam/2 || qy > height-qDiam/2) 
   {
      qYspeed = -qYspeed; 
   }
}

void blueish()
{
  fill (147, 197, 234);
  strokeWeight (0);
  stroke (209, 235, 255);
  ellipse (qx, qy, qDiam+5, qDiam+5);
  
  //center circle
  fill (65, 132, 183);
  strokeWeight (3);
  stroke (18, 82, 129);
  ellipse (qx, qy, qDiam-15, qDiam-15);
}


void movePink()
{
  x += xInc;
  y += yInc;
  
  if (xInc > 0 && x > width + diam/2) {
     x = -diam/2; 
  } else if ( xInc < 0 && x < -diam/2){
     x = width + diam/2;
  }
  
  if (yInc > 0 && y > height + diam/2) {
     y = -diam/2; 
  } else if ( yInc < 0 && y < -diam/2){
     y = height + diam/2;
  }
  
}
    

void pink()
{
fill (255, 142, 153);
strokeWeight (0);
stroke (255, 90, 104);
ellipse (x, y, diam+10, diam+10);

//center circle
fill (255, 90, 104);
strokeWeight(6);
stroke (232, 68, 82);
ellipse (x, y, diam-27, diam-27);
}


void keyPressed()
{  
  if (key==' ')
  x = random (100, 200);
  y = random (100, 200);
  diam = random (75, 125);
  qx = random (10, 100);
  qy = random (10, 100);
  qDiam = random (10, 60);
  
  if (key=='h')
  {saveFrame("homework6.jpg");
  }
}
  







