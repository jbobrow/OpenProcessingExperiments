
float theta;
void setup()
{
  size(500,500);
  background(0);
  noFill();
  stroke(255);
  theta = 2*PI;
}
void draw()
{
  background(0);

  for (int i = 50; i < width; i += 10)
  {
    arc(width/2,height/2,i,i,theta,theta+PI/4);
    arc(width/2,height/2,i,i,PI + theta,PI + theta+PI/4);
  }
  theta -= 0.06;
  if (theta < 0)
  {
    theta = 2*PI;
  }
}

