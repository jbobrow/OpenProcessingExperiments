
float xPos = 0;
float yPos = 0;

void setup ()
{
  size (1000, 1000);
  background(255);
  noStroke();
  fill (0, 0, 0);
}

void draw ()
{   
  xPos = mouseX;
  yPos = mouseY;
  // click + drag for default brush
  if (mousePressed)
  {
    ellipse(xPos, yPos, 50, 50);
  }
  // q = large brush
  if (key == 'q' && keyPressed)
  {
    ellipse(xPos, yPos, 150, 150);
  }
  // w = med brush
  if (key == 'w' && keyPressed)
  {
    ellipse(xPos, yPos, 100, 100);
  }
  // e = small brush
  if (key == 'e' && keyPressed)
  {
    ellipse(xPos, yPos, 25, 25);
  }
  // r = red
  if (key == 'r' && keyPressed)
  {
    fill(255, 0, 0);
  }
  // g = green
  if (key == 'g' && keyPressed)
  {
    fill(0, 255, 0);
  }
  // b = blue
  if (key == 'b' && keyPressed)
  {
    fill(0, 0, 255);
  }
  // c = clear canvas
  if (key == 'c' && keyPressed)
  {
    background(255, 255, 255);
  }
  // y = yellow
  if (key == 'y' && keyPressed)
  {
    fill(255, 255, 0);
  }
  // v = violet
  if (key == 'v' && keyPressed)
  {
    fill(255, 0, 255);
  }
  // w = white
  if (key == 'w' && keyPressed)
  {
    fill(255, 255, 255);
  }
  // p = point
  if (key == 'p' && keyPressed)
  {
    ellipse(xPos, yPos, 5, 5);
  }
  // space = default color
  if (key == ' ' && keyPressed)
  {
    fill(0, 0, 0);
  }
  // s = square brush
  if (key == 's' && keyPressed)
  {
    rect(xPos, yPos, 15, 15);
  }
  // 1 = random color
  if (key == '1' && keyPressed)
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(xPos, yPos, 20, 20);
  }
}
