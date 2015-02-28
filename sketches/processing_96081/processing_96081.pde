
int radius = 50;
float x = 0;
float px = -radius;
float speed = 40;
int direction = 1;

void setup() {
  size(500, 500);
  smooth();
  noFill();
  strokeWeight(5);
  frameRate(5);
}

void draw() {
  for (int x = 20; x < width; x += 100) {
    float mx = mouseX / 10;
    float offsetA = random(-mx, mx);
    float offsetB = random(-mx, mx);
    line(x + offsetA, 200, x - offsetB, 500);
  }
  float px = random(100);
  float y = random(50);
  float d = random(10, 100);
  stroke(random(255), random(255), random(255));
  ellipse(x, y, d, d);
   x += speed;  
    if ((x > width-radius) || (x < radius)) {
    direction = -direction;
    }
    if (direction == 1) {
      rect(x, 60, radius, 20, 80);
    } else {
      rect(x, 60, radius, 20, 90);
    }
}


