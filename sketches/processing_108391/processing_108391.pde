
int x = 100; 
int xSpeed = 2;

void setup() {

  size(300, 300);
}


void draw() {

  background(0,0,0);
  rect(x, 100, 10, 10);

  x = x + xSpeed;

  if (x > width-10) {
    xSpeed = -xSpeed;
  }
}
