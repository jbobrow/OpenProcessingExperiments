
void setup() {
  size(200, 200);
  smooth();
}

void draw() {
  background(255);
  for (float w = width; w > 0; w = w - 20) {
    stroke(0);
    fill(w);
    ellipse(width/2, height/2, w, w);
  }
}

