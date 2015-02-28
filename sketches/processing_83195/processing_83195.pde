
//Kelvin Pan
//Computer Programming 1
//Simon 16/17
//12.6.12
//Bouncing Ball

Ball ballbro;

//setup
void setup() {
  size (500, 500);
  background(0);
  ballbro = new Ball();
}

//draw
void draw() {
  background(0); 
  ballbro.show();
  ballbro.move();
  ballbro.bounce();
  ballbro.grav();
}

//BALL BLUEPRINT
class Ball {
  int x, y;
  int boost;
  boolean up, right;
  Ball() {
    x = 0;
    y = 0;
    boost = 255;
    up = false;
    right = true;
  }
  void show() {
    fill(255, boost, boost);
    ellipse(x, y, 30, 30);
  }
  void move() { //BASIC MOVEMENT
    if (right == true) {
      x = x + 3;
    }
    if (right == false) {
      x = x - 3;
    }
    if (up == false) {
      y = y + 3;
    }
    if (up == true) {
      y = y - 3;
    }
  }
  void bounce() { //EDGE CONTROL
    if (x < 0) {
      right = true;
    }
    if (x > 500) {
      right = false;
    }
    if (y < 0) {
      up = false;
    }
    if (y > 500) {
      up = true;
    }
  }
  void grav() { //GRAVITY FUNCTION
    if (mousePressed == true && boost > 0) {
      boost = boost - 5;
      if (x > mouseX) {
        x = x - 4;
        right = false;
      }
      if (x < mouseX) {
        x = x + 4;
        right = true;
      }
      if (y > mouseY) {
        y = y - 4;
        up = true;
      }
      if (y < mouseY) {
        y = y + 4;
        up = false;
      }
    }
    if (mousePressed == false) {
      boost++;
    }
    if (key == ' ') {
      boost = 255;
    }
  }
}
