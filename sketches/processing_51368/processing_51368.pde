
// Homework #6 48-257
// Humaira Tasnim htasnim Copyright 2012

float tx, ty, td, txSpeed;
float px, py, pSize, pxSpeed, pySpeed;

PImage p;

void setup()
{
  size(400, 400);
  
  // Initials setup
  tx = random(width);
  ty = random(height);
  td = 100;
  txSpeed = 2;

  // Image setup
  p = loadImage("casper.png");
  imageMode(CENTER);
  
  px = random(width);
  py = random(height);
  pSize = 100;
  pxSpeed = 2;
  pySpeed = 2;
}

void draw()
{
  prepWindow();
  drawInitials (tx, ty, td);
  wrapInitials();
  drawImage();
  bounceImage();
}

void prepWindow()
{
  fill (0, 10);
  rect (0, 0, width, height);
}

void drawInitials (float x, float y, float diameter)
{
  // Ellipse
  noStroke();
  fill (15, 15, 15);
  ellipse (x, y, diameter, diameter);
  
  // Initials
  noFill();
  strokeWeight (2);
  stroke (40);
   
  // h
  beginShape ();
    vertex (x - (0.25 * diameter), y - (0.25 * diameter));
    vertex (x - (0.25 * diameter), y + (0.25 * diameter));
    curveVertex (x - (0.25 * diameter), y);
    curveVertex (x - (0.25 * diameter), y);
    curveVertex (x - (0.05 * diameter), y - (0.06 * diameter));
    curveVertex (x - (0.025 * diameter), y + (0.45 * diameter));
    curveVertex (x - (0.025 * diameter), y + (0.45 * diameter));
  endShape ();
   
  // t
  beginShape();
    curveVertex (x + (0.025 * diameter), y - (0.45 * diameter));
    curveVertex (x + (0.025 * diameter), y - (0.45 * diameter));
    curveVertex (x + (0.025 * diameter), y + (0.05 * diameter));
    curveVertex (x + (0.1 * diameter), y + (0.25 * diameter) + (0.06 * diameter));
    curveVertex (x + (0.25 * diameter), y + (0.25 * diameter));
    curveVertex (x + (0.25 * diameter), y + (0.25 * diameter));
  endShape();
   
  beginShape();
    vertex (x + (0.025 * diameter), y - (0.2 * diameter));
    vertex (x + (0.2 * diameter), y - (0.2 * diameter)); 
  endShape();
}

void drawImage()
{
  smooth();
  noStroke();
  fill (40);
  ellipse (px, py, pSize*1.5, pSize*1.5);
  image (p, px, py, pSize, pSize);
}

void wrapInitials()
{
  tx = tx + txSpeed;
  if (tx > width + (td/2))
  {
    tx = 0;
    ty = ty + 200;
  }
  if (ty > height + (td/2))
  {
    ty = 0 ;
  }
}

void bounceImage()
{
  px = px + pxSpeed;
  if (px > width)
  {
    pxSpeed = -pxSpeed;
  }
  else if (px < 0)
  {
    pxSpeed = -pxSpeed;
  }
  
  py = py + pySpeed;
  if (py > height)
  {
    pySpeed = -pySpeed;
  }
  else if (py < 0)
  {
    pySpeed = -pySpeed;
  }
}

