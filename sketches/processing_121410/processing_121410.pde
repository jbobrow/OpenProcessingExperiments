
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
  for (int i = 0; i < 22; i++) {
      float x = RADI * cos(rad - i * 0.3) + width / 2;
      float y = RADI * sin(rad - i * 0.3) + height / 2;
      fill(0xff, 0x78, 0x89);
      ellipse(x,y, 10, 10);
  }
}
