
void setup()
{
  size(800,800);
  
}

void draw()
{
  background(0);
  
  fill(255);
  ellipse(400,400,300,300);
  for (int i=0; i < 400; i+=10)
  {
    for (int j=0; j < 400; j+=10)
    {
      stroke(0,0,0,0);
      fill(random(255),random(255),random(255),random(100)+150);
      rect(mouseX+i,mouseY+j,10,10);
    }
  }
}


