
float x, y;
void setup() {
  size(400, 400);
}
void draw() {
  float i = random(360);
  x = width/2 + width/2 * sin(radians(i));
  y = height/2 - height/2 * cos(radians(i));
  point(x, y);
}
