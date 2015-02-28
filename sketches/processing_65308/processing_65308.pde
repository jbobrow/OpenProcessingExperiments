
float x = 0;
float y = 0;
float targetx;
float targety;
float easing = 0.05;
float dx;
float dy;

void setup()
{
  size(1152,720);
  smooth();
  noStroke();
}

void draw()
{
  background(255,0,0);
  
  targetx = mouseX;
  dx = targetx - x;
  if(abs(dx) > 1)
  {
    x += dx * easing;
    fill(random(255),random(255),random(255));
  }
  
  targety = mouseY;
  dy = targety - y;
  if(abs(dy) > 1)
  {
    y += dy * easing;
    fill(random(255),random(255),random(255));
  }
  ellipse(x,y,22,22);
}

