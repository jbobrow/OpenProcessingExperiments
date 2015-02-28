
void setup()
{
  size (200, 200);
}


void draw()
{
  //hi laura, this isnt working as intended, some minor errors with the function creation. 
  //I will email it to myself and work on it at home.
  
{
if((mouseX < 90  || mouseX > 110) && (mouseY< 90 || mouseY >110))
{
  background(155);
  drawImage(0,1);
  }
}

}



void drawImage(int x, int speed)
{
  background (0);
  fill (255, 0, 0);
  rect (x, height/2, 60, 60);
  fill (255, 255, 0);
  ellipse (x + 30, height/1.5, 55, 55);
  fill (0, 255, 0);
  ellipse (x + 30, height/1.5, 30, 30);
  x = x + speed;
  if (x + 10 > width/2 && x < 0)
  {
    speed = speed* -1;
  }
  else
  {
    speed = speed + 1;
  }
 
}
