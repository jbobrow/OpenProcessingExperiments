
int x;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  rect(x, 200, 50, 50);
  x += 3;
  
  
  if (x > width) {
    x = 0;
  }
}
