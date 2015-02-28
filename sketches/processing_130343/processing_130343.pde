
int shape;
//int i = int(random(1,4));

void setup() {
  size(420, 420);
} //end setup

void draw() {
  background(0);
  fill(255);
  for (int x = 0; x < width; x += 15) {
    for (int y = 0; y < height; y += 15) {
      Shape(x, y);
    }
  }
  noLoop();
} //end draw

//forms a triangle at random at the given coordinates
void Shape(int x, int y) {
  int i = int(random(1,4));
  if (i == 1) {
    triangle(x, y, x, y+15, x+15, y);
  }
  else if (i == 2) {
    triangle(x, y, x+15, y, x+15, y+15);
  }
  else if (i == 3) {
    triangle(x, y, x+15, y, x+15, y+15);
  }
  else if (i == 4) {
    triangle(x, y+15, x+15, y+15, x+15, y);
  }
}


