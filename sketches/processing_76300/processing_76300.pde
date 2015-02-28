
int g=1;
void setup()
{
  size(600, 600, P3D);
  frameRate(1);
}
void draw()
{
  background(0);
  lights();
  int i=1;
  int direction=int(random(0, 2));
  if (direction==0)
  {
    while (i<=g)
    {
      pushMatrix();
      int colorx=int(random(0, 256));
      int colory=int(random(0, 256));
      int colorz=int(random(0, 256));
      noStroke();
      fill(colorx, colory, colorz);
      int amount=int(random(3, 30));
      int movex=int(random(0, 601));
      int movey=int(random(0, 601));
      int movez=int(random(-301, 1));
      translate(movex, movey, movez);
      sphere(amount);
      popMatrix();
      i++;
    }
  }
  else
  {
    while (i<=g)
    {
      pushMatrix();
      int colorx=int(random(0, 256));
      int colory=int(random(0, 256));
      int colorz=int(random(0, 256));
      stroke(colorx, colory, colorz);
      fill(colorx, colory, colorz);
      int amount=int(random(3, 30));
      int movex=int(random(0, 601));
      int movey=int(random(0, 601));
      int movez=int(random(-301, 1));
      translate(movex, movey, movez);
      box(amount);
      popMatrix();
      i++;
    }
  }
  g=g*2;
  if(g>1800)
  {
    g=1;
  }
}

