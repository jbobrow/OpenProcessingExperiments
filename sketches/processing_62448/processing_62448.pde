
float x = 0;
float y = 1;
float X = 5;
float Y = 7;
 
void setup() {
  size(600, 600);
  smooth();
}
void draw() {
  background(random (255),random (255),random (255));
  x = x + X;
  y = y + Y;
  if ((x > width) || (x < 0)) {
X = X * -1;
  }
 
  if ((y > height) || (y < 2)) {
    Y = Y * -1;
  }
 
  noStroke();
  fill(random (255));
  ellipse(x, y, 32, 32);
}
 
void mousePressed() {
  saveFrame("thumbnail.png");
}
