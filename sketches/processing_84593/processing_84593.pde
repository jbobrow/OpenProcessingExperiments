
int x = 100;
int y = 100;

void setup() {
  size(200, 200);
}

void draw() {
  background(0);
  if (key ==CODED) {
    if (keyCode == UP) {
      y = 50;
    } else if (keyCode == DOWN) {
      y = 150;
    } else if (keyCode == RIGHT) {
      x = 150;
    } else if (keyCode == LEFT) {
      x = 50;
      }
    } 
  ellipse (x, y, 10, 10);   
}
