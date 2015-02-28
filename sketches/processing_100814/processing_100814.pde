
void setup()
{
  size(400, 400);
  strokeWeight(6);
  colorMode(HSB);
  for(int i = 0; i < 360; i++)
  {
    for (int j = 0; j < ((width/2)*sqrt(2)); j++)
    {
      stroke(i*255/360, 255, j*255/((width/2)*sqrt(2)));
      point(width/2+cos(radians(i))*j, height/2+sin(radians(i))*j);
    }
  }
}


