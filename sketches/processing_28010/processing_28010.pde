
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
     
     stroke(random(255),255,255);
     strokeWeight (random(10));
     line (mouseX, mouseY, mouseX, mouseY);
     noStroke(); 
  }
  else
  strokeWeight(random(10))
 ;
  line (mouseX,mouseY, mouseX, mouseY);
  stroke(255, 0,255) ;
 
  
}
  
  

