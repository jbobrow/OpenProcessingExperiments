
void setup(){
  size(450,350);
  background(0);
  smooth();
  stroke(255,255,255,90);
  noFill();
}
void draw(){
  fill(0,8);
  rect(0,0,width,height);
  fill(mouseX,0,0);
  ellipse(mouseX,mouseY,mouseX+10,mouseY+10);
  rect(mouseX,mouseY,mouseX-10,mouseY-10);
  triangle(mouseX,mouseY,mouseX-10,0,0,0);
}


