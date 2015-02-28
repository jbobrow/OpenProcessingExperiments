

void setup()
{
  size(500, 500, P3D);
  smooth();
  strokeWeight(1);
  noFill();
  frameRate(15);
}
  
void draw()
{
  background(0);
    
  float rotationx = mouseX * (0.0015);
  float rotationy = mouseY * (0.0015);
 
    
  pushMatrix();
  translate(250, 250, -100);
    
  for(int instance = 1; instance <= 100; instance=instance+4)
  {
     
    rotateY(rotationy);
     
    pushMatrix();
    for(int i=0; i<100; i=i+4) {
    {
      rotateX(rotationx);
      if (mousePressed)
      {
      stroke(255);
      translate(0, 0, -10);
      point(i,100);
      }
      else{
        stroke(255);
        translate(0, 0, -10);
  point(i,200);

}
      }
    }
    popMatrix();
      
  }
    
  popMatrix();
   
 
     
}


