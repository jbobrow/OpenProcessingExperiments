
//Problem set 3  Question 2
Circle[] c = new Circle[35];

boolean animate = false;

void setup() {
  size(500, 500);
  smooth();

  for (int i = 0; i < c.length; i++) {
    c[i] = new Circle(random(width), 40);
  }
}

void draw() {
  background(249,250,0);


  for (int i = 0; i < c.length; i++) {
    c[i].BALL();
    c[i].DROP();
  }


  if (animate == true) {
    fill(53, 250, 0);
  }
  rect(btnX, btnY, btnW, btnH);
}
int btnX = 150;
int btnY = 10;
int btnW =200;
int btnH = 30;

void mousePressed() {
  if ( mouseX > btnX && mouseX < (btnX+btnW) && mouseY > btnY && mouseY < (btnY+btnH)) {
    animate = !animate;
  }
}
class Circle {
  float X;
  float Y;

  float speed;
  float gravity;
  float dia;

  Circle(float CircleX, float CircleY) {

    X = CircleX;
    Y = CircleY;

    speed = random(0.1, 5);
    gravity = 0.2;
    dia = map(speed, 2, 10, 45, 10);
  }

  void BALL() {

    fill(7, 200, 200, 100);
    ellipse(X, Y, dia, dia);
  }

  void DROP() {
    if (animate == false) {
      Y = Y + speed;
      speed = speed + gravity;
      if (Y >= height-120) {

        speed *= -0.9;
      }
    }
  }
}


