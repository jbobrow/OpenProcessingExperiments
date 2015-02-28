
//Eugene Liang, RotatingCube, CP1, Mods 16-17


void setup()
{
  size (600,600,P3D);
  
}

float X = .05;
float Y = .05;
int x = 0;
int y = 0;
float o = 0;
float p = 0;

void draw()
{
  frameRate(100);
  background(197);
  translate(300,300);
  rotateX(X);
  rotateY(Y);
  X = X + .1 + o;
  Y = Y + 0.1 + p;
  fill(0);
  box(100);
  fill(90,185,255);
  sphere(65);
  translate(-300,-300);
  noStroke();
  translate(300,175);
  sphere(15);
  translate(-300,-75);
  translate(250,400);
  sphere(15);
  translate(-250,-400);
  translate(150,280);
  sphere(20);
  translate(-150,-280);
  translate(320,320);
  sphere(10);
  translate(-320,-320);
  translate(400,250);
  sphere(17);
  translate(-400,-250);
  translate(400,300);
  rotateX (X);
  X = X - .1;
  sphere(20);
  if(mousePressed == true)
  {
    o = o + 0.0005;
    p = p + 0.0005;
  }
}
