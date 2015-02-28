

//DECLARE
ArrayList ballCollection;


void setup() {
  size(600, 600);
  smooth();

  //INITIALIZE
  ballCollection = new ArrayList();

  //for (int i = 0; i < 100; i++) {
  //  Ball myBall = new Ball(random(0, width), random(0, 200));
  //   ballCollection.add(myBall);
  // }
}

void draw() {
  background(255);
  Ball myBall = new Ball(random(0,width), random(0, 200));
  ballCollection.add(myBall);
  
  //CALL FUNCTIONALITY
  for (int i = 0; i < ballCollection.size(); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }
}



class Ball {
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = random(-2, 2);
  float speedY = random(-2, 2);

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
    rainbow();
  }

  void display() {
    ellipse(x, y, 20, 20);
    

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
  
  void rainbow(){
    fill(y - 167, x - 68, 80);
  }
  
}



