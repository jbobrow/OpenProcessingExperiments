
//Created by Andrew Huang

boolean aPressed, sPressed, dPressed, rPressed, V;

void keyPressed()
{
  if (key == 'a' || key == 'A') aPressed = true;
  if (key == 's' || key == 'S') sPressed = true;
  if (key == 'd' || key == 'D') dPressed = true;
  if (key == 'r' || key == 'R') rPressed = true;
}
void keyReleased()
{
  if (key == 'a' || key == 'A') aPressed = false;
  if (key == 's' || key == 'S') sPressed = false;
  if (key == 'd' || key == 'D') dPressed = false;
  if (key == 'r' || key == 'R') rPressed = false;
}

void mousePressed()
{
  V = true;
  if (mousePressed == true)
  {
    fill (random(20), random(20), random(255));
  }
}

void mouseReleased()
{
  V = false;
}


void setup ()
{
  background (0);
  size (800, 800);
  smooth();
  aPressed = dPressed = sPressed = false;
  fill (255);
  text ( "Press 'A' for ellipse", 50, 50, 100, 50);
  text ( "Press 'S' for rectangle", 50, 100, 100, 50);
  text ( "Press 'D' for traingle", 50, 150, 100, 50);
  text ( "Press 'R' to clear screen", 50, 200, 100, 50);
  text ( "Click mouse to change shade of purple and make ellipses appear", 50, 250, 100, 500);
}

void draw ()
{
  if (V)
  {
    stroke (255);
    fill (random(100, 150), random(20), random(200, 255));
    ellipse (mouseX+random(-50, 50), mouseY+random(-50, 50), random(50), random(50));
  }
  if (aPressed)
  {
    stroke(255);
    line (pmouseX, pmouseY, mouseX, mouseY);
    fill (150, 0, 255);
    ellipse (mouseX, mouseY, 40, 40);
  }
  if (sPressed)
  {
    stroke(255);
    line (pmouseX, pmouseY, mouseX, mouseY);
    fill (150, 0, 255);
    rect (mouseX - 15, mouseY - 15, 50, 50);
  }
  if (dPressed)
  {
    stroke(255);
    line (pmouseX, pmouseY, mouseX, mouseY);
    fill (150, 0, 255);
    triangle (mouseX-30, mouseY + 30, mouseX, mouseY - 30, mouseX + 30, mouseY + 30);
  }
  if (rPressed)
  {
    background (0);
  }
}


