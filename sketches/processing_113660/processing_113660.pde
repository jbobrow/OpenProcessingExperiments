
Ball b;
Rectangle c;

void setup() {
  size(800, 800);
  b = new Ball();
  c = new Rectangle();
}

void draw() {
  background(0);
  b.update();
  b.display();
  c.update();
  c.display();
}
 
 
 class Ball {

  // Every ball needs these values
  int posX;
  int posY;
  int speedX;
  int speedY;

  // create the ball object with starting values
  Ball() {
    posX = 0;
    posY = 0;
    speedX = 7;
    speedY = 10;
  }
  
  // move the ball and check its position
  void update() {
    posX += speedX;
    posY += speedY;
    
    if (posX >= width || posX <= 0) {
      speedX *= -1;
    }

    if (posY >= height || posY <=0) {
      speedY *= -1;
    }
  }

  // draw the ball
  void display() {
    ellipse( posX, posY, 50, 50 );
  }
  
}


class Rectangle { 
  
int Y = 700;
 int posX;
  int posY;
  int speedX;
  int speedY;
  
void update() {
    posX += speedX;
    posY += speedY;
    
    if (posX >= width || posX <= 0) {
      speedX *= -1;
    }

    if (posY >= height || posY <=0) {
      speedY *= -1;
    }
  }

  // draw the ball
void display() {
   rect(mouseX, Y, 200, 30);
  }
}
