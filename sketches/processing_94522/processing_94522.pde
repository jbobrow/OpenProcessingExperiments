
float x = -1;
float y = 400;
float easing = 0.015;
float angle, oldAngle = 0;

// size of snake head
int a = 40;

// to make jaw rotate
float jawAngle = -20;
float angleChange = 0.5;
int angleLimit = 8;

void setup() {
  size(1440, 900);
  smooth();
}

void draw() {  

  // make the leftout drawings dim out slowly
  fill(217, 229, 254, 2);
  rect(0, 0, width, height);
  fill(217, 229, 254);

  pushMatrix();
  angle = atan2(x-mouseX, y-mouseY);
  translate(x, y);
  rotate(-angle-HALF_PI);
  drawSnake();
  drawPetal();


  //moving jaw
  jawAngle = jawAngle + angleChange;
  // if the jaw has moved over its limit, reverse the direction
  // and set within limits
  if (jawAngle > angleLimit || jawAngle < -20) {
    angleChange = -angleChange;
    jawAngle = jawAngle + angleChange;
  }
  popMatrix();

  //to move toward mouse click
  float targetX = mouseX;
  float targetY = mouseY;
  if (mousePressed) {
    if (targetX > x && x < width - 12 || targetX < x && x > 12) {
      x += (targetX - x) * easing;
    }
    if (targetY < y && y > 12 || targetY > y && y < height - 12) {
      y += (targetY - y) * easing;
    }
  }
}

void drawPetal() {
  pushMatrix();
  scale(0.4);
  translate(-440+random(100, 1000), -500+random(100, 1000));
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  noStroke();
  triangle(-20, 20, -29, 20, -25, 35);

  // moving petal
  pushMatrix();
  translate(1, 30);
  //  translate(a/40, 3*a/4);
  rotate(radians(jawAngle));
  quad(0, 0, 0, 10, -31, 8, -35, 6);
  //  quad(0, 0, 0, a/4, -19*a/24, a/5, -7*a/8, 3*a/20);
  popMatrix();
  popMatrix();
}  

void drawSnake() {  
  scale(-1, 1);
  fill(random(0, 255), random(0, 255), random(0, 255), 255);
  noStroke();
  quad(16, -8, 0, 20, -40, 20, -35, 10);
  quad(0, 0, 16, -8, 40, 20, 0, 20);
  quad(0, 0, 40, 20, 24, 36, 0, 40);
  quad(0, 20, 0, 40, -8, 30, -40, 20);
  triangle(-20, 20, -29, 20, -25, 35);

  // moving jaw
  pushMatrix();
  translate(1, 30);
  //  translate(a/40, 3*a/4);
  rotate(radians(jawAngle));
  quad(0, 0, 0, 10, -31, 8, -35, 6);
  //  quad(0, 0, 0, a/4, -19*a/24, a/5, -7*a/8, 3*a/20);
  popMatrix();
}
