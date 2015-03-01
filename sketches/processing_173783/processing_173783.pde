
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  for(int n = 0; n < 3; n++)
  {
   int z = int(random(3));
   switch(z)
    {
      case 0: fill(255,0,0); break;
      case 1: fill(0,255,0); break;
      case 2: fill(0,0,255); break;
    }
   rect(n*100,0,100,500);
  }
  
}
