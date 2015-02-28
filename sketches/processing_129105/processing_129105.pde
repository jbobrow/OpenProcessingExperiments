
float waveHeight = 5;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  strokeWeight(5);
  
  // start position
  float starty = 100.0;
  
  float ly = starty;
  float lx = 0.0;
   
  // end position
  float endx = 500.0;
  float endy = 100.0;
   
  // only draw until we've exceeded the end position
  // && means 'and' and that both things have to be true
  while (lx < endx)
  {
    // how far down the wave goes
    float waveHeight = 5;
    float waveFrequency = 4;
    float nextX = lx + 1;
    float nextY = starty + waveHeight * sin(radians(lx * waveFrequency));
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
 

}
