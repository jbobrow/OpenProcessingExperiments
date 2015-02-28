
// Daniel Mastretta - Code Day 3
// The night of the [fucking] bouncing circles

int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int xSpeed1;
int ySpeed1;
int xSpeed2;
int ySpeed2;
int xSpeed3;
int ySpeed3;
int size1;
int size2;
int size3;

void setup() {
  size(600, 650);
  background(125);
  noStroke();

  x1=0;
  y1=0;
  x2=0;
  y2=0;
  x3=0;
  y3=0;
  xSpeed1=5;
  ySpeed1=9;
  xSpeed2=7;
  ySpeed2=4;
  xSpeed3=10;
  ySpeed3=12;
  size1=30;
  size2=30;
  size3=30;
}

void draw() {

  x1+=xSpeed1;
  x2+=xSpeed2;
  x3+=xSpeed3;
  y1+=ySpeed1;
  y2+=ySpeed2;
   y3+=ySpeed3;

// BLACK BALL MOVEMENT

  if (x1 >= 600) {
    xSpeed1*=-1;
  }

  if (x1 <= 0) {
    xSpeed1*=-1;
  }
  
  if (y1 >= 650) {
    ySpeed1*=-1;
  }

  if (y1 <= 0) {
    ySpeed1*=-1;
  }

// WHITE BALL MOVEMENT

  if (x2 >= 600) {
    xSpeed2*=-1;
  }

  if (x2 <= 0) {
    xSpeed2*=-1;
  }
  
  if (y2 >= 650) {
    ySpeed2*=-1;
  }

  if (y2 <= 0) {
    ySpeed2*=-1;
  }

// RED BALL MOVEMENT

  if (x3 >= 600) {
    xSpeed3*=-1;
  }

  if (x3 <= 0) {
    xSpeed3*=-1;
  }
  
  if (y3 >= 650) {
    ySpeed3*=-1;
  }

  if (y3 <= 0) {
    ySpeed3*=-1;
  }

  fill (0);
  ellipse(x1, y1, size1, size1);
  fill (255);
  ellipse(x2, y2, size2, size2);
  fill (255,00,00);
  ellipse(x3, y3, size3, size3);
}
