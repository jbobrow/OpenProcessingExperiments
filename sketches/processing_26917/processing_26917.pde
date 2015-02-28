
float a = 0.0;
float inc = TWO_PI/25.0;
 
void setup()
{
  size(500, 500, P3D);
  smooth();
  strokeWeight(1);
  noFill();
  frameRate(10);
}
  
void draw()
{
  background(0);
    
  float rotationx = mouseX * (0.0015);
  float rotationy = mouseY * (0.0015);
  float rotationz = mouseY * mouseX * (0.00001);
  float wave = mouseX * (0.005);
 
    
  pushMatrix();
  translate(250, 250, -100);
    
  for(int instance = 1; instance <= 200; instance=instance+4)
  {
     
    rotateY(rotationy);
    rotateZ(rotationz);
     
    pushMatrix();
    for(int i=0; i<200; i=i+4) {
    {
      rotateX(rotationx);
      
        stroke(255);
        translate(0, 0, -10);
  point(i,1+sin(a)*wave);
  a = a + inc;
      }
    }
    popMatrix();
      
  }
    
  popMatrix();
   
 
     
}


