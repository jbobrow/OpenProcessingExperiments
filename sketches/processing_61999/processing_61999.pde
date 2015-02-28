
void setup()
{
  size(400, 600);
  background (255, 255, 255) ;
  smooth () ;
  frameRate(15); 
}

void draw ()
{
  fill(255, 255, 255, 50) ; 
  rect(0,0,width, height);
  line(mouseX, mouseY, width, height); 
  
  fill(random(255), random(255), random(255)); 
  ellipse(mouseX, mouseY, frameCount, frameCount); 
  
}

