
Ball myBall;

void setup() {
  size(600, 400);
  smooth();
  noStroke();

  myBall = new Ball(10,10);
}

void draw() {
  background(0);
  

  myBall.run();
}
class Ball {

  float x =0;
  float y=0;
  float speedX =2;
  float speedY =0.5;


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
    speedY +=0.2;
  }

  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    }
    if (x <0) {
      speedX = speedX * -1;
    }
    if (y > height) {
      speedY = speedY * -1;
    }
    if (x <0) {
      speedY = speedY * -1;
    }
  }
  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {
  fill(255, 230, 80);
  ellipse(x, y, 140, 60);
  ellipse(x, y-55, 80, 80);
  ellipse(x, y+20, 110, 65);
  
  fill(0);    
  ellipse(x-15, y-60, 10, 10);
  fill(0);    
  ellipse(x+15, y-60, 10, 10);

  fill(255, 0, 0);    
  ellipse(x, y-45, 35, 20);
}
}



