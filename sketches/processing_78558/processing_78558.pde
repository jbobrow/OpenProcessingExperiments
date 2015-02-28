
// 2D Graphic Program Study for "A Lines"
// Version 0.03
// 2012/11/10 by 51n1

int startX, startY;
int directionX, directionY;
int count;
int directionFlag;

void setup() {
  size(500, 500);
  background(255);
  initialize();
}

void draw() {
  if ( count % 10 == 0 ) {
    int randomFlag = int(random(3));
    if ( directionFlag == 0 ) { // top
      if ( randomFlag == 0 ) { // top
        directionX = 0;
        directionY = -1;
        directionFlag = 0;
      } else if ( randomFlag == 1 ) { // left
        directionX = -1;
        directionY = 0;
        directionFlag = 2;
      } else { // right
        directionX = 1;
        directionY = 0;
        directionFlag = 3;
      }
    } else if ( directionFlag == 1 ) { // bottom
      if ( randomFlag == 0 ) { // bottom
        directionX = 0;
        directionY = 1;
        directionFlag = 1;
      } else if ( randomFlag == 1 ) { // left
        directionX = -1;
        directionY = 0;
        directionFlag = 2;
      } else { // right
        directionX = 1;
        directionY = 0;
        directionFlag = 3;
      }
    } else if ( directionFlag == 2 ) { // left
      if ( randomFlag == 0 ) { // top
        directionX = 0;
        directionY = -1;
        directionFlag = 0;
      } else if ( randomFlag == 1 ) { // bottom
        directionX = 0;
        directionY = 1;
        directionFlag = 1;
      } else { // left
        directionX = -1;
        directionY = 0;
        directionFlag = 2;
      }
    } else { // right
      if ( randomFlag == 0 ) { // top
        directionX = 0;
        directionY = -1;
        directionFlag = 0;
      } else if ( randomFlag == 1 ) { // bottom
        directionX = 0;
        directionY = 1;
        directionFlag = 1;
      } else { // right
        directionX = 1;
        directionY = 0;
        directionFlag = 3;
      }
    }
  }
  
  int endX = startX + directionX;
  int endY = startY + directionY;
  line(startX, startY, endX, endY);
  startX = endX;
  startY = endY;
  count++;
  
  if ( count > 10 && ( startX > width - 1 || startX < 1 || startY > height - 1 || startY < 1 ) ) {
    initialize();
  }
}

void initialize() {
  count = 1;
  fill(255, 8);
  noStroke();
  rect(0, 0, width, height);
  stroke(0);
  strokeWeight(1);
  directionFlag = int(random(4));
  if ( directionFlag == 0 ) { // top
    startX = int(random(0, width));
    startY = height;
    directionX = 0;
    directionY = -1;
  } else if ( directionFlag == 1 ) { // bottom
    startX = int(random(0, width));
    startY = 0;
    directionX = 0;
    directionY = 1;
  } else if ( directionFlag == 2 ) { // left
    startX = width;
    startY = int(random(0, height));
    directionX = -1;
    directionY = 0;
  } else { // right
    startX = 0;
    startY = int(random(0, height));
    directionX = 1;
    directionY = 0;
  }
}
