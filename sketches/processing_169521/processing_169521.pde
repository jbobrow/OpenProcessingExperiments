
void setup() {
  size(500, 500);
  background(#95F1FA);
}

void draw() { 
  if (keyPressed == true) {
    background(#95F1FA);
  } else {
    strokeWeight(0); 
    fill(#95f1fa, 0); 
    stroke(0,0,0);
    bezier(0, 250, mouseX, mouseY, mouseX + 10, mouseY + 10, 500, 250);
    stroke(#ffffff);
    bezier(0, 250, mouseX, mouseY, mouseY + 10, mouseX + 10, 500, 250);
  }
}


