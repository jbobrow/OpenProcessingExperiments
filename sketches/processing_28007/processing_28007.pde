
void setup()  
{
  size(500, 500);
  smooth();
  background(0);
  colorMode(HSB);
}

void draw()
{
  
  if (mousePressed)
  {
     
     stroke(255*(mouseX/ (float)width), 255, 255);
     strokeWeight (1);
     line (mouseX, mouseY, mouseX, mouseY);
     noStroke(); 
  }
  else
  
  line (mouseX,mouseY, mouseX, mouseY);
  stroke(255, 0,255) ;
 
  
}
  
  

