
float increment = 1;
float speed = 0.1;
float xpos;
float ypos;
float gridColor;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(600, 400);
  noStroke();
  background(0, 0, 100);
}

void draw() {
  inc(); // Increment hue value basis
  float hue = map(sin(increment), -1, 1, 0, 360);
  fill(hue, 100, 100, 45); // HSBA - Alpha/transparency goes from 360 to 0

  xpos = width/2 + cos(radians(hue))*100;
  ypos = height/2 + sin(radians(hue))*100;
  rectMode(CENTER);
  ellipse(mouseX, mouseY, 100, 100);
}

void inc() {
  increment+=speed;
}
