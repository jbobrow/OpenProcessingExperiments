
float counter = 0;
 
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  background(170, 10, 90);
   
  translate(0, height/2);
  
   
  for (int i=0; i<10; i++)
  {
    pushMatrix();
    translate(i*45, sin(counter+i)*15);
    
    
    fill(RGB, 80, 88, 83);
    ellipse(0, 0, 40, 40);
    popMatrix();
     
    counter += 0.001;
  }
}
