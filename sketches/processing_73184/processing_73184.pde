
//Simon L, Rotating Cube, CPU1 Mods 14-15
float x = 0;
float y = 0;
float z = 0;
float a = 0;
float b = 0;
float c = 0;
float i = random(0.015,0.005);
void setup()
{
  size(400,400,P3D);
}
void draw()
{
  background(0);
  fill(int(random(0,256)),int(random(0,256)),int(random(0,256)));
  stroke(int(random(0,256)),int(random(0,256)),int(random(0,256)));
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  translate(250,250,0);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  x = x - i;
  y = y - i;
  z = z + i;
  lights();
  sphere(50);
  translate(-250,-250,0);
  rotateX(a);
  rotateY(b);
  rotateZ(c);
  translate(250,250,0);
  rotateX(a);
  rotateY(b);
  rotateZ(c);
  sphere(50);
  a = a + i;
  b = b - i;
  c = c - i;
}
