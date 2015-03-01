
//Declare vars
myClass instance; 
myClass instance2;
myClass instance3;

void setup() {
  size(400, 400);
  background(0);
  noStroke();
  rectMode(CENTER);
  
  //Initialize the declared variable
  instance = new myClass(70, 70);
  instance2 = new myClass(320, 100);
  instance3 = new myClass(70, 200);
}

void draw() {
  background(0); //<>//

  //Access the display function inside myClass, initialized in instance
  instance.run();
  instance2.run();
  instance3.run();
}
class myClass {
  //global vars
  float x = 0;
  float y = 0;
  float moveSpeedX = 1.2;
  float moveSpeedY = 9.2;

  //constructor
  myClass(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //functions  
  void run() {
    display();
    move();
    bounce();
    gravity();
  }
  
  void gravity() {
    moveSpeedY += 0.6;
  }

  void bounce() {
    if (x > width) {
      moveSpeedX = -moveSpeedX;
    }

    if (x < 0) {
      moveSpeedX = -moveSpeedX;
    } 

    if (y > height) {
      moveSpeedY = -moveSpeedY;
    }

    if (y < 0) {
      moveSpeedY = -moveSpeedY;
    }
  }

  void move() {
    x = x + moveSpeedX;
    y = y + moveSpeedY;
  }

  void display() {
    ellipse(x, y, 20, 20);
  }
}


