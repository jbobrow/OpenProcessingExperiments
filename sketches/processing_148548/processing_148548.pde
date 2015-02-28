
// First and only once:
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  frameRate(10);
}
 
// Then, repeat:
void draw()
{ 
  strokeWeight(1);
  stroke(0, 0, 0, 255);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  fill(255, 255, 255, 255);
  ellipse(mouseX, mouseY, 20, 20);
  
}

