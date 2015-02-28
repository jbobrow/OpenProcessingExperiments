
int [] anIntArray = {30, 60, 90, 120, 150};
int x = 0 , speedX = 1;

void setup()
{
  size(200, 200);
}
void draw()
{
  background(255);
  noStroke();
  fill (0);
  rect(0, 0, 20, height);
  fill (0);
  rect(0, height - 20, width, 20);
  fill (0);
  rect( width - 20, 0, 20, height);
if (( mouseX > 20 && mouseX < width - 20) && ( mouseY > 20 && mouseY < height - 20))
{ 
  
}

else
  {
  fill(0, 125, 255);
  ellipse(x +30, anIntArray[0] , 10, 10);
  fill(0, 101, 206);
  ellipse(x+30, anIntArray[1] , 10, 10);
  fill(0, 76, 155);
  ellipse(x+30, anIntArray[2] , 10, 10);
  fill(0, 45, 93);
  ellipse(x+30,anIntArray[3], 10, 10);
  fill(0, 16, 33);
  ellipse(x+30, anIntArray[4], 10, 10);
  x = x+ speedX;
  if( x > width - 60 || x < 0)
  speedX = speedX * -1;
  }
}
