
float x, y, c;
int big = 40;
int frames = 80;
int i = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0, 0, 0);
}

void draw() {
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  x = random(width);
  y = random(height);
  c = random(255);

  fill(c, 255, 255, 40);
  ellipse(x, y, big, big);

  fill(c, 255, 255, 80);
  ellipse(x, y, big/2, big/2);

  fill(c, 255, 255, 120);
  ellipse(x, y, big/4, big/4);

  wait(100);
}

void wait(int delay) {
  int time = millis();
  while (millis () - time <= delay);
}

