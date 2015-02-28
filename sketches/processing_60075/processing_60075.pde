
void setup() {
  size(500,500);
  background(255);
}

void draw() {
  smooth();
 /* fill(0);
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX,mouseY,pmouseX,pmouseY);*/
  
  stroke(mouseX,mouseY,mouseX);
  strokeWeight(abs(mouseX-pmouseX));
  line(mouseX,mouseY,pmouseX,pmouseY);
}

