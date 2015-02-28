
float t;
float xoff;
float off_random;
float start_y;

void setup() {
  size(200, 400);
  colorMode(HSB, 360, 100, 100);
  background(200);
  smooth();

  strokeWeight(5);

  t = 0.0;
  xoff = t;
  off_random = random(1, 100);
}

void draw() {
  background(360);

  waving(0);
  waving(height);
}

void waving(float start_y) {
  xoff = t + off_random;

  for (int i = 0; i < width; i++) {
    float y = noise(xoff)*height;

    stroke(y, 30, 100, 50);
    line(width/2, start_y, i, y);

    xoff += 0.01;
  }

  t+= 0.03;
}



