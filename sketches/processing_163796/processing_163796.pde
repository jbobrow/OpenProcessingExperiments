
void setup()
{
  size(600, 600);
  frameRate(16);
}
  
void draw()
{
  background(255,217,236);
   
    
    
  rotate(radians(6));
    
  for (float a=0; a<width; a+=5) {
    float rainB = random(5, width);
    float rainC= random (40, 15);
  
    stroke(0,247,186);
    strokeWeight(4);
    line ( rainB, a+rainC, rainB, a-rainC);
  
  }
   
}
