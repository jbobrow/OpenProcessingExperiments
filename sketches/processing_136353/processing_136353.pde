
class Ball{
// Globals  
  float x = 0;
  float y = 0;
  float speedX = random(-1, 1);
  float speedY = random(-1, 1);
  
// Constructor
  Ball(float _x, float _y) {
    x = _x;
    y = _y;
  }

// Functions

  void run() {
  display();
  move();
  bounce();
  gravity();
}
  void display() {
    ellipse(x, y,20, 20);
  }
  
  void move() {
    x += speedX;
    y += speedY/2;
  }
  
  void bounce() {
    if (x > width || x < 0 ) {
      speedX = -1 * speedX;  
  }
    if (y > height || y < 0) {
      speedY = -1 * speedY;
    }
 }
  
  void gravity() {
    
    speedY += 0.2;
}
}

