
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);
} 

void draw() 
{  
  stroke(random(255), random(255), random(255) );
  line(mouseX-10, mouseY-10, mouseX+10, mouseY+10);
  line(mouseX-10, mouseY+10, mouseX+10, mouseY-10);
  line(mouseX-15, mouseY, mouseX+15, mouseY);
                            
}
