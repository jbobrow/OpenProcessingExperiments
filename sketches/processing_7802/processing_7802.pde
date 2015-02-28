
// Keith O'Hara <kohara@bard.edu>
// Feb 22 2010 Lecture

void setup()
{
  size(400, 400);
  smooth();
}

void draw()
{
  background(96);
  translate(mouseX, mouseY);
  rotate(radians(mouseY));
  rect(0, 0, 20, 200);
}

