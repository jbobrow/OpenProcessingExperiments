
float x1;
float y1;
float x2;
float y2;
void setup() {
  size(500, 500);
  background(255);
}

boolean test = true;
void mousePressed() {
  if (test == true) {
    x1 = mouseX;
    y1 = mouseY;
    test = false;
  } else {
    x2 = x1;
    y2 = y1;
    x1 = mouseX;
    y1 = mouseY;
  }
    stroke(random(0, 255),random(0, 255),random(0, 255));
    strokeWeight(2);
}
void draw() {
  line(x1, y1, x2, y2);
}

