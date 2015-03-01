
Ball[] manyBall;
int number=80;
float gravity=1.5;
boolean gravityEvent=false;


void setup() {
  size(500, 600);
  frameRate(30);
  manyBall=new Ball[number];

  //appear at one time
  for (int i=0; i<manyBall.length; i++) {
    manyBall[i]=new Ball(int(random(width)), int(random(height)), int(random(-5, 5)), int(random(-5, 5)));
  }
}

void draw() {
  background(0);
  if (gravityEvent==false) {
    for (int i=0; i<manyBall.length; i++) {
      manyBall[i].drawIt();
      manyBall[i].move();
      manyBall[i].checkStuff();
    }
  } else {
    for (int i=0; i<manyBall.length; i++) {
      manyBall[i].drawIt();
      manyBall[i].move();
      manyBall[i].gravity();
    }
  }
}

void mousePressed() {
  gravityEvent=true;
}

void mouseReleased() {
  gravityEvent=false;
  manyBall=new Ball[number];

  //appear at one time
  for (int i=0; i<manyBall.length; i++) {
    manyBall[i]=new Ball(int(random(width)), int(random(height)), int(random(-5, 5)), int(random(-5, 5))); //ball appear at random place within canvas
  }
}



class Ball {
  float x;
  float y;
  float xdir;
  float ydir;
  float diameter=10;

  Ball(int tx, int ty, int txdir, int tydir) {
    x=tx;
    y=ty;
    xdir=txdir;
    ydir=tydir;
  }

  void drawIt() {
    int bcolor=color(random(255), random(255), random(255));
    fill(bcolor, 100);
    stroke(bcolor);
    ellipse(x, y, diameter+10, diameter+10);
    ellipse(x, y, diameter, diameter);
  }

  void move() {
    y=y-ydir;
    x=x-xdir;
  }

  void gravity() {
    ydir=ydir+gravity;
    xdir=xdir+gravity/2;
  }


  void checkStuff() {
    if (y<0 || y>height) {
      ydir=-ydir;
    }
    if (x<0 || x>width) {
      xdir=-xdir;
    }
  }

  //  void collide() {
  //    for (int i=0; i<manyBall.length; i++) {
  //      float d=dist(manyBall[i].x, manyBall[i].x, manyBall[i].y, manyBall[i].y);
  //      if (d<10) {
  //        noFill();
  //              ellipse(manyBall[i].x, manyBall[i].y, 20, 20);
  //              ellipse(manyBall[i].x, manyBall[i].y, 20, 20);
  //      }
  //    }
  //  }
}



