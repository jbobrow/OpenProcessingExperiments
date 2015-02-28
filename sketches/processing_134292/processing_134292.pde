
void setup ()
{
  size (500,500);
  background (255);
}

void draw ()
{
  colorMode (HSB, 500);
        int x1 = round (mouseX / 50); 
        int posX1 = (x1*50);
        int y1 = round (mouseY / 50);
        int posY1 = (y1*50);
       noStroke (); 
       fill (mouseX, mouseY, 500, 50); 
       rect (posX1, posY1, 30, 30);

      if (mousePressed && (mouseButton == LEFT))
    {
      background (mouseX, mouseY, 500);
      }
    }
void keyPressed ()
{
  if (keyPressed == true )
  {
  if (key == 'i')
  {
    saveFrame ("colpick_####.jpg");
      }
}
}


