
void setup() 
{
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  background(0); 
  fill(255, 204);
  stroke(0);
  strokeWeight(10);
  fill(255, 204);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  ellipse(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
  ellipse(inverseY, height/2, (inverseY/2)+10, (inverseY/2)+10);
  ellipse(inverseX/2, height/2, (inverseY/2)+10, (inverseY/2)+10);
  ellipse(mouseX, height/2, mouseY/2+10, mouseX/2+10);
 
}
