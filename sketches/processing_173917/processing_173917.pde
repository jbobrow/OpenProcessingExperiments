
void setup()
{
  size(300, 500);
}

void draw()
{
}

void keyPressed()
{
  int w = int(random(100)+100);
  for(int z = 0; z < 5; z++)
  {
    fill(w+random(100)-50,w+random(100)-50,w+random(100)-50);
    rect(0,500/5*z, 300, 500/5);
  }
}
