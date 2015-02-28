
void setup() {
  size(400, 400);
  smooth();
  noCursor();
  background(0);
}

void draw() {

  for (int i = 50; i < width; i = i + 50) {
    for (int j = 20; j < height; j = j + 20) {
      stroke(255, 10);
      noFill();
      line(i, i, j, 200);

      }
    }
  }


