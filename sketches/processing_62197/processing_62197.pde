
float x = 0;
float y = 0;
float geschwindigkeitX = 5;
float geschwindigkeitY = 7;

void setup() {
  size(200, 200);
  smooth();
}
void draw() {
  background(255);
  x = x + geschwindigkeitX;
  y = y + geschwindigkeitY;
  if ((x > width) || (x < 0)) {
    geschwindigkeitX = geschwindigkeitX * -1;
  }

  if ((y > height) || (y < 0)) {
    geschwindigkeitY = geschwindigkeitY * -1;
  }

  noStroke();
  fill(255, 0, 0);
  ellipse(x, y, 32, 32);
}

void mousePressed() {
  saveFrame("thumbnail.png");
}


