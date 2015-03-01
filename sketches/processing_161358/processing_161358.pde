
int x = 0;
int y = 0;
int my = 3;
int mx = 3;
void setup() {
  size(600, 400);
}

void draw() {
  background(50);
  fill(random(255),223,0,234);  
  ellipse(x, y, 10, 10);
  x+=mx;
  y+=my;
  if (y > height|| y < 0) {
    my *= -1;
  }
  if (x > width) {
    mx *= -1;
  } else if (x < 0) {
    mx *= -1;
  }
}
