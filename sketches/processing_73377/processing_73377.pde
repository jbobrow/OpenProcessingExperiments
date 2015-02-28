
//Lisa L, CP1 16/17, Rotating Cube

float x = 0;
float y = 0;
void setup()
{
  size(400,400,P3D);
}
void draw()
{
  background(175,195,209);
  pointLight(0,215,255,100,75,200);
  translate(200,200,0);
  camera(2*mouseX+200,2*mouseY-200,100,0,0,0,0,1,0);
  rotateX(x);
  rotateY(y);
  box(150);
  x = x + .01;
  y = y + .01;
}
