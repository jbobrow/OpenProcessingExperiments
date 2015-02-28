
// Perlin Noise Demo - Jim Bumgardner
 
float kNoiseDetail = 0.01;
float r;
float speed= 0.3;
float ox = 50;
float oy = 50;
 
void setup()
{
  size(400,200);
  r = width/2;
     
  noiseDetail(5,.5);
  colorMode(HSB, 1);
}
 
 
void draw()
{
  ox += max(-speed,min(speed,(mouseX-width/2)*speed/r));
  oy += max(-speed,min(speed,(mouseY-height/2)*speed/r));
 
  for (int y = 0; y < height; ++y)
  {
    for (int x = 0; x < width; ++x)
    {
      float v = noise(ox+x*kNoiseDetail,oy+y*kNoiseDetail,millis()*.0002);
      set(x,y,color(.65-y*.1/height,.75-v,.5+v*v));     
    }
  }
}



