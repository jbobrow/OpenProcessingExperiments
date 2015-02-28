
float counter = 0;
 
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  background(#555454);
 
  translate(height/2,width/2);
 
  pushMatrix();
  translate(-50, sin(counter)*300);
  noStroke();
  fill(#FFDC4D);
  triangle(30, 75, 58, 40, 86, 75);
  popMatrix();
  
  pushMatrix();
  fill(0);
  translate(-200, sin(counter)*500);
  noStroke();
  triangle(30, 75, 58, 40, 86, 75);
  popMatrix();
  
  
    pushMatrix();
  translate(100, sin(counter)*500);
  noStroke();
  triangle(30, 75, 58, 40, 86, 75);
  popMatrix();
 

  counter += 0.01;
  
  
}
