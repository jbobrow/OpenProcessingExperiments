
//ben norskov
//in class arraylist + class
//13-11-2012

Ball gregory;
Ball billy;

ArrayList balls = new ArrayList();

int lastSec = 0;
void setup() {
  size(700, 500);
  gregory = new Ball(150, 0);
  billy = new Ball(100, 20);
  balls.add(gregory);
  balls.add(billy);
}

void draw() {
  background(200);
  // move the ball function
  //  gregory.move();
  //  // draw the ball function
  //  gregory.display();
  //  
  //  billy.move();
  //  billy.display();
  //  Ball tempB = (Ball) balls.get(0);
  //  tempB.move();
  //  tempB.display();
  //  Ball tempB2 = (Ball) balls.get(1);
  //  tempB2.move();
  //  tempB2.display();
  if (lastSec != second()) {
    lastSec = second();
    Ball b = new Ball(mouseX, mouseY);
    balls.add(b);
  }

  for (int i=0; i<balls.size(); i++) {
    Ball tempB = (Ball) balls.get(i);
    tempB.move();
    tempB.display();
  }
}

void mousePressed() {
}

void keyPressed() {
  balls.remove(0);
  //WATCH FOR OUT OF INDEX ARRAY ERRORS!
}

class Ball {
  float x;
  float y;//ball's position

  float y_speed;
  float gravity = .5;
  Ball (float init_x, float init_y) {
    x = init_x;
    y = init_y;
  }
  void move() {
    if(y<height-11) {
    y += y_speed;
    y_speed += gravity;
    } else {
      y = height-10;
    }
//    if (y > height) {
//      y = random(100) - 100; 
//      x = random(width);
//      y_speed = 0;
//    }
  }
  void display() {
    fill(0, 100, 200);
    ellipse(x, y, 20, 20);
  }
}
