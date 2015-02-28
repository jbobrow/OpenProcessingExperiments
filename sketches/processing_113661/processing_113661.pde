
void setup(){
  size(360,500);
}

void draw()
{
}

void Musterfuller()
{
  fill(random(255),random(255), random(255));
  triangle(random(360), random(500),random(360), random(500),random(360), random(500));
}   

void keyPressed()
{
  for(int x = 0; x < 36; x++)
  {
    Musterfuller();
  }
}
