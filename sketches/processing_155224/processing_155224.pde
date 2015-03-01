


void setup ()
{
  size (600, 600);
  smooth();
}

void draw ()
{
  background (#57385c);
  fill (#ffedbc);
  strokeWeight (3);

  // yellow

  float x = map (mouseX, 0, width, 0, 100);
  float y = map (mouseY, 0, height, 0, 200);

  translate (width / 2, height/2);

  rotate ((frameCount / 100.0 ) % TWO_PI);

  stroke (#ffedbc);
  int i = 0;
  float a = TWO_PI / 20;
  while (i < 20)
  {
    rotate (a);
    line (x, 0, 0, 200);
    i = i +1;
  }

  // red
  stroke (#A75265);
  translate (width / 3, 0);
  rotate ((frameCount / 100.0 ) % TWO_PI);

  i = 0;
  a = TWO_PI / 40;
  while (i < 40)
  {
    rotate (a);
    line (x, y, 0, 200);
    i = i +1;
  }
}

