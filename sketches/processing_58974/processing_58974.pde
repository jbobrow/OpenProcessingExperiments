

void setup() {
  size(700, 200);
  fill(126);
  background(15, 255, 205);
}

void draw() {
  if(mousePressed) {
    stroke(255,244,13);
  } else {
    stroke(255);
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
}

