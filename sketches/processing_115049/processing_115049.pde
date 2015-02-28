
void setup() {
  size (500, 500); 
  frameRate(50);
  background(0, 175, 175);
  smooth();
}
void draw() {
  stroke(255, 255, 255, 50);
  strokeWeight(abs(mouseX-pmouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
void mousePressed() {
  stroke(100,100,100,100);
  strokeWeight(2);
  noFill();
  rectMode(CENTER);
  rect(mouseX, mouseY, (abs(500-pmouseX))/2, (abs(100-pmouseY))/2);
}

void keyPressed() {
  background(0, 175, 175);
}



