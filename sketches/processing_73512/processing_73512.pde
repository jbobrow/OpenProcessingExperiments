
//Julie O, CompProg1 Mods 4/5, Rotating Cube

float x = -.6;
float y = .75;
float z = .001;
int r = 0;
int g = 0;
int b = 0;

void setup()
{
  size(500,500,P3D);
  smooth();
  //frameRate(190);
}

void draw()
{
  background(r,g,b);
  r = r + 2;
  if(r>111)
  {
    r = 35;
  }
  g = g + 2;
  if(g>180);
  {
    g = 100;
  }
  b = b + 2;
  if(b>215);
  {
    b = 125;
  }
  translate(225,225,0);
  fill(147,112,219,245);
  rotateY(y); //central cube
  y = y + (-.025);
  rotateX(x);
  x = x + .025;
  rotateZ(z);
  z = z + .0025;
  pointLight(205,205,205,190,160,120);
  box(90);
  translate(-225,-225,0); //upper left sphere
  translate(145,145,0);
  sphere(50);
  translate(-145,-145,0); //lower right sphere
  translate(305,305,0);
  sphere(50);
  translate(-305,-305,0); //upper left cube
  translate(0,0,0);
  box(40);
  translate(-10,-10,0); //lower right cube
  translate(430,430,0);
  box(40);
}
