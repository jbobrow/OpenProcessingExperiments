
int RADI = 190;
  
void setup()
{
  size(400, 400);
  noStroke();
}
  
void draw()
{
  background(255);
  float rad = radians(frameCount % 360);
  for (int i = RADI; i > 0; i-=20) {
      for (int j = 0; j < 22; j++) {
          float r = rad - j * 0.3;
          float x = i * cos(r) + width / 3.0 + i / 5;
          float y = i * sin(r) + height / 3.0 + i / 5;
          fill(0xff, 0x78, 0x89);
          ellipse(x ,y , 10, 10);
      }
  }
}
