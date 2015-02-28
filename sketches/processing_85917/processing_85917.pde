
float x = width;
float y = 200;
void setup() {
  size(400, 400);
  noStroke();
}
void draw() {
  fill (x, y, y);;
  ellipse(x, y, 20, 20);
  x += random(-10, 7);
  y+=10;
  if (x>width) {
    x=0;
  }
  if (x<0) {
    x = width;
  }
  if (y>height) {
    y=0;
  }
  if (y<0)
  y=height;
}
