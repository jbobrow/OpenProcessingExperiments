
float x2, y2, deltaX2, deltaY2, size2;
PImage pic2;

void setup() {
  size(400, 400);
  pic2 = loadImage("Narahari.jpg");
  x2 = random(0, 400);
  y2 = random(0, 400);
  size2 = 90;
}

void draw() {
  background(255, 255, 0);
  deltaX2 = random(1, 3);
  deltaY2 = random(1, 3);
  x2 += deltaX2;
  y2 += deltaY2;
  if(x2 >= width) {
    x2 = -size2;
  }
  if(y2 >= height) {
    y2 = -size2;
  }
  image(pic2, x2, y2, size2, size2);
}
  


