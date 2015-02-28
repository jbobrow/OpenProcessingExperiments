
void setup(){
  size(400,400);
  background(0);
}

void draw(){
  stroke(mouseX,mouseY,mouseY);
  strokeWeight(3);
  noFill();
  ellipse(mouseY,mouseX,mouseX,mouseX);  

}
