
void setup()
{
  size(600, 600);
  frameRate(15);
}
 
void draw()
{
  background(0);
  
   
   
  rotate(radians(1));
   
  for (float a=0; a<width; a+=5) {
    float rainB = random(5, width);
    float rainC= random (40, 15);
 
    stroke(50,100,2);
    strokeWeight(3);
    line ( rainB, a+rainC, rainB, a-rainC);
 
  }
  
}
