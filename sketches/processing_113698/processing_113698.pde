
void setup()
{
  size(360,500);
}

void draw()
{
}

class F
{
  
  float a1;
  float a2;
  float a3;
  float a4;
  float a5;
  float a6;
  
  F()
  {
    a1 = random(10);
    a2 = random(10);
    a3 = random(10);
    a4 = random(10);
    a5 = random(10);
    a6 = random(10);
  }
  
  float Funktion( float x)
  {
    return (( a1 * sin(x/2) + a2 * sin(x/3) + a3 * sin(x/4) + a4 * sin(x/5))*255);
  }
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0,360,500);
  
  F FA = new F();
  F FB = new F();
  
  for(float x = 0; x < 360; x++)
  {
    for(float y = 0; y < 500; y++)
    {
      // stroke(255, 0, 0);
      stroke(FA.Funktion(x / 15), FB.Funktion(y/20), 0);
      point(x,y);
    }
  }
}
