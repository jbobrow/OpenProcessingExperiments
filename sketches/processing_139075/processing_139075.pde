
float x = 80;
float y = 80;
float w = 70;
float h = 70;
  
float speedX = 1;
float speedY = 1;

PImage pic;
 
 
void setup() 
{
  size(500, 500); 
  ellipseMode(CORNER);
  pic = requestImage("playful_background.jpg");
 
}
 
void draw() 
{
  image(pic, 0, 0, width, height);
  fill(0, 0, 255);
  ellipse(x, y, w, h);
 
  speedY = speedY + 0.5;
 
  x = x + speedX;
  y = y + speedY;
 
  if ((x > width - w) || (x <= 0)) 
  {
    speedX = -speedX;
  }
 
  if (y > height - h) 
  {
    y = height - h;
    speedY = speedY * -0.9;
  }
  else if (y <= 0) 
  {
    speedY = -speedY;
  }
}
 
void mousePressed() 
{ 
  speedX = speedX  + .05;     
  speedY = -20;
}


