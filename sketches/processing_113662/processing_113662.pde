
void setup(){
  size(360,500);
}

void draw()
{
}

void Dreieck(float x, float y, float high, float wide)
{
  for( int sx = int(x); sx < int( x + high); sx = sx++)
  {
    float Formel = wide/high*(sx - x);
    for( int sy = int(y); sy < int(Formel); sy++)
    {
      fill(200,200,0);
      rect(sx, sy, 1, 1);
    }
  }
}

void Musterfuller()

  print("Halloo");:
  Dreieck(random(360), random(500),random(360), random(500));
}   

void keyPressed()
{
  for(int x = 0; x < 10; x++)
  {
    Musterfuller();
  }
}
