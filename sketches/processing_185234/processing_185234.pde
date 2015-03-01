
void setup() {
  size(400, 600);
  background(255);
  rectMode(CENTER);
  noLoop();
}

int x = 30;
int y = 30;
int margin = x * 2;

void draw() {
  for (int i = 1; i < (height - margin); i = i + 1) {
    for (int j = 1; j < (width - margin); j = j + 1) {
      pushMatrix();
      translate(x * j, y * i);
      rotate(radians(random(-i * 3, i * 3)));
      rect(1, 1, x, y);
      popMatrix();
    }
  }
}



