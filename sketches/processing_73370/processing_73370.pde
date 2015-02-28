
//Rotating Cube, Aidan F, Computer Programming 1

void setup()
{
  size(800, 800, P3D);
}
void draw()
{
  background(192, 232, 226);
  lights();
  pointLight(0, 138, 255, mouseX, mouseY, 500);
  pointLight(0, 138, 255, 0, 0, 500);
  translate(400, 400, 0);
  fill(0, 138, 255);
  rotateX(mouseX/100.0);
  rotateY(mouseY/100.0);
  box(300);
}
