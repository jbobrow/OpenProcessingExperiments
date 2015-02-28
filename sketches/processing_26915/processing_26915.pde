
float a = 0.0;
float inc = TWO_PI/25.0;
 
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
    
  for(int instance = 1; instance <= 200; instance=instance+4)
  {
     
    rotateY(rotationy);
     
    pushMatrix();
    for(int i=0; i<200; i=i+4) {
    {
      rotateX(rotationx);
      if (mousePressed)
      {
      stroke(255);
      translate(0, 0, -10);
      point(i,(1+sin(a)*50.0-1+sin(a+0.1)*20.0));
  a = a + inc;;
      }
      else{
        stroke(255);
        translate(0, 0, -10);
  point(i,1+sin(a)*20.0);
  a = a + inc;
}
      }
    }
    popMatrix();
      
  }
    
  popMatrix();
   
 
     
}


