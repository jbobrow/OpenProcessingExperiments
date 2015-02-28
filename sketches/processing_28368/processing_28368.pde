
/*

 Jack Kirkpatrick
 Assignment 02
 
 */

int arraySize=8;
int[][] squares = new int[arraySize][arraySize];
int clickX;
int clickY;
int centerX;
int centerY;
float centerRad;

void setup() {
  size(890,890);
  for (int i=0;i<arraySize;i++) {
    for (int j=0;j<arraySize;j++) {
      squares[i][j] = 20;
    }
  }
  clickX = -1;
  clickY = -1;
  centerX = 0;
  centerY = 0;
  centerRad = 0;
}

void draw() {
  background(0);
  for (int i=0;i<8;i++) {
    for (int j=0;j<8;j++) {
      drawRects(i, j);
      drawCircle(i, j);
    }
  }
}

void mousePressed() {
  for (int i=0;i<8;i++) {
    for (int j=0;j<8;j++) {
      squares[i][j] = 20;
    }
  }  
  clickX=mouseX;
  clickY=mouseY;
}

void drawCircle(int x, int y) {
  if(clickX > -1) {
    centerRad += 0.8;
    if (inCircle(x, y) && squares[x][y] == 20) {
      squares[x][y] = 255;
    }
  }
  if (centerRad>height+300) {
    //println("END");
    centerRad = 0;
    clickX = -1;
    clickY = -1;
  }
}

boolean inCircle(int x, int y) {
  int newX = clickX - (60+x*10+x*100);
  int newY = clickY - (60+y*10+y*100);
  float rad = sqrt(newX*newX + newY*newY);
  //println(rad);
  if (rad <= centerRad)
    return true;
  else
    return false;
}

void drawRects(int x, int y) {
  //check mouse position
  if (mouseX > (10+x*10+x*100) && mouseX < (10+x*10+x*100)+100) {
    if (mouseY > (10+y*10+y*100) && mouseY < (10+y*10+y*100)+100) {
      squares[x][y] = 255;
    }
    else {
      if (squares[x][y] > 20)
        squares[x][y] -= 8;
      else
        squares[x][y] = 20;
    }
  }
  else {
    if (squares[x][y] > 20)
      squares[x][y] -= 8;
    else
      squares[x][y] = 20;
  }
  //draw rectangles
  fill(squares[x][y]);
  rect(10+x*10+x*100,10+y*10+y*100,100,100);
}


