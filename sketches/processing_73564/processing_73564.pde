
//Hayley G, CP1, 14/15

float x, y,z;

void setup()
{
  size (400,400,P3D);
  noStroke();
  x = 0.1;
  y = 0.1;
  z = 0.1;
}

void draw ()
{
  background(0);
  translate(200,200);
  pointLight(187,238,255,200,200,400);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  x = x + .03;
  y = y + .03;
  z = z + 0.01;
  sphere(70);
  x = x - 0.03;
  y = y - 0.03;
  z = z - 0.01;
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  x = x + 0.03;
  y = y + 0.03;
  z = z + 0.01;

  translate(50,-100);
  pointLight(131,111,255,-200,-200,400);
  sphere(30);
  x = x - 0.01;
  y = y - 0.01;
  z = z - 0.01;
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  x = x + 0.01;
  y = y + 0.01;
  z = z + 0.01;
  translate(-50,100);
  sphere(30); 
}
