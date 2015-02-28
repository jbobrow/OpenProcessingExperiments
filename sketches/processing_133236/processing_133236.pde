
void setup() {
  size(500, 500);
  background(0);
}

int x = 0;
int y = 0;

void draw() {
  fill(0, 20);
  rect(0, 0, 500, 500);
  for (int i = 0; i <6; i++) {
    fill(255);
    rect(x, y, 20, 20);
    x = x+15;
    y= y+5;
  }
  x = int(random(400));
  y = int(random(500));
}

