
//Ben Norskov Sep 20, 2013
//space away from the edge
//basic variable types
float padding = 15.32;

void setup() {
  size(500, 500);
}

void draw() {
  background(3, 13, 203);
  line(padding, padding, width - padding, height - padding);
  line(padding, height - padding, width - padding, padding);
}
