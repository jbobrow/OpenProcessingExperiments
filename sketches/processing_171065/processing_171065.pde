
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (25);

  background (#57385c);
}

void draw ()
{
  fill (#57385c, 40);
  noStroke();
  rect (0, 0, width, height);

  stroke (#A75265);
  strokeWeight (2);
  fill (#ffedbc);
  ellipse (mouseX, mouseY, 50, 50);
}

void mousePressed ()
{
  background (#57385c);
}

