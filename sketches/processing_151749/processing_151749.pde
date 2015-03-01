
void setup ()
{
  size (600, 200);
  smooth();
  frameRate (3);
}

void draw ()
{
  background (#57385c);

  fill (#ffedbc);
  stroke (#A75265);
  strokeWeight (3);
  if (frameCount % 3 == 0)
  {
    ellipse (width/2, height/2, 100, 100);
  }
  else if (frameCount % 3 == 1)
  {
    rect (width/2-50, height/2-50, 100, 100);
  }
  else{
    triangle (width/2-50, height/2+50, width/2+50, height/2+50, width/2, height/2-50);
  }
}

