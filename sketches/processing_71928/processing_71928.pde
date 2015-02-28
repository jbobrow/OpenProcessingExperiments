
//Christopher Chan
//ckchan@andrew.cmu.edu
//Homework 5
// (c) code written on Aug 20th, 2012

// Instructions
// press 'q' to change the size of circles
// press 'w' to change the placement of circles
// press '1', '2' & '3' to change the colors of the circles

float r, d, a;
color ellipseCol1, ellipseCol2, ellipseCol3;

void setup()
{
  size (400, 400);
  background (255);
  rectMode (CENTER);
  
  r = random (0,200);
  a = random (0,r);
  ellipseCol1 = color( random(250), random(250), random(250));
  ellipseCol2 = color( random(250), random(250), random(250));
  ellipseCol3 = color( random(250), random(250), random(250));
}

void draw ()
{
  noStroke ();
  translate (mouseX, mouseY);
  rotate (radians(frameCount/2));
  fill (#FFFFFF, 30);
  rect (0, 0, 1200, 1200);
  //rect (0, 0, 100, 100);
  splat (0,0);
  splat (-50,50);
  splat (-50,-50);
  splat (50,-50);
  splat (50,50);
  splat (100,100,r*2);
  splat (-100,100,r*2);
  splat (100,-100,r*2);
  splat (-100,-100,r*2);
  splat (200,100,r*3);
  splat (-200,100,r*3);
  splat (200,-100,r*3);
  splat (-200,-100,r*3);
}

void splat (float x, float y)
{
  fill (ellipseCol1, 10);
  ellipse (x,y,r,r);
  
  fill (ellipseCol2, 10);
  ellipse (x+a/2,y,r*3/4,r*3/4);
  ellipse (x-a/2,y,r*3/4,r*3/4);
  ellipse (x,y+a/2,r*3/4,r*3/4);  
  ellipse (x,y-a/2,r*3/4,r*3/4);  
  
  fill (ellipseCol3, 10);
  ellipse (x+a/2,y-a/4,r/2,r/2);
  ellipse (x+a/4,y+a/2,r/2,r/2);
  ellipse (x-a/4,y-a/2,r/2,r/2);  
  ellipse (x-a/2,y+a/4,r/2,r/2); 
}  

void splat (float x, float y, float d)
{
  fill (#00FFFF, 10);
  ellipse (x,y,r,r);
  
  //fill (#00FFFF, 20);
  ellipse (x+a/2,y,r*3/4,r*3/4);
  ellipse (x-a/2,y,r*3/4,r*3/4);
  ellipse (x,y+a/2,r*3/4,r*3/4);  
  ellipse (x,y-a/2,r*3/4,r*3/4);  
  
  //fill (#00FFFF, 10);
  ellipse (x+a/2,y-a/4,r/2,r/2);
  ellipse (x+a/4,y+a/2,r/2,r/2);
  ellipse (x-a/4,y-a/2,r/2,r/2);  
  ellipse (x-a/2,y+a/4,r/2,r/2);  
}  

void keyPressed ()
{
  if (key == 'q')
  {
    r = random(0,200);
  }
  else if (key == 'w')
  {
    a = random(100,300);
  }
  else if (key == '1')
  {
  ellipseCol1 = color(random (0,250),random (0,250),random (0,250));
  }
  else if (key == '2')
  {
  ellipseCol2 = color(random (0,250),random (0,250),random (0,250));
  }  
  else if (key == '3')
  {
  ellipseCol3 = color(random (0,250),random (0,250),random (0,250));
  }  
}

