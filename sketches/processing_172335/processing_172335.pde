
void setup(){
  size(500,500);
  background(0);
}
void draw(){
  background(mouseY);
  stroke(mouseX,mouseY,mouseX);
  strokeWeight(5);
  line(10,10,mouseX,mouseY);
  ellipse(mouseX,mouseY,mouseX,mouseY);
}
