
 
void setup()
{
  size(500, 500, P3D);
  smooth();
  strokeWeight(1);
  stroke(255, 255, 255, 150);
  noFill();
}
 
void draw()
{
  background(0);
   
  float rotationX = mouseX * (0.00016);
  float rotationY = mouseY * (0.00016);
   
  pushMatrix();
  translate(250, 250, -100);
   
  for(int instance = 1; instance <= 100; instance++)
  {
    rotateY(rotationY);
    
 
    pushMatrix();
    for (int j = 1; j <= 100; j++)
    {
      rotateX(rotationX);
      point(0, 200);
    }
    popMatrix();
     
  }
   
  popMatrix();
}


