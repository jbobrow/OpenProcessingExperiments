
void setup() {
  size(600,600);
  background(0);
}
void draw(){
  smooth();
  fill(255);
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX,mouseY,pmouseX,pmouseY);
  
  stroke(mouseX,mouseY,mouseX);
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX,mouseY,pmouseX,pmouseY);
}

