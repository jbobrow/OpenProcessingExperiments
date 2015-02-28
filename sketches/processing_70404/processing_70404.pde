
class Ball { 
  float x = 0;
  float y = 0;
  float speedX= 7;
  float speedY = 0.5;

  Ball(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void run() {
    display();
    move();
    bounce();
    gravity();
  }

  void gravity() {
    speedY += 0.2;
  }

  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    }
    if (x < 0) {
      speedX = speedX * -1;
    }
    if (y > height) {
      speedY = speedY * -1;
    }
    if (x < 0) {
      speedY = speedY * -1;
    }
  }
  void move() {
    x += speedX;
    y += speedY;
  }  

  void display() {
    quad(20, 20, 40,40, x, y, 40, 30);
  }
}


