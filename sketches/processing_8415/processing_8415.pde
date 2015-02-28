
void setup()
{
  size(380, 620);
  background(255);
  smooth();
}

void draw()
{
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  //fill(255, 204, 255);
  //stroke(128, 0, 128);
  int tmp = s/10+1;
  int tmp2 = 0;

  println("second: " + s*6);
  polygon(h, s*6+12, m*10+12, 10);
  println("minute: " + m*10);
  fill(h*10, h*11, h*12);
}

void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;

  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}

