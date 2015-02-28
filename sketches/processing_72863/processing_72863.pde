
int a = 250;
int b = 250;
int d = 25;
float cube = .01;
float x = 0;
float c = 1;
int xcube = 350;
int ycube = 350;
int zcube = 25;
int xcub = 350;
int ycub = 350;
int zcub = 25;
int xcu = 350;
int ycu = 350;
int zcu = 25;
void setup()

{
  size(700, 700, P3D);
  background(0);
}
void draw()
{

  lights();
  stroke(0);
  fill(0, 255, 255);
  sphere(10);

  fill(222, 27, 27, 150);
  translate(xcube, ycube, zcube);
  xcube = xcube+int(random(-15, 16));
  ycube = ycube+int(random(-15, 16));
  zcube = zcube+int(random(-15, 16));
  //  rotateX (x);
  //  rotateY (x);
  //  x = x+0.05;
  box(10, 10, 10);

  lights();
  translate(-xcube, -ycube, -zcube);
  translate(xcub, ycub, zcub);


  xcub = xcub+int(random(-15, 16));
  ycub = ycub+int(random(-15, 16));
  zcub = zcub+int(random(-15, 16));
  //  rotateX (x);
  //  rotateY (x);
  //  x = x+0.05;
  fill(31, 104, 170);
  box(10, 10, 10);

  translate(-xcub, -ycub, -zcub);
  translate(xcu, ycu, zcu);


  xcu = xcu+int(random(-15, 16));
  ycu = ycu+int(random(-15, 16));
  zcu = zcu+int(random(-15, 16));

  fill(147, 45, 211);
  box(10, 10, 10);
}
void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    draw();
  }
}







