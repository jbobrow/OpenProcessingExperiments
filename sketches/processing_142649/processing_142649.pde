
void setup()
{
  size(500, 500);
  background(255);
  
}

void draw()
{
  //background(225);
 
  
  pushMatrix();
  translate(width/2, height/2);
  stroke(238, 130, 238, 60);
  noFill();
  rotate(mouseX/10.0);
  ellipse(0, 0, 300, 50);
  popMatrix();
  resetMatrix();
  
 pushMatrix();
  translate(mouseX, mouseY);
  stroke(0, 255, 127, 70);
  fill(0, 255, 127, 20);
  rotate(mouseX/5.0);
  rect(0, 0, 5, 100);
  popMatrix();
  
 
}  
