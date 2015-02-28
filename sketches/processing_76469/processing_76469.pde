
// Shela H. Doubling Shapes, CP1. mods 16-17
 
/* @pjs globalKeyEvents="true"; */
 
int x=1;

void setup()
{
  size(600,500,P3D);
  noStroke();
  frameRate(1);
   smooth();
}

void draw()
{
  int y=1;
  background(0);
  lights();
  while(y<=x)
  {
    pushMatrix();
  fill(random(255),random(255),random(255));
 translate(int(random(600)), int(random(500)),0);
sphere(int(random(20,50)));
popMatrix();
y++;
  }

   x=2*x;
    if(x>280)
    {
      x=1;
    }
    fill(255);
    textSize(55);
    text(x/2,50,80,40);
}
