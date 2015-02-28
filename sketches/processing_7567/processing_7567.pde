


void setup()
{
  size(500,500);
  noFill();
}

void draw()
{
  background(64);
  for (int i = 0; i < 420; i=i +(mouseX+2))
  {
    stroke(i);
    stroke(400, 400,0);
    ellipse(width/2, height/2, i, i);
  }
  
}







