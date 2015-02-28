
//Stephanie Wong DoublingShapes mods; 14-15
int x=1;
void setup()
{
  size(500,500,P3D);
  frameRate(1);
}
void draw()
{
  background(0);
    int y=1;
    while(y<=x)
    {
      pushMatrix();
      fill(int(random(150,240)), int(random(170,255)), int(random(190,210)));
      translate(int(random(500)), int(random(500)),0);
      box(int(random(20,60)));
      popMatrix();
      y++;
    }
    x=2*x;
    if(x>280)
    {
      x=1;
    }
}

