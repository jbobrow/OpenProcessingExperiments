
float x1=0;
float x2=0;
float x3=0;
float y1=100;
float y2=100;
float y3=100;
float x_speed1=5;
float x_speed2=6;
float x_speed3=7;
float carsize=40;
float wheelsize=carsize/4;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(mouseX,0,mouseY);
  move1();
  move2();
  move3();

  bounce1();
  bounce2();
  bounce3();

  display1(x1, y1+20, carsize+10);
  display2(x2, y2+70, carsize);
  display3(x3, y3+125, carsize+20);
}

void move1() {
  x1+=x_speed1;
}

void move2() {
  x2+=x_speed2;
}

void move3() {
  x3+=x_speed3;
}

void bounce1() {
  if ((x1>=width)||(x1<=0)) {
    x_speed1=x_speed1*-1;
  }
}

void bounce2() {
  if ((x2>=width)||(x2<=0)) {
    x_speed2=x_speed2*-1;
  }
}

void bounce3() {
  if ((x3>=width)||(x3<=0)) {
    x_speed3=x_speed3*-1;
  }
}


void display1(float x1, float y1, float carsize) {
  rectMode(CENTER);
  float wheelsize=carsize/4;

  stroke(255);
  fill(random(255), 0, 0);
  rect(x1, y1, carsize, carsize/2);
  rect(x1-wheelsize, y1-wheelsize, wheelsize, wheelsize/2);
  rect(x1+wheelsize, y1-wheelsize, wheelsize, wheelsize/2);
  rect(x1-wheelsize, y1+wheelsize, wheelsize, wheelsize/2);
  rect(x1+wheelsize, y1+wheelsize, wheelsize, wheelsize/2);
}

void display2(float x2, float y2, float carsize) {
  rectMode(CENTER);
  float wheelsize=carsize/4;

  stroke(255);
  fill(random(255), 0, 0);
  rect(x2, y2, carsize, carsize/2);
  rect(x2-wheelsize, y2-wheelsize, wheelsize, wheelsize/2);
  rect(x2+wheelsize, y2-wheelsize, wheelsize, wheelsize/2);
  rect(x2-wheelsize, y2+wheelsize, wheelsize, wheelsize/2);
  rect(x2+wheelsize, y2+wheelsize, wheelsize, wheelsize/2);
}

void display3(float x3, float y3, float carsize) {
  rectMode(CENTER);
  float wheelsize=carsize/4;

  stroke(255);
  fill(random(255), 0, 0);
  rect(x3, y3, carsize, carsize/2);
  rect(x3-wheelsize, y3-wheelsize, wheelsize, wheelsize/2);
  rect(x3+wheelsize, y3-wheelsize, wheelsize, wheelsize/2);
  rect(x3-wheelsize, y3+wheelsize, wheelsize, wheelsize/2);
  rect(x3+wheelsize, y3+wheelsize, wheelsize, wheelsize/2);
}

