
//Jinhe Weber, Computer Programming 1, Block 7
float x = 0.04;
float y = 0.06;
float z = 0.02;
void setup()
{
  size(300,300,P3D);
  translate(150,150,-250);
  noStroke();
  
}
void draw()
{
  background(0);
  translate(150,150,0);
  lights();
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  fill(15,152,14);
  x = x + 0.03;
  y = y + 0.02;
  z = z + 0.0025;
  box(100);
}
