
float rot=.1;
void setup()
{
  size(300,300,P3D);
}
void draw()
{
  fill(random (255), random (255), random (255));
  camera(-500,300,1000,300,300,0,0,1,0);
  background(0);
  translate(0,0,-200);
  rotateX(rot);
  rotateY(rot);
  translate(100,100,0);
  box(200);
  rot=rot+.1;
}
