
void setup(){
  size(400,400);
  smooth();
}
void draw(){
  frameRate(100);
  background(35);
  fill(mouseX,mouseY,mouseX/1.5);
  noStroke();
  ellipse(300,mouseX,mouseX/2,mouseX/2);
  noFill();
  stroke(mouseX,mouseY,mouseY/2);
  rectMode(CORNER);
  rect(mouseX,200,100,100);
  noStroke();
  fill(#FFCCCC);
  ellipse(400-mouseX,400-mouseY,75,75);
}
