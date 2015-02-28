
PImage myImage;
int x = 0;
int y = 65;
int w = 20;
int h = 20;
boolean buttonpress = false;

void setup()
{
  size (400,400);
  myImage = loadImage ("paradise.jpg");
}

void draw ()
{
  background (0);
  line (0, 75, 400, 75);
  stroke (171, 255, 167);
  fill (247, 182, 236);
  rect (x, y, w, h);
}
  
void mouseDragged()
{
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed)
  {
   buttonpress = true;
  }
  x = x;
  if (buttonpress)
  {
   x = mouseX;
   image (myImage, 100, 100, mouseX, mouseY);
  }

}
void mousePressed()
{
    buttonpress = true;
  
}




