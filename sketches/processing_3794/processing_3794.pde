
int margin=8, border=235, inside=250;

void setup() {
  size(640, 480);
}

void draw() {
  background(border);
  stroke(inside);
  fill(inside);
  rect(margin, margin, (width - margin * 2) - 1, (height - margin * 2) - 1);
}

