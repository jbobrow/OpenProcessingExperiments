
float x = 0;
float y = 0;
float geschwindigkeitx = random(10);
float geschwindigkeity = random(10);
float b;

void setup() {
  size(500, 500);
  smooth();
  background(255);
}
void draw() {
  x = x + geschwindigkeitx;
  if ((x > width) || (x < 0)) {
    geschwindigkeitx = geschwindigkeitx * -1;
  }
  y = y + geschwindigkeity;
  if ((y > height) || (y < 0)) {
    geschwindigkeity = geschwindigkeity *-1;
  }

  noStroke();
  b = random(255);
  fill(10, y, b);
  arc(x, b, 50, y, geschwindigkeity, x);


  if ((x > width) || (x < 0)) {
    geschwindigkeity = random(1-10);
  }
  if ((y > width) || (y < 0)) {
    geschwindigkeitx = random(1-10);
  }
  if ((x > width) || (x < 0)||(y > width) || (y < 0)) {
    b = random(255);
  }
  if (mousePressed) {
    saveFrame("thumbnail.png");
  }
}


