
//DECLARE
ArrayList ballCollection;


void setup() {
  size(1000, 600);
  smooth();

  //INITIALIZATION
  ballCollection = new ArrayList();


  //  for (int i = 0; i < 100; i++) {
  //    Ball myBall = new Ball(width/2, height/2);
  //    ballCollection.add(myBall);
  //  }
}

void draw() {

  fill(0, 20);
  rect(0, 0, width, height);

  //wide spray
  Ball myBall = new Ball(width/2, height/2+200, random(-5, 5), random(-10, -5));
  ballCollection.add(myBall);

  //high spray
  Ball myBall2 = new Ball(width/2, height/2+100, random(-1, 1), random(-15, -10));
  ballCollection.add(myBall2);

  //wide spray 2
  Ball myBall3 = new Ball(width/2, height/2+200, random(-5, 5), random(-10, -5));
  ballCollection.add(myBall3);

  //high spray 2
  Ball myBall4 = new Ball(width/2, height/2+100, random(-1, 1), random(-15, -10));
  ballCollection.add(myBall4);
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
  float speedX = random(-5, 5);
  float speedY = random(-10, -5);

  //CONSTRUCTOR
  Ball(float _x, float _y, float _speedX, float _speedY) {
    x = _x;
    y = _y;
    speedX = _speedX;
    speedY = _speedY;
  }



  // FUNCTIONS
  void run() {
    display();
    movement();
    bounce();
    gravity();
  }


  void gravity() {
    speedY += .2;
  }

  void bounce() {
    if (y > height-height/10) {
      speedY = speedY *-0.25;
    }
    if (y < 0) {
      speedY = speedY *-1;
    }
  }

  void movement() {
    x += speedX;
    y += speedY;
  }


  void display() {
    rect(x, y, 2, 2);
    
    // if the speed on the way down is faster than numbers, turn white
    if(speedY > 5  || speedX > 5){
      fill(255,255,255,random(100)); //make white and various transparency
    }else{
    fill(random(0, 50), random(100, 200), random(200, 255), random(255)); //if not fast then blue green shimmer
    }
    

    noStroke();
  }
}
