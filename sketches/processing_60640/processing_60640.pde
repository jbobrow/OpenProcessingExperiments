
int grav = 1;
int speed;
int bounceSpeed;
int circY;
int circX;
int speedX = 0;
int circWidth;
int state = 0; // 0 = rest, 1 = jump, 2 = bounce

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  smooth();
}

void draw() {
  fill(255, 150);
  rect(0, 0, width, height);
  
  if (state == 0) {
    circWidth = 100;
    circY = height - 50;
    speed = 0;
    if (speedX >= 0) speedX -= 0.1;
  }
  
  else if (state == 1) {
    speed -= grav;
    circY -= speed;
    if (circY >= height - 50) state = 2;
    bounceSpeed = (abs(speed) - 2);
    speedX = 20;
    circX = (circX + speedX) % width;
  }
  
  else if (state == 2) {
    speed -= grav;
    circY -= speed;
    if (circY >= height - 50) {
      bounceSpeed *= .9;
      speed = bounceSpeed;
    }
    if (bounceSpeed <= 0) state = 0;
    speedX = 20;
    circX = (circX + speedX) % width;
  }
  
  fill(255, 0, 0, map(circY, height - 50, 0, 255, 10));
  ellipse(circX, circY, 100, 100);
  
}

void mouseClicked() {
//  saveFrame();
  state = 1;
  speed = 20;
}

