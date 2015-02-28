
// variables III
// varying multiple parameters with different variables

int x = 0;
int s = 15;

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  noFill();
  stroke(255, 100); // white, transparent
  strokeWeight(2);
  background(64); // dark gray
}

//--------------------------------------------------------
void draw() {
  ellipse(x, 150, s, s);
  x = x + 1;
  s = s + 1;
}
