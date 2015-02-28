
// Learning Processing Exercise 13-2. Probabilities applied to movement.

final float UP_PROB = 0.1;
final float DOWN_PROB = 0.2;
final float NADA_PROB = 0.7;

float y = 100;

void setup() {
  size(400, 400);
}

void draw() {
  background(33);
  float r = random(1);
  if (r < UP_PROB) {
    --y;
  } else if (r < UP_PROB + DOWN_PROB) {
    ++y;
  } else {
    // do nothing.
  }
  ellipse(width / 2, y, 16, 16);
}
