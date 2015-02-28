
float x_position = 10;
float y_position = 10;
float endX = 370;
float endY = 100;
float easing =.1;
void setup () {
  size(400, 400);
  smooth();
}
void draw() {
  background(200, 120, 15);
  float totalDist = endX -x_position;//distance
  totalDist *=easing;
  x_position = x_position +totalDist;
  ellipse(x_position, height*.5, 30, 30);
}
