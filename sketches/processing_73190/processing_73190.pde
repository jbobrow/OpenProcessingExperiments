
//Jarvis Law,Rotating Cube,CP1 mod 16-17
float a=0.3;
float b=0.2;
void setup()
{
  size(500,500,P3D);
  background(0);
  noStroke();
  smooth();
}
void draw()
{
  translate(250,250,0);
  background(0);
  fill(19,240,219,90);
  pointLight(19,240,219,-135,-110,205);
  rotateX(a);
  rotateY(b);
  lights();
  box(100);
  frameRate(10);
  a=a+.2;
  b=b-.2;
  fill(250,255,5,45);
  box(200);
  rotateX(-a);
  rotateY(-b);
  fill(135,0,255,70);
  sphere(210);
}
