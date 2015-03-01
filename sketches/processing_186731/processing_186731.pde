
void setup () {
  size(600, 600);
}
void draw() {
  float t = random(0,255);
background(100,t,43);
  for (int i = 5; i < mouseX; i = i +10) {
    ellipse (i, 300, 10, 10);
    ellipse(i, 400, 10, 10);
    ellipse(400, i, 10, 10);
    ellipse(i, 500, 10, 10);
    ellipse(300, i, 10, 10);
    ellipse(290, i, 10, 10);
    ellipse(200, i, 10, 10);
    ellipse(i, 200, 10, 10);
    ellipse(100, i, 10, 10);
    ellipse(90, i, 10, 10);
    ellipse(i, 90, 10, 10);
    ellipse(500, i, 10, 10);
    ellipse(490,i,10,10);
    fill(0);
  }
}
