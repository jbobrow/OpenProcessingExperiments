
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (25);

  background (#57385c);
}

void draw ()
{
  background (#57385c);
  stroke (255);
  strokeWeight (2);
  noFill();
  ellipse (300, 100, 120, 120);
}

void mousePressed ()
{
  background (#57385c);
  fill (#A75265);
  noStroke();
  ellipse (300, 100, 120, 120);
}

void keyPressed ()
{
  background (#57385c);
  fill (#A75265);
  noStroke();
  rect (240, 40, 120, 120);
}

