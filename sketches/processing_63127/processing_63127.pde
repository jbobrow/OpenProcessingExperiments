
// pmouseX pmouseY

void setup()
{
  
  size(500,500);
  background(255);
}
void draw()
{
  //background(255);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  strokeWeight(speed);
  stroke(0,5);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

