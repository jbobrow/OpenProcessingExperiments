
void setup() {
size(500, 500);
noStroke();
background(255);
}

void draw() { } // Empty draw() keeps the program running

void mousePressed() {
  fill(0,130,200, 102);
  rect(mouseX, mouseY, 23, 500);
}

void mouseReleased() {
  fill(200,100,70,100);
  rect(mouseX, mouseY, 500, 23);
}


