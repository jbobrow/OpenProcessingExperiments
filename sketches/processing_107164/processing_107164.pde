
void setup()
{
  size(360, 500);
}

void draw()
{
}

void keyPressed()
{
  float aa = random(3);
  float bb = random(3);
  
  int a = int(aa)+1;
  int b = int(bb)+1;
  
  for( int i = 0; i < a; i++)
  {
    for( int j = 0; j < b; j++)
    {
      fill(random(255),random(255),random(255));
      rect(360/a*i, 500/b*j, 360/a, 500/b);
    }
  }
  
  save("Test");
}
