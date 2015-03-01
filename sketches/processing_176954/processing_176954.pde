

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
  stroke(255,255,255);
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
  rect(mouseX, height/200, mouseY/8+100, mouseY/8+100);
  rect(inverseX, height/200, (inverseY/8)+100, (inverseY/8)+100);
  rect(mouseX, height/400, mouseY/2+200, mouseY/2+200);
  rect(inverseX, height/400, (inverseY/2)+200, (inverseY/2)+200);
  rect(mouseX/2+10, height, mouseY, mouseY);
  fill(255, 204);
  rect(mouseX/8+100, height/200, mouseY, mouseY);
  rect(mouseX, height/2, mouseY/2+200, mouseY/2+200);
  rect(inverseX, height/2, (inverseY/4)+400, (inverseY/2)+200);
  
  
}  



