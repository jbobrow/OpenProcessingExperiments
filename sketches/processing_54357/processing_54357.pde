
 float x, y, r, g, b, radius;
int timer;

void setup() {
  size(500, 450);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  y = frameCount % height;
  if (millis() - timer >= 2000) {
    x = random(width);
    timer = millis();
  }
  r = frameCount % 255;
  g = 255 - noise(1 + frameCount * 0.025) * 255;
  b = noise(frameCount * 0.01) * 255;

  // use frameCount and noise to change the radius
  radius = noise(frameCount * 0.01) * 100;

  color c = color(r, g, b);
  fill(c);
  ellipse(x, y, radius, radius);
}          
                                                                                
