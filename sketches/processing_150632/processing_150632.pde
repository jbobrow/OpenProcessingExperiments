
int RADI = 190;
   
void setup()
{
  size(400, 400);
  noStroke();
}
   
void draw()
{
  reset();
  float rad = radians(frameCount % 360);
  for (int i = RADI; i > 0; i-=20) {
      for (int j = 0; j < 360; j++) {
          float r = rad - j * 0.3;
          float x = i * cos(r) + width / 2.0;
          float y = i * sin(r) + height / 2.0;
          fill(0xff, 0x78, floor(random(255)));
          ellipse(x ,y , 10, 10);
      }
  }
}

void reset() {
  background(#010101);
}
