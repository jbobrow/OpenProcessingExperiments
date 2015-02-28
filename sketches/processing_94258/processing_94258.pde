
float x, y, r, g, b, radius;
int timer;

void setup() {
  size(500, 500);
  background(255);
  colorMode(HSB);
  noStroke();
  smooth();
}

void draw() {
  y = frameCount*2 % height;
  if (millis() - timer >= random(1000, 3000)) {
    x = random(width);
    timer = millis();
  }
  r = frameCount % 255;
  g = 255 - noise(1 + frameCount * 0.025) * 255;
  b = noise(frameCount * 0.01) * 255;

  radius = noise(frameCount * 0.01) * 100;

  color c = color(r, b, 255);
  fill(c);
  ellipse(x, y, radius, radius);
} 
void mousePressed() {
  setup();
}
