
void setup()
{
  size(500,500);
  smooth();
  noStroke();
  frameRate(18);
}

int k = 0;

void draw()
{
  background(0,0,0);
  smooth();
  for(int i = 0; i < 440; i = i + 40)
  {
    for(int j = 0; j < 440; j = j + 40)
    {
      fill(255);
      k = k + 30;
      arc(50 + i, 50+j, 30,30, radians(k), radians(k+180));
    }
  }
}
