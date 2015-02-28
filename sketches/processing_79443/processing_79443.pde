
float green_circle_x;
CircleGrow gregory;
CircleGrow morty;

void setup() {
  size(400, 700);
  green_circle_x = 100.3203;
  gregory = new CircleGrow(145, 340);
  morty = new CircleGrow(300, 100);
}
void draw() {
gregory.display();
morty.display();
}
class CircleGrow {
  float x;
  float y;
  CircleGrow(float initial_x, float initial_y) {
    x = initial_x;
    y = initial_y;
  }
  void display() {
    fill(200, 10, 130);
    ellipse(x, y, 100, 100);
  }
}
