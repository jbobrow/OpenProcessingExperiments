
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (15);

  background (#57385c);
}

void draw ()
{
  if (mousePressed == true)
  {
    fill (#57385c, 30);
    noStroke();
    rect (0, 0, width, height);

    stroke (255);
    strokeWeight (2);
    line (mouseX, mouseY, pmouseX, pmouseY);

    noStroke();
    fill (255);
    ellipse (mouseX, mouseY, 20, 20);
  }
}

