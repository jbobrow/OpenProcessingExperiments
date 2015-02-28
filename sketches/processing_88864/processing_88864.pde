
void setup() {
  background(500, 500);
}

void draw() {
  for (int i = 0; i < 100; i++) {
  float r = random(50);
  stroke(r*5);
  line(50, i, 50+r, i);
}
for (int i = 0; i < 100; i++) {
  float r = random(-50, 50);
  println(r);
}

}
