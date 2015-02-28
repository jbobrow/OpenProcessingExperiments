
// Rose Display - Jim Bumgardner
//
// The Rose Equation was the basis of John Whitney's RD/TD motion graphics system, described in his
// book Digital Harmony.
 
static final int kNbrDots = 512;
float rStart;
 
void setup()
{
  size(512, 512);
  smooth();
  rStart = 30 + random(60);
  background(0);
}
 
void setDayglowColor(float myHue)
{
  float ph = sin(millis()*.0001);
 
  int rr = (int) (sin(myHue) * 127 + 128);
  int gg = (int) (sin(myHue + (2*ph) * PI/3) * 127 + 128);
  int bb = (int) (sin(myHue + (4*ph) * PI/3) * 127 + 128);
  stroke(rr,gg,bb);
}
 
void draw()
{
  // background(0); // try blur here at smaller sizes...
  filter(BLUR);
  filter(ERODE);
   
  float n = millis()*.0001 + rStart;
  float rad = width*.97/2;
  float cx = width/2;
  float cy = height/2;
  for (int i = 0; i <= kNbrDots; ++i)
  {
    float theta = i*PI*2 / kNbrDots;
    setDayglowColor(n+theta/6);
    float r = rad * sin(n*theta);
    float px = cx + cos(theta)*r;
    float py = cy + sin(theta)*r;
    ellipse(px,py,4,4);
  }
}



