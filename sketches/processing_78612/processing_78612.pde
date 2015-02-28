
void setup()
{
 size(400,400,P3D); 
 //smooth();
  
}

void draw()
{
  background(0);
  
  pushMatrix();
  
  translate(width/2, height/2, 50);
  rotateY(mouseY * 1.25);
  rotateX(mouseX * -0.4);
  noStroke();
  lights();
  fill(200,0,0);
  sphere(80);
  popMatrix();

  
}
