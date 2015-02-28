
ArrayList ballCollection;

void setup(){
  size(600,600);
  smooth(); 
  background(0);
  frameRate(30);
ballCollection = new ArrayList();
//for(int i = 0; i<100; i++){
//Ball myBall = new Ball(random(0,width),random(0,200));
//ballCollection.add(myBall);
//}
}
void draw() {
  //background(0);
  strokeWeight(0);
  
  Ball myBall = new Ball(random(1,300),100);
  ballCollection.add(myBall);
  for(int i = 0; i<ballCollection.size(); i++){
  Ball mb = (Ball) ballCollection.get(i);
  myBall.run();
}
}
class Ball {
  float x = 0;
  float y = 0;
  float speedX = random(-1,-12);
  float speedY = random(1,-1);

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

  void display() {
    ellipse(x, y, 2, 2);
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void bounce() {
    if (x > width) {
      speedX = -speedX;
    }
    if (x < 0) {
      speedX = -speedX;
    }
    if (y > height) {
      speedY = -speedY;
    }
    if (y < 20) {
      speedY = -speedY;
    }
  }
  void gravity() {
    speedY += .02;
  }
}



