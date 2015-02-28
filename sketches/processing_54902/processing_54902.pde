
void setup() {
  size(600, 300);
  fill(126);
  background(0);
}

void draw() {
  if(mousePressed) {
    stroke(222, 0, 232);
  } else {
    stroke(138, 13, 255);
  }
 line(mouseX-66, mouseY, mouseX+66, mouseY);
 line(mouseX, mouseY-66, mouseX, mouseY+66); 
}
