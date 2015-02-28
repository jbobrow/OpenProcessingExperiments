
float x, y;
float speed;
int w;
void setup() {
  size(200, 200);
  x = 0.0;
  y = height/2.0;
  speed = 1.0;
  w = 10;
}

void draw() {
  background(204);
  x += speed;
  if (x > width) { 
    x = -w;
    y = random(width - w);
  }
  rect(x, y, w, w);
}
