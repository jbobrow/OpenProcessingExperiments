
float x;
float y;
float easing = 0.01;
float diameter = 12;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
if ((keyPressed == true) && (key == 'd')) {
    saveFrame("blot####.png");
  }
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  ellipse(x, y, 12, 12);
  println(targetX + " : " + x);
}               
