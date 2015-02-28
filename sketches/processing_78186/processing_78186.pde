
// Study program for "A Lines"
// 2012/11/06 by 51n1

int startX, startY;
int directionX, directionY;

void setup() {
  size(500, 500);
  
  stroke(0);
  strokeWeight(1);
  
  init();
}

void init() {
  background(255);
  startX = 10;
  startY = height;
  directionX = 0;
  directionY = -1;
}

void draw() {
  if ( int(random(2)) == 0 ) {
    directionX = 1;
    directionY = 0;
  } else {
    directionX = 0;
    directionY = -1;
  }
  int endX = startX + directionX;
  int endY = startY + directionY;
  line(startX, startY, endX, endY);
  startX = endX;
  startY = endY;
  
  if ( startX > width || startY < 0 ) {
    init();
  }
}

void mousePressed() {
  init();
}
