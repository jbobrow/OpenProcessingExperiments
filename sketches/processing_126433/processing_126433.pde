
void setup() {
  size(640, 360);
  noSmooth();
  fill(0);
  background(103, 1, 124);
}

void draw() {
  if (mousePressed) {
    stroke(0);
    fill(5,236,242);
    
  } else {
    stroke(0);
    fill(237,170,213);
}  
rect(mouseX-66, mouseY, mouseX+66, mouseY);
}


