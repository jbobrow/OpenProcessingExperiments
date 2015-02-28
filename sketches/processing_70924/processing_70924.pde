
void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(0);
  
  noFill();
  stroke(255);
  
  rect(20,20,200,150);
  
  //draw white square
  noStroke();
  fill(255);
  translate(100,100);
  rotate(mouseX/100.0);
  rect(0,0,200,150);
  resetMatrix();
  
  //draw red square
  translate(400,300);
  rotate(radians(45));
  fill(255,0,0);
  rect(0,0,100,100);
}
