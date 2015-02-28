
void setup() {
  size(300, 150);
  smooth();
  noCursor();
}

void draw() {
  background(170, 195, 255);  // sky blue
  noStroke();
  
  // draw the ground
  fill(21, 188, 13); // grass green
  bezier(0, 75, 75, 0, 275, 50, 300, 75);
  rectMode(CORNERS);
  rect(0, 75, 300, 150);
  
  // draw background trees
  fill(106, 71, 18); // brown for tree trunks
  rectMode(CORNER);
  rect(15, 0, 7, 100);
  rect(35, 0, 7, 90);
  rect(112, 0, 7, 103);
  rect(200, 0, 6, 85);
  rect(220, 0, 5, 88);
  rect(286, 0, 5, 90);
  
  // draw man
  stroke(0);
  fill(255);
  ellipse(mouseX, 80, 15, 15); // head
  line(mouseX, 88, mouseX, 100); // body
  line(mouseX, 90, mouseX - 8, 98); // left arm
  line(mouseX, 90, mouseX + 8, 98); // right arm
  line(mouseX, 100, mouseX - 8, 108); // left leg
  line(mouseX, 100, mouseX + 8, 108); // right leg
  
  // draw foreground trees
  noStroke();
  fill(106, 71, 18); // brown for tree trunks
  rect(80, 0, 8, 115);
  rect(155, 0, 13, 140);
  rect(220, 0, 14, 135);
}

