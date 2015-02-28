
void setup() {
  size(400, 400);
}

void draw() {
  fill(250, 5);
  rect(0, 0, width, height);
  stroke(106, 103, 103);
  strokeWeight(1);
  fill(106, 103, 103);
  line(200, 200, mouseX, mouseY);
  line(100, 100, mouseX, mouseY);
  line(300, 100, mouseX, mouseY);
  line(200, 100, mouseX, mouseY);
  line(100, 300, mouseX, mouseY);
  line(100, 200, mouseX, mouseY);
  line(300, 100, mouseX, mouseY);
  line(200, 300, mouseX, mouseY);
  line(300, 300, mouseX, mouseY);
  line(300, 200, mouseX, mouseY);
  if (mousePressed) {
    fill(0, 250);
    noStroke();
    rect(0, 0, width, height);
  };
}
  

