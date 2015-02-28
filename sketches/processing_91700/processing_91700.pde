
int [] pos = {40, 70, 100, 130, 160};
int Y = 100;
int speedY = 3;



void setup ()
{
  size (200, 200);
}



void draw()
{
  background(255,0,0);
   if ((mouseX > width-20 || mouseX < 20)||(mouseY > height - 20))
   {
    for (int i = 0; i < pos.length; i ++)
    {
     fill(255,255,0);
     ellipse (pos[i], Y, 20, 20);
    }
  }
  
  Y = Y + speedY;
  if (Y > height - 20 || Y < 0)
  speedY = speedY * - 1;
}
