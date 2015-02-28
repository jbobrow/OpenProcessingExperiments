
//Brian C, Rotating Cube, CP 1 Mods 16/17

int r = 0;
float b = 0;
float x = 0;
void setup()
{
  size(450,450,P3D);
}
void draw()
{
  lights();
  background(0);
  fill(r,125-r,255-r);
  r = int(random(255));
  translate(100,100,0);
  sphere(50+b);
  translate(-100,-100,0);
  stroke(0);
  strokeWeight(5);
  line(100,0,0,100,100,0);
  strokeWeight(0);
  translate(200,200,0);
  rotateX(x);
  rotateY(x);
  rotateZ(x);
  fill(162,154,234);
  box(30);
  rotateX(-x);
  rotateY(-x);
  rotateZ(-x);
  translate(-100,-300,0);
  translate(200,300,0);
  rotateY(x);
  rotateZ(x);
  rotateX(x);
  fill(75,60,227);
  box(30);
  rotateX(-x);
  rotateY(-x);
  rotateZ(-x);
  translate(-200,-300,0);
  translate(300,300,0);
  rotateY(x);
  rotateZ(x);
  rotateX(x);
  fill(15,3,131);
  box(30);
  x = x + 0.01;
  translate(-300,-300,0);
  b = b + 0.3;
  frameRate(100);
}
