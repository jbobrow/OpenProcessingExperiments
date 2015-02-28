
//Aaron L., CP1, Mods 4-5, Rotating Cube 

float rot = 0;
void setup()
{
  size(300,300,P3D);
  stroke(255);
  fill(255,0,0);
}
void draw()
{
  background(255);
  translate(150,150,0);
  lights();
  camera(mouseX,mouseY,200,0,0,0,0,1,0);
  rotateX(rot*5);
  rot = rot + .05;
  rotateY(1);
  translate(0,100,0);
  lights();
  box(100);
}
