
int x = 60;
int y = 60;
int geschwindigkeit = 1;
int geschwindigkeit2 = 3;
 
void setup() {
  size(500, 500);
  smooth();
}
void draw() {
  background(255);
  x = x + geschwindigkeit;
  y = y + geschwindigkeit2;
  if ((x > width-60) || (x < 60)) {
    geschwindigkeit = geschwindigkeit * -1;
  }
  
  if ((y > height-60) || (y < 60)) {
    geschwindigkeit2 = geschwindigkeit2 * -1;
  }
  // Display circle at x location
  noStroke();
  fill(0,255,0);
  ellipse(x, y, 32, 32);

 
 
}

