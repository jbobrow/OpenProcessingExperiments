
float x = 0;

void setup() {
  size(400, 400);
  background(255);
  stroke(255);
}
void change_line_color() {
  stroke(255, 0, 0);
  line(x, 100, x, 200);
  if (random(100) > 50) {
    stroke(0);
  } else {
    stroke(255);
  }
}
void draw() {
  line(x, 100, x, 200);
  if(random(100) > 90) {
    change_line_color();
  }
  x= x + 1;
  if(x > width) {
    x= 0;
  }
}


