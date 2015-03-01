
float x, y, dx, dy, lastMouseX, lastMouseY= 0.0;
int ellipseWidth = 60;
int screenWidth = 600;

void setup() {
  size(screenWidth, screenWidth);
  background(256, 256, 256);
  dx = 1;
  dy = 4;
}
void draw() {

  background(190, mouseX, mouseY);


  if (mousePressed) { //|| mouseX > x - (ellipseWidth/2) && mouseX < x + (ellipseWidth/2) && mouseY > y - (ellipseWidth/2) && mouseY < y + (ellipseWidth/2)) {
    ellipse(mouseX, mouseY, ellipseWidth, ellipseWidth);
  } else {
    dy += 0.4;
    x += dx;
    y += dy;
    if (x>screenWidth - ellipseWidth/2) {
      dx = dx*-0.9;
    } else if (x < 0 + ellipseWidth/2) {
      dx = dx*-0.9;
    }
    if (y > screenWidth - ellipseWidth/2) {
      dy = dy*-0.9;
    } else if (y < 0 + ellipseWidth/2) {
      dy = dy*-0.9;
    }
    ellipse(x, y, ellipseWidth, ellipseWidth);
  }
  lastMouseX = mouseX;
  lastMouseY = mouseY;
}

void mouseReleased() {
  x = mouseX;
  y = mouseY;

  dx = lastMouseX - mouseX;
  dy = lastMouseY - mouseY;
}
