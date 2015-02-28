
boolean[] colorOn = new boolean[2];
int boundThickness = 25;

void setup()
{
  size(500, 500);
  smooth();
  background(255);
}

void draw()
{
  stroke(127.5);
  strokeWeight(boundThickness);
  noFill();
  rect(boundThickness / 2 - 1, boundThickness / 2 - 1, width - boundThickness + 1, height - boundThickness + 1);
  if (colorOn[0] == true)
    stroke(0);
  if (colorOn[0] == false && colorOn[1] == false)
    noStroke();
  if (colorOn[1] == true)
    stroke(255);
  strokeWeight(dist(mouseX, mouseY, pmouseX, pmouseY));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    colorOn[0] = true;
    colorOn[1] = false;
  }
  if (mouseButton == CENTER)
  {
    colorOn[0] = false;
    colorOn[1] = false;
  }
  if (mouseButton == RIGHT)
  {
    colorOn[0] = false;
    colorOn[1] = true;
  }
}

void keyPressed()
{
  if (key == 'r')
    setup();
  if (key == 's')
    saveFrame();
}
