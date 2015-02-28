
PShape monalisa;
float easing = 0.05;
float offset=0;

//DECLARE
ArrayList ballCollection;

void setup() {
  size (400, 400);
  smooth();
  noStroke();
  monalisa = loadShape("monalisa_others.svg");
  shapeMode(CENTER);

  //INITIALIZE
  ballCollection = new ArrayList();

  //for (int i = 0; i<100; i++) {
    //Ball myBall = new Ball(random(0, width), random(0, height));
   // ballCollection.add(myBall);
  //}
}


void draw() {
  background(0);
  Ball myBall = new Ball(random(0, width), random(0, height));
  ballCollection.add(myBall);
  
  //CALL FUNCTIONALITY
  for (int i = 0; i< ballCollection.size(); i++) {
    Ball myBall2 = (Ball) ballCollection.get(i);
    myBall2.run();
  }
  float dx =(mouseX-width/2)-offset;
  offset+=dx * easing;
  shape(monalisa, 250+offset*2,330,480,720);
}

class Ball {
  //GLOBAL VARIABLES
  float x =0;
  float y =0;
  float speedX = random(-6,6);

  //CONSTRUCTOR
  Ball(float _x, float _y) {//就是主頁裡的200,200
    x = _x;
    y = _y;
  }

  //FUNCTIONS

  void run() {//用"run"來把所有功能放進去
    display();  
    move();
  }
  void display() {
    fill(random(0,255),random(0,255),random(0,255),100);
    ellipse(x, y, 20, 20);
  }
  void move() {
    x+= speedX;
    if (x>width) {
      speedX = -speedX;
    }
    if (x<0) {
      speedX = -speedX;
    }
  }
}



