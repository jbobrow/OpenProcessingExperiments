
void setup() {
  size(500, 500);
  smooth();
  background(0, 50);
}

void draw() {
  if (mousePressed) {
    fill(192, 0, 111,50);
  } 
  else {
    stroke(255);
    strokeWeight(0.5);
    fill(255, 50);
  }
  rect(mouseX, mouseY, 40, 40);
}

void keyPressed() {
  saveFrame("button.jpg");
}


