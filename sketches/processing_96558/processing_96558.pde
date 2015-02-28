
float x_position = 10;
float y_position = 10;
float endX = 370;
float endY = 370;
float easing = .07;

void setup() {
  size (400, 400);
  smooth();
}

void draw() { 
  background (200, 120, 155);
  noStroke();
  float totalDistX = endX - x_position;
  float totalDistY = endY - y_position;

  totalDistX *= easing;
  totalDistY *= easing;

  x_position = x_position + totalDistX;
  y_position = y_position + totalDistY;

  ellipse (x_position, y_position, 30, 30);
}

void mousePressed() {
  if (mousePressed ==true) {
    endX = mouseX;
    endY = mouseY;
  }
}
