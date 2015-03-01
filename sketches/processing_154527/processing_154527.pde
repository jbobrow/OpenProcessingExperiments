

float noiseScale = 80.0;


void setup() {
  size(600, 200);
  smooth();

  frameRate (30);
}


void draw()
{
  fill(#57385c, 120);
  noStroke();
  rect (0, 0, width, height);
  fill (#ffedbc);

  if (mousePressed)
  {
    noiseScale = map (mouseX, 0, width, 1, 300);
  }



  int x = 0;
  while (x < width)
  {
    int y = 0;
    while (y < height)
    {
      float transparenz = noise (x / noiseScale, y / noiseScale)*255;
       fill (#ffedbc, transparenz);

      rect (x, y, 6, 6);
      y = y + 6;
    }
    x = x + 6;
  }
}

