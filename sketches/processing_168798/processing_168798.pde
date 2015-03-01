
void setup()
{
  size(500,500);
  background(0);
  //noFill();
  fill(255);
  stroke(0,0,0);
  
  smooth();
}

void draw()
{
  fill(255);
  
  pushMatrix();
  translate(250,250);
  rotate(mouseX);
  rectMode(CENTER);
  rect(0,0,250,250);
  fill(0);
  rect(0,0,200,200);
  popMatrix();
  
  fill(255);
  pushMatrix();
  translate(150,150);
  map(mouseX,0,width,0,2*PI);
  translate(width/2,height/2);
  rotate(mouseX);
  rectMode(CENTER);
  rect(0,0,150,150);
  fill(0);
  rect(0,0,100,100);
  popMatrix();
  
  fill(255);
  pushMatrix();
  translate(-150,-150);
  map(mouseX,0,width,0,2*PI);
  translate(width/2,height/2);
  rotate(mouseX);
  rectMode(CENTER);
  rect(0,0,150,150);
  fill(0);
  rect(0,0,100,100);
  popMatrix();
  
  fill(255);
  pushMatrix();
  translate(150,-150);
  map(mouseX,0,width,0,2*PI);
  translate(width/2,height/2);
  rotate(mouseX);
  rectMode(CENTER);
  rect(0,0,150,150);
  fill(0);
  rect(0,0,100,100);
  popMatrix();
  
  fill(255);
  pushMatrix();
  translate(-150,150);
  map(mouseX,0,width,0,2*PI);
  translate(width/2,height/2);
  rotate(mouseX);
  rectMode(CENTER);
  rect(0,0,150,150);
  fill(0);
  rect(0,0,100,100);
  popMatrix();  
  
}
