
int x = 60;
int y=60;

int speed = 10;

int state = 0;

void setup() {
  size(400, 400);
  background(100);
}

void draw() {
  //boudaries
  triangle(0, 0, 0, 100, 100, 0);
  triangle(300, 0, 400, 0, 400, 100);
  triangle(0, 300, 0, 400, 100, 400);
  triangle(400, 400, 400, 300, 300, 400);
  //the ball
  ellipse(x, y, 25, 25);
  //movement
  if (state ==0) {
    y=y+speed;
    if (y==340) {
      y=y;
      state=1;
    }
  } else if (state==1) {
    x=x+speed;
    if (x==340) {
      x=x;
      state=2;
    }
  } else if (state==2) {
    y=y-speed;
    if (y==60) {
      y=y;
      state=3;
    }
  } else if (state==3) {
    x=x-speed;
    if (x==60) {
      x=x;
      state=4;
    }
  }else if (state ==4) {
  background(100);
    //boudaries
  triangle(0, 0, 0, 100, 100, 0);
  triangle(300, 0, 400, 0, 400, 100);
  triangle(0, 300, 0, 400, 100, 400);
  triangle(400, 400, 400, 300, 300, 400);
  //the ball
  ellipse(x, y, 25, 25);
    y=y+speed;
    if (y==340) {
      y=y;
      state=5;
    }
  } else if (state==5) {
  background(100);
    //boudaries
  triangle(0, 0, 0, 100, 100, 0);
  triangle(300, 0, 400, 0, 400, 100);
  triangle(0, 300, 0, 400, 100, 400);
  triangle(400, 400, 400, 300, 300, 400);
  //the ball
  ellipse(x, y, 25, 25);
    x=x+speed;
    if (x==340) {
      x=x;
      state=6;
    }
  } else if (state==6) {
  background(100);
    //boudaries
  triangle(0, 0, 0, 100, 100, 0);
  triangle(300, 0, 400, 0, 400, 100);
  triangle(0, 300, 0, 400, 100, 400);
  triangle(400, 400, 400, 300, 300, 400);
  //the ball
  ellipse(x, y, 25, 25);
    y=y-speed;
    if (y==60) {
      y=y;
      state=7;
    }
  } else if (state==7) {
  background(100);
    //boudaries
  triangle(0, 0, 0, 100, 100, 0);
  triangle(300, 0, 400, 0, 400, 100);
  triangle(0, 300, 0, 400, 100, 400);
  triangle(400, 400, 400, 300, 300, 400);
  //the ball
  ellipse(x, y, 25, 25);
    x=x-speed;
    if (x==60) {
      x=x;
      state=0;
    }
  }
}
