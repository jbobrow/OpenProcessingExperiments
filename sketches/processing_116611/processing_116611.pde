
Robot myRobot;
Robot notMyRobot;

void setup() {
  size(1000, 500);
  myRobot= new Robot(color(random(255)), height-30, width/2, 3);
  notMyRobot= new Robot(color(random(255)), height-50, width/3, 2);
}

void draw() {
  background(random(255), random(255), random(255));
  myRobot.move();
  myRobot.display();
  notMyRobot.move();
  notMyRobot.display();
}

class Robot {
  color c;
  int eye;
  float x;
  float y;
  float xspeed;
  float xacc;
  float size=2;

  Robot(color tempc, float tempy, float tempx, float tempxspeed) {
    c=tempc;
    x=tempx;
    y=tempy;
    xspeed=tempxspeed;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    //eyestalks
    rect(x+5*size, y-10*size, 5*size, 10*size);
    rect(x-5*size, y-10*size, 5*size, 10*size);

    //body
    rect(x, y+25, 10*size, 2*size);
    rect(x, y+20, 15*size, 5*size);
    rect(x, y+10, 18*size, 8*size);
    rect(x, y, 20*size, 10*size);



    //eye color/flashing
    fill(eye, 0, 0);
    eye=eye+5;
    if (eye>255) {
      eye=0;
    }
    //eyes
    ellipse(x+5*size, y-12*size, 7*size, 7*size);
    ellipse(x-5*size, y-12*size, 7*size, 7*size);
  }

  void move() {
    if (x>mouseX)
    {
      x=x-xspeed;
    }
    if (x<mouseX) {
      x=x+xspeed;
    }

    if (y>mouseY) {
      y=y-xspeed;
    }
    if (y<mouseY) {
      y=y+xspeed;
    }
  }
}
