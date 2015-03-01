
float x, y, deltaX, deltaY, size2;
boolean goingLeft, goingDown;
PImage pic;

void setup() {
  size(400, 400);
  pic = loadImage("Narahari.jpg");
  x = random(0, 400);
  y = random(0, 400);
  size2 = 90;
  goingLeft = false;
  goingDown = true;
}

void draw() {
  background(255, 255, 0);
  deltaX = random(1, 3);
  deltaY = random(1, 3);
  if(x + size2 >= width) {
    goingLeft = true;
  }
  if(y +  size2 >= height) {
    goingDown = false;
  }
  if(x <= 0) {
    goingLeft = false;
  }
  if(y <= 0) {
    goingDown = true;
  }
  if(goingLeft == true) {
    x -= deltaX;
  }
  else {
    x += deltaX;
  }
  if(goingDown == true) {
    y += deltaY;
  }
  else {
    y -= deltaY;
  }
  image(pic, x, y,  size2,  size2);
}
  


