
int circlesize = 10;

void setup()
{
 size(700,400); 
 smooth();
 fill(0,50);
//noStroke();
}

void draw()
{
  background(255);
  ellipse(mouseX,mouseY,circlesize,circlesize);
  if (mousePressed == true)
  {
    if(mouseButton == RIGHT)
    {
      circlesize = circlesize + 1;
    }
    if (mouseButton == LEFT)
    {
      circlesize = circlesize - 1;
    }
  }
}

