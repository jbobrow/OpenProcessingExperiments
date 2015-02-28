
void setup() {
  size(900, 900);
  background(255);
  smooth();
  stroke(200,100,0);
}

void draw() {
  
  //strokeWeight(abs(pmouseX - mouseX));
  strokeWeight(10);
  line(pmouseX, pmouseY, mouseX, mouseY);
}
