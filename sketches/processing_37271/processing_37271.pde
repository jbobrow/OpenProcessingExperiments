
int y;
int x;
int s;
boolean rPressed, gPressed, bPressed, aPressed;

void setup()
{
  size(700, 500);
  noStroke();
  smooth();
  rPressed=gPressed=bPressed=aPressed=false;
  background(255);
}

void draw()
{
  fill(0);
  if (rPressed) fill(255, 0, 0);
  if (gPressed) fill(0, 255, 0);
  if (bPressed) fill(0, 0, 255);
  if (aPressed)
  {
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  ellipse(mouseX, mouseY, 20, 20);
}

void keyPressed()
{
  if (key == 'r')
  {
    rPressed = true;
    gPressed = false;
    bPressed = false;
    aPressed = false;
  }

  if (key == 'g') {
    gPressed = true;
    rPressed = false;
    bPressed = false;
    aPressed = false;
  }
  if (key == 'b') {
    bPressed = true;
    rPressed = false;
    gPressed = false;
    aPressed = false;
  }
  if (key == 'a')
  {
    aPressed = true;
    rPressed = false;
    gPressed = false;
    bPressed = false;
  }
}
void mousePressed()
{
  if (mousePressed == true)
  {
    background(255);
    
  }
}


