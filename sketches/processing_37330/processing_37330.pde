
void setup ()
{
  size (800, 800);
  smooth();
  background (255, 255, 255);
}


//Click to start and change color

void mouseClicked()
{
  fill (random (0, 255), random (0, 255), random (0, 255));
}

//Move the mouse to draw

void draw ()
{
  noStroke();
  //fill (random (0, 255), random (0, 255), random (0, 255));
  ellipse (mouseX, mouseY, random (-100,100), random (-100, 100));
}



