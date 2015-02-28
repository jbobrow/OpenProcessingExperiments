
void setup()
{
  size (500, 500);
  background (255,100,0);
  strokeWeight (3);
};

void draw ()
{
  mousePressed();
  keyPressed();
};

void mousePressed()
{
  if (mouseButton==RIGHT)
  {
    fill (0, 0, 255);
    stroke (0, 0, 255);
    rect (mouseX, mouseY, 10, 10);
    rect (500-mouseX, mouseY, 10, 10);
    rect (mouseX, 500-mouseY, 10, 10);
    rect (500-mouseX, 500-mouseY, 10, 10);
  };
  if (mouseButton==LEFT)
  {
    fill (0, 115, 255);
    stroke (0, 115, 255);
    rect (mouseX, mouseY, 10, 10);
    rect (500-mouseX, mouseY, 10, 10);
    rect (mouseX, 500-mouseY, 10, 10);
    rect (500-mouseX, 500-mouseY, 10, 10);
  };
};
void keyPressed()
{
  if (keyPressed==true&&key;=='a')
  {
    stroke (0, 190, 255);
    fill (0, 190, 255);
    rect (mouseX, mouseY, 10, 10);
    rect (500-mouseX, mouseY, 10, 10);
    rect (mouseX, 500-mouseY, 10, 10);
    rect (500-mouseX, 500-mouseY, 10, 10);
  };
  if (keyPressed==true&&key;=='s')
  {
    stroke (0, 255,255);
    fill (0, 255,255);
    rect (mouseX, mouseY, 10, 10);
    rect (500-mouseX, mouseY, 10, 10);
    rect (mouseX, 500-mouseY, 10, 10);
    rect (500-mouseX, 500-mouseY, 10, 10);
  };
};
