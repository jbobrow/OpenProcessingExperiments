
void setup() {
  size(400, 400);
  smooth();
  noLoop();
}

void draw() {
  for (int i = 0; i < 100; i++) {
   /* drawX(200- i*10, (20-1)*2, i, i/2, 70);*/
   drawCircle(int(random(2)), int(random(30)),
   int(random(width)), int(random(height)), 100);
  }
}

void drawCircle(int blue, int weight, int x, int y, int size) {
  stroke(100, 150, 200);
  strokeWeight(weight);
  fill(20, 150, 150, 100);
  ellipse(x, y, x+size, y+size);
  ellipse(x+size, y, x, y+size);
}



