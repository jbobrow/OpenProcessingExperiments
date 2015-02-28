
void setup()
{
  background(255,0,0);
  size(600,400, P3D);
  
}

void draw()

{
  
 background(200);
  stroke(200, 50);
  translate(mouseX, mouseY);
  rotateX(mouseY * 0.05);
  rotateY(mouseX * 0.05);
  fill(mouseX * 2, 0, 20);
  sphereDetail(mouseX / 15);
  sphere(80); 
  
  
}
