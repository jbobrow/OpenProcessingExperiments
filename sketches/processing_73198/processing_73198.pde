
//Wayland L, Rotating Cube, CP1 mods 16-17
float rt = 0.5;
void setup()
{
  size(700, 700, P3D);
}
void draw()
{
  background(18,243,252);
  strokeWeight(3);
  stroke(255);
  pointLight(255,255,50,-100,-100,-100);
  translate(mouseX+100, mouseY);
  rotateX(rt);
  rotateY(rt);
  box(100);
  translate(mouseX-100, mouseY);
  box(100);
  rotateX(-rt);
  rotateY(-rt);
  translate(mouseX-200, mouseY);
  box(100);
  rotateX(-rt);
  rotateY(-rt);
  if(mousePressed)
  {
    rt= rt + 0.05;
  }
  rt = rt + 0.01;
}

