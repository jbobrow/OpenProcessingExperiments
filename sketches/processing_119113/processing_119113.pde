
// Learning Processing Example 13-2. Random number distribution.
// Thanks, Shiffman!

float[] randomCounts = new float[20];

void setup() {
  size(200, 200);
}

void draw() {
  background(200);
  int index = int(random(randomCounts.length));
  randomCounts[index]++;
  stroke(0);
  fill(175);
  for (int x = 0; x < randomCounts.length; ++x) {
    rect(x * 10, 0, 9, randomCounts[x]);
  }
}
