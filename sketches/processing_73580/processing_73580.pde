
//Jimmy C; Block 6; CP1

float xx=0;
int depth=1700;

void setup()
{
  size(500, 500, P3D);
  background (0);
  fill(255);
  stroke(255);
  smooth();
  camera(0, -200, depth, 0, 0, 0, 0, 1, 0);
  frameRate(200);
}

void draw()
{
  pointLight(0, 255, 255, 0, -200, 500);
  pointLight(255, 0, 0, 0, 200, 500);
  background (0);
  rotateY(xx);
  xx=xx+.01;
  rotateX(xx);
  xx=xx+.01;
  translate(200, 200, 0);
  xx=xx-.01;
  rotateX(xx);
  xx=xx-.01;
  box(100);
  rotateY(xx);
  xx=xx+.01;
  rotateX(xx);
  xx=xx+.01;
  translate(-200, -200, 0);
  translate(-200, -200, 0);
  xx=xx-.01;
  rotateX(xx);
  xx=xx-.01;
  box(100);
  rotateY(xx);
  xx=xx+.01;
  rotateX(xx);
  xx=xx+.01;
  translate(200, 200, 0);
  translate(-200, 200, 0);
  xx=xx-.01;
  rotateX(xx);
  xx=xx-.01;
  box(100);
  rotateY(xx);
  xx=xx+.01;
  rotateX(xx);
  xx=xx+.01;
  translate(200, -200, 0);
  translate(200, -200, 0);
  rotateY(xx);
  xx=xx+.01;
  rotateX(xx);
  xx=xx+.01;
  box(100);
  xx=xx-.01;
  rotateX(xx);
  xx=xx-.01;
}
