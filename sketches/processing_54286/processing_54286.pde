
void setup ()
{
  size (1265, 300);
  smooth();
  noLoop();
  colorMode(HSB, 360, 100, 100);
}

void draw ()
{
  background(360);

  for (int i= 100; i<width; i += 200)
  {
    float rs = random (20, 75);
    color rc = color (random (360), 75, 85);
    float rz = random (0,1);
    bed(i-50, height/6, rs, rc, rz);
  }
}

void bed(float x, float y, float s, color c, float z)
{
  fill (c);
  pushMatrix ();
  scale (z);
  strokeWeight(3);
  stroke(360);
  translate (x, y);
  //mattress
  rect(0, 0, 150, 200);
  // left pillow
  rect(10, 10, 60, 40);
  //right pillow
  rect(80, 10, 60, 40);
  //bedspread
  rect(-5, 60, 160, 20);

  popMatrix();
}

void mousePressed()
{
  redraw();
}


