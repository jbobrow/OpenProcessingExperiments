
void setup()
{
  size(500, 500);
  noStroke();
  smooth();
}

void draw()
{
  background(0);
  
  fill(255);
  for (int i = 0; i < 11; i++)
  {
    for (int j = 0; j < 11; j++)
    {
      float cArc = (2*PI/6) + radians((7*frameCount)60) + i*0.25 + j*0.25;
      arc(45 + i*(width/12), 45 + j*(width/12), 30, 30, cArc, cArc + PI);
    }
  }
}
