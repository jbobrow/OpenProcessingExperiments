
// Written by Jose Pertierra
// jpertier@andrew.cmu.edu
// Copyright Jose Periterra (October 22, 2013) All Rights Reserved

float x, y, dy;
float x2, y2, sz2, dx2, dy2;
int hits;
color col, col2;

void setup()
{
  size(600, 600);
  x = width*0.5;
  y = height*0.5;
  dy = -2;
  x2 = width*0.3;
  y2 = height*0.7;
  sz2 = width*0.13;
  dx2 = 2;
  dy2 = 1;
  col = color(158, 157, 157);
  col2 = color(random(255), random(255), random(255));
  hits = 0;
  frameRate(150);
}

void draw()
{ 
  prepScreen();
  drawFigure2();
  moveFigure2();
  moveFigure();
  drawFigure();
  detectCollision();
  showTime();
  showScore();
}

void showScore()
{
   fill(255, 255, 255);
   textAlign(LEFT, LEFT);
   textSize(50);
   text("Score: " +  hits, width*.05, height*.2 );
}

void showTime()
{
   fill(255, 255, 255);
   textAlign(LEFT, LEFT);
   textSize(50);
   text("Time: " +  millis( )/1000, width*.05, height*.1 );
}

void detectCollision()
{
 float d = dist(x + width*0.03, y - height*0.04, x2, y2);
 float colDist = sz2*0.5;
 if (d <= colDist)
 {
   rect(0, 0, width, height);
   textSize(75);
   fill(255, 255, 255);
   textAlign(CENTER, CENTER);
   text("BULLSEYE", width*0.5, height*0.5);
   dx2 *= -1;
   dy2 *= -1;
   dy -= 0.25;
   col = color(random(255), random(255), random(255));
   col2 = color(random(255), random(255), random(255));
   hits++;
   if (hits >= 50)
   {
     noLoop();
   }
 }
}

void moveFigure2()
{
  x2 += dx2;
  y2 += dy2;
  if (x2 + sz2 >= width || x2 - sz2 <= 0)
  {
    dx2  *= -1;
  }
  else if (y2 - sz2 <= 0 || y2 + sz2 >= height)
  {
    dy2 *= -1;
  }
}

void drawFigure2()
{
  noStroke();
  fill(179, 7, 7);
  ellipse(x2, y2, sz2*2.0, sz2*2.0); 
  fill(255, 255, 255);
  ellipse(x2, y2, sz2, sz2); 
  fill(179, 7, 7);
  ellipse(x2, y2, sz2*0.5, sz2*0.5);
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {
    x += 30;
  }
  else if (keyCode == LEFT)
  {
    x -= 30;
  }
  else if (key == 'a')
  {
    dx2--;
  }
  else if (key == 'd')
  {
    dx2++;
  }
  else if (key == 'w')
  {
    dy2--;
  }
  else if (key == 's')
  {
    dy2++;
  }
  else if (key == 'r')
  {
    x = random(width);
    y = random(height);
    x2 = random(width);
    y2 = random(height);
  }
}

void moveFigure()
{
  y += dy;
  if (y < 0 - height*0.14)
  {
    y = height;
  }
  else if (x > width*0.99)
  {
    x = 0 - width*0.05;
  }
  else if (x < 0 - width*0.05)
  {
    x = width*0.99;
  }
}

void prepScreen()
{
  fill(col2);
  rect(0, 0, width, height);
}

void drawFigure()
{
  stroke(145, 81, 7);
  strokeWeight(5);
  line(x + width*0.03, y, x + width*0.03, y + height*0.15);
  noStroke();
  fill(col);
  triangle(x + width*0.01, y, x + width*0.03, y - height*0.04, x + width*0.05, y);
  quad(x + width*0.03, y + height*0.09, x + width*0.03, y + height*0.15, x + width*0.01, y + height*0.18, x + width*0.01, y + height*0.12);
  quad(x + width*0.03, y + height*0.09, x + width*0.03, y + height*0.15, x + width*0.05, y + height*0.18, x + width*0.05, y + height*0.12);
}



