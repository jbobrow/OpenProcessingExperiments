

float x1=270;
float x2=350;
float x3=80;
float y1=100;
float y2=200;
float y3=330;
float carsize =64;
float x_speed1 = 2;
float x_speed2 = 10;
float x_speed3 = 5;
float wheel =carsize/4;

void setup() {
  size(400, 400);
}


void draw() {
  background(44, 41, 255);
  move1();
  move2();
  move3();
  bounce1();
  bounce2();
  bounce3();
  drawCar1(x1, y1, carsize+80);
  drawCar2(x2, y2, carsize);
  drawCar3(x3, y3, carsize+30);
}  

void move1() {
  x1=x1+x_speed1;
}

void bounce1() {
  if ((x1 > width)||(x1<0)) {
    x_speed1 = x_speed1*-1;
  }
}


void drawCar1(float x1, float y1, float carsize) {
  rectMode(CENTER);
  float wheel =carsize/4;
  fill(255, 13, 13);
  rect(x1, y1, carsize, carsize/2);  
  fill(0);
  rect(x1-wheel, y1-wheel, wheel, wheel/2);
  rect(x1+wheel, y1-wheel, wheel, wheel/2);
  rect(x1-wheel, y1+wheel, wheel, wheel/2);
  rect(x1+wheel, y1+wheel, wheel, wheel/2);
}



void move2() {
  x2=x2+x_speed2;
}

void bounce2() {
  if ((x2 > width)||(x2<0)) {
    x_speed2 = x_speed2*-1;
  }
}


void drawCar2(float x2, float y2, float carsize) {
  rectMode(CENTER);
  float wheel =carsize/4;
  fill(250, 255, 3);
  rect(x2, y2, carsize, carsize/2);  
  fill(0);
  rect(x2-wheel, y2-wheel, wheel, wheel/2);
  rect(x2+wheel, y2-wheel, wheel, wheel/2);
  rect(x2-wheel, y2+wheel, wheel, wheel/2);
  rect(x2+wheel, y2+wheel, wheel, wheel/2);
}



void move3() {
  x3=x3+x_speed3;
}

void bounce3() {
  if ((x3 > width)||(x3<0)) {
    x_speed3 = x_speed3*-1;
  }
}


void drawCar3(float x3, float y3, float carsize) {
  rectMode(CENTER);
  float wheel =carsize/4;
  fill(3, 255, 42);
  rect(x3, y3, carsize, carsize/2);  
  fill(0);
  rect(x3-wheel, y3-wheel, wheel, wheel/2);
  rect(x3+wheel, y3-wheel, wheel, wheel/2);
  rect(x3-wheel, y3+wheel, wheel, wheel/2);
  rect(x3+wheel, y3+wheel, wheel, wheel/2);
}

