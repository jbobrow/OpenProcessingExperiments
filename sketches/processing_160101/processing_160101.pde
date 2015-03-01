
void setup() {
  size(500, 500);
  background(#050505);
}
void draw() {

  strokeWeight(3);
  stroke(random(255));
  line(random(width), 0, random(height), 500);
}


