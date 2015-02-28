
//Andy M, CP 1, 14/15

float a = 0;
float n = 0;
float d = 0;
void setup()
{
  size(300, 300, P3D);
  smooth();
  strokeWeight(8);
  fill(255,0,0);
}
void draw()
{
  translate(mouseX, mouseY,10);
  background(0,255,0);
  pointLight(255,255,255,255,255,255);
  rotateX(a);
  rotateY(n);
  rotateZ(d);
  sphere(58);
  box(80);
  frameRate(16);
  a = a + int(random(3,28));
  n = n + int(random(3,28));
  d = d + int(random(3,28));
}
