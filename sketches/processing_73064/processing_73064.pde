
int mover = 0;
int moverup = 420;


void setup() {
  size(460, 420);
  smooth();
}

void draw() {

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  if (h < 12) {
    background(252-mover/2, 239-mover/2, 231-mover/2);
  }
  else {
    background(79+mover/2, 196+mover/2, 252+mover/2);
  }


  noStroke();
  //teal rectangle
  fill(41, 134, 116, mover/2);
  rect(40, 40, 380, 340);

  //lg grey rectangle
  fill(80);
  rect(55, 95, 350, 240);

  //cream rectangle
  fill(252, 239, 231);
  rect(85, 145, 305, 150);

  //transp. rect top
  fill(10, 80);
  rect(55, 120, 350, 52);

  //transp L
  rect(96, 200, 80, 135);

  //transp Middle
  rect(176, 282, 119, 53);

  //transp R
  rect(295, 200, 67, 135);

  //small rect L
  //moves down at speed according to second
  mover = mover + s/10;
  fill(100-mover/5);
  rect(125, mover, 26, 52);

  //small rect R
  //moves up at speed according to second
  moverup = moverup - s/10;
  fill(100-moverup/5);
  rect(308, moverup, 24, 52);

  //set bounds
  if (mover > height) {
    mover = 0;
  }
  if (moverup < 0) {
    moverup = height;
  }
}
