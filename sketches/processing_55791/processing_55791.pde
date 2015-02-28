
class Food {
  float x = random(0, width);
  float y = random(0, height);
  Food() {
  }
  void display() {
    fill(100, 0, 96);
    rect(x, y, globalSize, globalSize);
  }
}

