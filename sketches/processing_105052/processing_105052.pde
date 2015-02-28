
int x;
int y;
int xSpeed;
int ySpeed;

int x1;
int y1;
int xSpeed1;
int ySpeed1;

int x2;
int y2;
int xSpeed2;
int ySpeed2;

int x3;
int y3;
int xSpeed3;
int ySpeed3;

int x4;
int y4;
int xSpeed4;
int ySpeed4;

int x5;
int y5;
int xSpeed5;
int ySpeed5;

void setup() {
  size(800, 600);
  smooth();
  noStroke();

  //start ball
  x=400;
  y=0;

  //set initial speed
  xSpeed=0;
  ySpeed=2;

  //start ball1
  x1=0;
  y1=400;

  xSpeed1=4;
  ySpeed1=0;

  //start ball1
  x2=0;
  y2=50;

  xSpeed2=7;
  ySpeed2=7;

  //start ball1
  x3=600;
  y3=150;

  xSpeed3=7;
  ySpeed3=7;

  //start ball1
  x4=300;
  y4=550;

  xSpeed4=12;
  ySpeed4=7;

  //start rect
  x5=700;
  y5=250;

  xSpeed5=4;
  ySpeed5=4;
}

void draw() { 
  background(239, 237, 29); 

  //position changes
  x = x + xSpeed;
  y = y + ySpeed;

  x1 = x1 + xSpeed1;
  y1 = y1 + ySpeed1;

  x2 = x2 + xSpeed2;
  y2 = y2 + ySpeed2;

  x3 = x3 + xSpeed3;
  y3 = y3 + ySpeed3;

  x4 = x4 + xSpeed4;
  y4 = y4 + ySpeed4;

  x5 = x5 + xSpeed5;
  y5 = y5 + ySpeed5;


  if (x >= width) {
    xSpeed = xSpeed * -1;
  }

  //left boundary
  if (x<= 0) { 
    xSpeed = xSpeed * -1;
  }

  //top boundary
  if (y>= 0) { 
    ySpeed = ySpeed * -1;
  }

  //bottom boundary
  if (y<= 550) {
    ySpeed = ySpeed * -1;
  }


  //ball1


    if (x1 >= 700) {
    xSpeed1 = xSpeed1 * -1;
  }

  //left boundary
  if (x1<= 0) { 
    xSpeed1 = xSpeed1 * -1;
  }

  //top boundary
  if (y1>= width) { 
    ySpeed1 = ySpeed1 * -1;
  }

  //bottom boundary
  if (y1<= 0) {
    ySpeed1 = ySpeed1 * -1;
  }


  //ball2


  if (x2 >= width) {
    xSpeed2 = xSpeed2 * -1;
  }

  //left boundary
  if (x2<= 0) { 
    xSpeed2 = xSpeed2 * -1;
  }

  //top boundary
  if (y2>= height) { 
    ySpeed2 = ySpeed2 * -1;
  }

  //bottom boundary
  if (y2<= 0) {
    ySpeed2 = ySpeed2 * -1;
  }


  //ball3


  if (x3 >= width) {
    xSpeed3 = xSpeed3 * -1;
  }

  //left boundary
  if (x3<= 0) { 
    xSpeed3 = xSpeed3 * -1;
  }

  //top boundary
  if (y3>= height) { 
    ySpeed3 = ySpeed3 * -1;
  }

  //bottom boundary
  if (y3<= 0) {
    ySpeed3 = ySpeed3 * -1;
  }

  //ball4


  if (x4 >= width) {
    xSpeed4 = xSpeed4 * -1;
  }

  //left boundary
  if (x4<= 0) { 
    xSpeed4 = xSpeed4 * -1;
  }

  //top boundary
  if (y4>= height) { 
    ySpeed4 = ySpeed4 * -1;
  }

  //bottom boundary
  if (y4<= 0) {
    ySpeed4 = ySpeed4 * -1;
  }


  //rect


  if (x5 >= width) {
    xSpeed5 = xSpeed5 * -1;
  }

  //left boundary
  if (x5<= 0) { 
    xSpeed5 = xSpeed5 * -1;
  }

  //top boundary
  if (y5>= height) { 
    ySpeed5 = ySpeed5 * -1;
  }

  //bottom boundary
  if (y5<= 0) {
    ySpeed5 = ySpeed5 * -1;
  }





  if (x4<= width/2) {
    fill(52, 132, 183, 255);
  } 
  else {
    fill(255, 255, 255, 188);
  }


  ellipse(mouseX, mouseY, 350, 350);
  fill (116, 24, 119, 255);
  ellipse(x2, y2, 50, 50);
  ellipse(x3, y3, 50, 50);

  fill (52, 132, 183, 255);
  ellipse(x4, y4, 25, 25);

  fill (198, 195, 196, 220);
  ellipse(x, y, 100, 100);
  ellipse(x1, y1, 200, 200);

  fill(255, 255, 255, 150);
  rect(x5, y5, 105, 105);
}
