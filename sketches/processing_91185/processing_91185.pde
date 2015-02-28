
int [] posPlusFill = new int [5];
int i;
int Y = 20;
int Yspeed = 1;
int r, g, b;
void setup ()
{
  size (200, 180);
}
void draw()
{
 
  background(255);
   Y = Y + Yspeed;
      if (Y > height - 20 || Y < 0)
      Yspeed = Yspeed * - 1;
  if ((mouseX > width-20 || mouseX < 20)||(mouseY > height - 20))
  {
   
    for (int i = 0; i < posPlusFill.length; i ++)
    {
      posPlusFill [i] = i*(width - 60)/4 + 20;
 r = (int) random (255/posPlusFill[i]*30);
 g = (int) random (255/posPlusFill [i]*60); 
 b = (int) random (255/posPlusFill [i])*12;
      fill( r,g,b);
      rect ( posPlusFill [i], Y, 20, 20);
      
      
    }
  }
}
