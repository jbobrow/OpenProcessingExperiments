
void setup() {
  size(300, 300);
}

int x =50;
int y = 50;

void draw() {
  smooth();
  background(255-.75*y);
  fill(x-50);
  ellipse(x, y, 50, 50);
  x++;
  y++;
}


