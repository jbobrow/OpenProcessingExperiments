
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

  if (mouseX < width *0.25)
  {
    rect (0, 0, width *0.25, height);
  }
  else if ( mouseX < width*0.5)
  {
    rect (width *0.25, 0, width *0.25, height);
  }
  else if (mouseX < width*0.75)
  {
    rect (width*0.50, 0, width *0.25, height);
  }
  else
  {
    rect (width *0.75, 0, width *0.25, height);
  }
}

