

//DECLARE
Ball [] ballCollection = new Ball [600];


void setup() {
  size(600, 600);
  smooth();

  //INITIALIZE
  for  ( int i = 0; i < ballCollection.length; i++) {
    ballCollection[i] = new Ball(random(0, width), random(0, 200));
  }
}

void draw() {
  background(255);

  //CALL FUNCTIONALITY
  for (int i = 0; i < ballCollection.length; i++) {
    ballCollection[i].run();
  }
}



class Ball {
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;

  // CONSTRUCTOR
  Ball(float _x, float _y) {

    x = _x;
    y = _y;
  }


  //FUNCTIONS

  void run() {
    display();
    move();
    bounce();
    gravity();
    //push
  }

  void display() {
    ellipse(x, y, 20, 20);
    fill(random(1, 255), mouseX, mouseY);
  
  }

  void move() {
    x += speedX;
    y += speedY;
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
    if (y < 0) {
      speedY = speedY * -1;
    }
  }
  
  void gravity(){
    speedY += 0.2;
    
  }

  
}



