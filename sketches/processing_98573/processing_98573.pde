
void setup()
{ 
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
} 

void draw() 
{  
  fill(random(255), random(255), random(255) );
  quad(mouseX-10, mouseY-10, mouseX-10, mouseY+10, 
        mouseX+10, mouseY-10, mouseX+10, mouseY+10 );
                            
}
