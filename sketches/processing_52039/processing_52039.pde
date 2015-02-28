
// Declare a class, setting up a class name, which is "Ball"
class Ball {
  // Global Variables, Main variables for the class
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 2;

  // Constructor, Happen just once, starting with the name of the class
  Ball(float _x, float _y) {

    x = _x;  // Passing information to the global variables
    y = _y;
  }

  // Functions

  void run() {    // One function that contain all Functionalities
    display();
    move();
    bounce();
    gravity();
  }

  void gravity() {
    speedY += 0.5;
  }

  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    } 
    else if (x < 0) {
      speedX = speedX * -1;
    }
    else if (y < 0) {
      speedY = speedY * -1;
    }
    else if (y > height) {
      speedY = speedY * -1;
    }
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {
    ellipse(x, y, 20, 20);
  }
}


