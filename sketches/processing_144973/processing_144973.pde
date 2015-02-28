
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Your Name
// ID: Your ID number

int x = 0;
int y = 0;
int xSpeed = 3;
int ySpeed = 2;
float mPos = 0;
float diameter = 30;

void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  background(255);
  x = x + xSpeed;
  y = y + ySpeed;
  mPos = mPos + 6;

  if ((x > width) || (x < 2)) {
    xSpeed = xSpeed * -1;
  }
  if ((y > height) || (y < 0)) { 
    ySpeed = ySpeed * -1;
  }

  if (mPos > height + diameter) {
    mPos = -diameter;
  }
  stroke(0);
  fill(x, y, 100, 50);
  rect(x, y, width-x, height-y);
  fill(y,x,0,100);
  rect(y,x,50,50);
  fill(y, 0, x, 100);
  quad(width-x, 0, 0, height, 200, y, width-x, height-y);
  fill(x,y,0,30);
  quad(width-x,200,100,height,0,y,width-x, height -y);
  rect(x,y,300,300);
  fill(x, 100, 10, y);
  line(x, y, 300, 300);
  fill(random(255), random(255), random(255), 50);
  ellipse (width/2, mPos, diameter, diameter);
}

