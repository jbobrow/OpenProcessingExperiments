
void setup() {
  size(300, 300);
  background(#FF1212);
}
void draw() {
  int m = millis(); // milliseconds, used for timing animations
  stroke(100);
  fill(m % 55);
  ellipse(150, 150, 250, 250);
}


