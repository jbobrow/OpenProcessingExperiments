
//Random Shapes Grace O. computer programming 1 Mods 14-15


void setup()
{
  size(500, 500, P3D);
  frameRate(1);
}
void draw()
{
  background(255);
  smooth();
  pointLight(255, 255, 255, 0, 0, 0);
  int numberShapes=0;
  while (numberShapes<101)
  {

    pushMatrix();
    int r=0;
    int g=0;
    int b=0;
    int x=int(random(0, 501));
    int y=int(random(0, 501));
    int z=int(random(-255, 0));
    translate(x, y, z);
    noStroke();
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 127);
    sphere(30);
    fill(0);
    popMatrix();
    numberShapes=numberShapes+1;
  }
}


