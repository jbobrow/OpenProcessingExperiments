
// Learning Processing Exercise 13-3. Perlin noise to move a circle naturally.

float xtime = 0.0;
float ytime = 100.0; // so x and y start at different places in the Perlin series, avoiding linear movement
float increment = 0.01;

void setup() {
  size(400, 400);
}

void draw() {
  background(33);
  fill(200);
  float x = noise(xtime) * width;
  float y = noise(ytime) * height;
  ellipse(x, y, 50, 50);
  xtime += increment;
  ytime += increment;
}
