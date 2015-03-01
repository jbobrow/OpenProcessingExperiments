
void setup()
{
  size(800, 400, P3D);

}

void draw()
{
  background(255);
  lights(); //The lights() method reveals their imagined dimension. 
  
  pushMatrix(); // kubus
  stroke(255);
  translate(250, height/2, 0);
  rotateY(mouseX*0.01);
  rotateX(mouseY*0.01);
  fill(0, mouseX*0.5, mouseY*0.5);
  box(100);
  popMatrix();
  
  pushMatrix(); // bol
  stroke(255);
  translate(550, height*0.5, 0);
  rotateX(mouseY*0.01);
  rotateY(mouseX*0.01);
  fill(mouseX*0.5, 0, mouseY*0.5);
  sphereDetail(mouseX/50);
  sphere(100);
  popMatrix();
}


