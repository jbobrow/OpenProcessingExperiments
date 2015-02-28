
int x = 0; 
int geschwindigkeit = 1;

void setup() { 
  size(200, 200);
  smooth();
}
void draw() {
  background(255);
  x = x + geschwindigkeit;
  if ((x > width) || (x < 0)) {
    geschwindigkeit = geschwindigkeit * -1;
  }
  // Display circle at x location 
  stroke(0); 
  fill(175); 
  ellipse(x, 100, 32, 32);
}


