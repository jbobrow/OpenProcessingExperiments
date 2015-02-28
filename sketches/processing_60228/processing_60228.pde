
//HW 8 While Loops
//Daniel C Lee, Copyright 2012

void setup()
{
 size(400, 400);
 background(97,246,239);
 smooth();
 noStroke(); 
 frameRate(15); 
}

void draw()
{
 drawCircles(); 
}

void drawCircles()
{
 int x = 0;

 while (x < width)
 {
  fill(random (255), 50);
  ellipse (x+3, x , x, x);
  x = x + 5;
 } 
}

