
void setup() 
{
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  background(255); 
  fill(255, 204);
  stroke(0);
  strokeWeight(10);
  rect(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(255, 204);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
  rect(mouseX, height, mouseY/2+5, mouseY/2+5);
  rect(inverseX, height, (inverseY/2)+5, (inverseY/2)+5);
  rect(mouseX, height/100, mouseY/2+5, mouseY/2+5);
  rect(inverseX, height/100, (inverseY/2)+5, (inverseY/2)+5);
}
