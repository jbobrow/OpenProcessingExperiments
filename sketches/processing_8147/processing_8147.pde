
// Keith O'Hara <kohara@bard.edu>
// Feb 8 2010 Lecture - The "constrained" professor

PImage face;

void setup()
{
  size(500, 500);
  smooth();
  //http://www.openclipart.org/detail/734
  face = loadImage("face.png");
}

void draw()
{
  background(0);
  noStroke();
  fill(196);
  rect(100, 100, 300, 300);

  image(face, constrain(mouseX, 100, 250), constrain(mouseY, 100, 250), 150, 150);

  fill(0);
  for (int i = 0; i < 400; i = i + 50)
  {
    rect(i, 100, 20, 300);
  }
}


