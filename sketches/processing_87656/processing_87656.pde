
void setup() {
  size(640, 480);
  smooth();
  noStroke();
}

void draw() {
  background(255);

  stroke(0xFF4BB8FF);
  line(0, mouseY, width, 0);

  stroke(0xFFB94BFF);
  line(width, mouseY, 0, height/2);

  stroke(0xFF86FF4B);
  line(mouseX, height, width/2, 0);
}



