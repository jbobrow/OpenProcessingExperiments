
void setup()
{
  size(600, 600);
  background(255);
}


void draw()
{
  pushMatrix();
  translate(height/2, width/2);
  rotate(mouseX*2.0);
  rectMode(CENTER);
  noFill();
  stroke(153, 0, 0,100);
  rect(mouseX, 0, 130, 130);
  popMatrix();
  resetMatrix();
  
  
  pushMatrix();
  translate(height/2, width/2);
  rotate(mouseY*2.0);
  rectMode(CENTER);
  noFill();
  stroke(0, 0, 0, 100);
  rect(mouseX, 0, 130, 130);
  popMatrix();
  resetMatrix();


}



