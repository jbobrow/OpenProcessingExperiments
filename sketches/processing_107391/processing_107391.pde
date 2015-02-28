
float x, y, r, g, b, a, radius;
int timer;
 
void setup() {
  size(500, 500);
  background(255);
  noStroke();
  smooth();
}
 
void draw() {
  // use frameCount to move x, use modulo to keep it within bounds
  x = (1 + frameCount % width);
 
  // use millis() and a timer to change the y every 2 seconds
  if (millis() - timer >= 1000) {
    y = random(height);
    timer = millis();
  }
 
  // use frameCount and noise to change the red color component
  r = noise(frameCount % width)
 
  // use frameCount and modulo to change the green color component
  g = frameCount % 255;
 
  // use frameCount and noise to change the blue color component
  a = 255 - noise(1 + frameCount * 0.025) * 255;
 
  // use frameCount and noise to change the radius
  radius = noise(x * 0.01) * 50;
 
  color c = color(r, g, 150, a);
  strokeWeight(15)
  fill(c);
  ellipse(x, y, radius, radius);
}
