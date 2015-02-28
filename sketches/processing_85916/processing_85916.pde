
float x = 200;
float y = 200;
float d;
void setup() {
  size(400, 400);
  noStroke();
}
void draw() {
  fill (x/1.5, y/1.5, x/1.5);;
  ellipse(x, y, 20, 20);
  d += random(-1, 1);
  x += sin(d)*(noise(d)*15);
  y+=cos(d)*(noise(d)*15);
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
  
