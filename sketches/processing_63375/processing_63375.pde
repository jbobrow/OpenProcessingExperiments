
int x = 0;
int y = 0;
int geschwindigkeit = 1;
int geschwindigkeit2 = 1;
 
void setup() {
  size(350, 200);
  smooth();
}
void draw() {
  background(0, 255, 0);
  x = x + geschwindigkeit;
  if ((x > width) || (x < 0)) {
    geschwindigkeit = geschwindigkeit * -1;
  }
  // Display circle at x location
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(x, height/2, 32, 32);

  y = y + geschwindigkeit2;
  if ((y > height) || (y < 0)) {
    geschwindigkeit2 = geschwindigkeit2 * -1;
  }
  // Display circle at y location
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(width/2, y, 32, 32);
 
}

