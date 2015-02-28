
void setup() {
  size(500, 500);
  background(255);
  smooth();
}
void draw() {
  noStroke();
  fill(mouseY,0,mouseX);
  rect(0, 0, 500, 50);
  rect(0, 100, 500, 5);
  rect(0, 110, 500, 5);
  rect(0, 120, 500, 5);
  rect(0, 300, 500, 50);
  rect(0, 400, 500, 35);
  rect(0, 470, 500, 20);
}
void mouseDragged() {
  stroke((abs(mouseX-pmouseX)), 50, (abs(mouseY-pmouseY)));
  strokeWeight(abs(mouseX-pmouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
void keyPressed() {
  background(255);
}


