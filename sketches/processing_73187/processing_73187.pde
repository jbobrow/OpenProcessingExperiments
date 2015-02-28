
//Dan-Tran Cong-Huyen, Rotating Cube, CP1 16/17
float x = 0.03;
float y = 0.05;
float z = 0.01;
void setup()
{
  size(400,400,P3D);
}
void draw()
{
  background(108,164,206);
  fill(49,203,158);
  noStroke();
  translate(200,200);
  pointLight(222,227,225,180,170,180);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  box(85);
  x = x + 0.02;
  y = y + 0.01;
  z = z + 0.005;
  if (z > 1)
  {
    z = z - 0.005;
  }
  if (z < 0)
  {
    z = z + 0.005;
  }
}
