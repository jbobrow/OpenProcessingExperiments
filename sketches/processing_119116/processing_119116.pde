
// Learning Processing Example 13-3. Probabilities.

final float RED_PROB = 0.6;
final float GREEN_PROB = 0.1;
final float BLUE_PROB = 0.3;
final int CIRCLE_DIAMETER = 64;

color red = color(200, 53, 2, 150);
color green = color(156, 200, 28, 150);
color blue = color(10, 52, 178, 150);

void setup() {
  size(400, 400);
  background(255);
  noStroke();
}

void draw() {
  float num = random(1);
  if (num < RED_PROB) {
    fill(red);
  } else if (num < RED_PROB + GREEN_PROB) {
    fill(green);
  } else {
    fill(blue);
  }
  ellipse(random(width), random(height), CIRCLE_DIAMETER, CIRCLE_DIAMETER);
}
