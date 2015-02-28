
// pmouseX pmouseY

void setup()
{
  
  size(300,300);
  background(255);
}
void draw()
{
  background(255);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  
//  strokeWeight(speed);
//  stroke(0,5);
//  line(mouseX, mouseY, pmouseX, pmouseY);


fill(0);
ellipse(width/2, height/2, 10+speed, 10+speed);
}


