
void setup ()
{
  size (600, 200);
  smooth();
}

void draw ()
{
  background (#57385c);

  // rechteck ----------------------------
  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);

  if (mouseX >= width /2)
  {
    rect (width/2, 0, width/2, height);
  }
}

