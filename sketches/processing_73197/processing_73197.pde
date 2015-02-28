
//Wayland L, Rotating Cube, CP1 mods 16-17
float rt = 0.5;
void setup()
{
  size(700, 700, P3D);
}
void draw()
{
  background(150);
  strokeWeight(5);
  fill(252, 120, 5);
  translate(mouseX+100, mouseY);
  rotateX(rt);
  rotateY(rt);
  box(100);
  fill(10,255,12);
  translate(mouseX, mouseY);
  box(100);
  rotateX(-rt);
  rotateY(-rt);
  rt = rt + 0.01;
}
