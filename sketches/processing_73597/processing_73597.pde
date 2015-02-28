
void setup()
{
  size(1000, 1000, P3D);
  noStroke();
  frameRate(20);
}
float a=0;
void draw()
{
  background(0);
  camera(2*mouseX, 2*mouseY, 100, 73, 54, 98, 0, 1, 0);
  pointLight(255, 255, 255, 2*mouseX, 2*mouseY, 200);
  translate(500, 500, 0);
  fill(237, 141, 67);
  rotateY(a);
  a=a+0.1;
  sphere(100);
  fill(0,0,255);
  translate(100, 0, 300);
  sphere(50);
  translate(0, 200, -10);
  fill(255, 0, 0);
  sphere(50);
  translate(0, -200, 10);
  translate(-100, 0, -300);
  translate(-500, -500, 0);
  fill(56, 76, 65);
  translate(73, 54, 98);
  box(60);
  textSize(60);
  fill(255);
  text("OH HAI", 500,500,500);
  fill(35,67,78);
  translate(744,326,462);
  box(65);
}
