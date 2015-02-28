
FallingObject suggestions = new FallingObject (30, 30);
float gravity = 1;
void setup () {
  size (350, 600);
}
void draw () {
  background (200);
  suggestions.display();
  suggestions.fall();
}
class FallingObject {
  float x;
  float y;
  float speed;
  FallingObject (float startX, float startY) {
    x = startX;
    y = startY;
    speed = 0;
  }
  void fall() {
    //falling is always same y axis, just speed changes
    y = y + speed;
    speed = speed + gravity;
  }
  void display() {
    ellipse (x, y, 10, 10);
  }
}
