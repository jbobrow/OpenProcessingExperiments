
void setup()
{
  size(360,500);
}

void draw()
{
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0, 360,500);
  
  for(int n = 0; n < 100; n++)
  {
    fill(random(255),random(255), random(255));
    arc(random(360), random(500), random(360), random(500), random(2*PI), random(2*PI));
  }
}
