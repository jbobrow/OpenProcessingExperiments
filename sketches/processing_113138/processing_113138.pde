
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  if (mousePressed) {
    fill(0, 10);
  } 
  else {
    noStroke();
    fill(200, 0, 55, 10);
  }
  ellipse(mouseX, mouseY, 80, 80);
  
}



