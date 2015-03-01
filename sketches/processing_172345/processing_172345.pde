
void setup(){
  size(500,500);
  background(50);
}
void draw(){
  background(mouseY);
  stroke(160,25,255);
  strokeWeight(200);
  line(mouseY,mouseX,mouseY,mouseX);
  ellipse(mouseY,mouseY,mouseX,mouseX);
}

