
void setup () {
  size(400, 400);
}
void draw() {
  for (int i = 0; i < mouseX; i = i +1) {
  float t = random(0, 255);
  background(238, t, 10,100);
  fill(254, 255, 5);
  ellipse(i, 200, 100, 100);
  fill(3, 2, 36);
  ellipse(i, 180, 20, 20);
  ellipse(i, 180, 20, 20);
  arc(i, 210, 80, 60, 0, PI);
}
}
