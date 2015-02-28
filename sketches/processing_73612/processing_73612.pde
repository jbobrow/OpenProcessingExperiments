
// Lucky Wen, Rotating Cube, CP1 mods 16-17

float x=.5;
float y=.5;
float z=.5;
float xo=.6;
float yo=.6;
float zo=.6;
float xp=.5;
float yp=.5;
float zp=.5;

void setup()
{
  size (400, 400, P3D);
  strokeWeight(7);
}

void draw()
{
  mostly();
}
void mostly()
{

  translate(200, 200, 0);
  background(197);


  pointLight(255, 255, 255, -235, -240, 275);
  rotateX(x);
  rotateY(y);
  rotateZ(-z);


  sphere(60);


  box(100);
  x=x+.02;
  y=y+.02;
  rotateX(-x);

  rotateY(-y);
  rotateZ(z);


  translate(-200, -200, 0);


  //next one

  translate(300, 200, 0);
  rotateX(xo);
  rotateY(yo);
  rotateZ(zo);
  box(40);
  rotateZ(-z);
  rotateY(-y);
  rotateX(-x);


  translate(-300, -200, 0);

  translate(-200, -300, 0);
  rotateX(xo);
  rotateY(yo);
  rotateZ(zo);
  box(40);

  rotateX(-x);
  rotateY(-y);
  rotateZ(-z);
  translate(200, 300, 0);


  //next one
  translate(200, 175, 0);
  rotateX(xp);


  sphere(10);

  rotate(-xp);
  translate(-200, -175, 0);
  //
  translate(200, 150, 20);
  sphere(10);
  translate(-200, -150, -20);
  //
  translate(-200, -200, 0);
  box(50);
}


