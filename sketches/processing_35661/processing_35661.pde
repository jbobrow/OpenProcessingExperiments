
void setup(){
size(300,300);
background(0);
}
int x=width;
void draw(){
  noFill();
  stroke(mouseX,mouseY,255);
  strokeWeight(mouseX);
  rectMode(CENTER);
  rect(mouseX,mouseY,mouseX,mouseY);
  x = mouseX;
  ellipseMode(CENTER);
  stroke(mouseX-mouseY);
  ellipse(mouseX,mouseY,1,1);
  ellipse(mouseX,mouseY,mouseX-mouseY,mouseY-mouseX);
}



