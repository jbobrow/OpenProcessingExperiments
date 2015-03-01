
int RADI = 190;
int[][] points = new int[255][255];

void setup()
{
  size(400, 400);
  noStroke();
}
   
void draw()
{
  reset();
  float rad = radians(frameCount % 360);
  for (int i = RADI; i > 0; i-=10) {
      for (int j = 0; j < 400; j++) {
          float r = rad - j * 0.3;
          float x = i * cos(r) + width / 2.0;
          float y = i * sin(r) + height / 2.0;
          noStroke();
          fill(0x7f, floor(random(155)) + 100, floor(random(155)) + 100);
          ellipse(x ,y , 2, 2);
      }
  }
}

void reset() {
  background(#010101);
}
