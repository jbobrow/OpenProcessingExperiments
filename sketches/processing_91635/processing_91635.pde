
SpinSquare[][] mySquare;
int numberOfCircle=3;
int numberOfSquare=30;
color gridColor;
Ysquare[][] yAxisSquare;
int squareOnY=5;
int col=10;
Xsquare[][] xAxisSquare;
int squareOnX=20;
int row = 10;

void setup() {
  size(800, 600);
  gridColor=color (93, 176, 214);
  mySquare= new SpinSquare[numberOfCircle][numberOfSquare];
  yAxisSquare = new Ysquare[col][squareOnY];
  xAxisSquare = new Xsquare[row][squareOnX];
  for (int i = 1;i<col;i++) {
    //i starts from 1 because 0 is attached to the left side of the window
    for (int j = 0;j<squareOnY;j++) {
      yAxisSquare[i][j] = new Ysquare(width/col*i, height/2, color(random(150, 255), random(0, 100), random(0, 100)), random(2, 6), random(1, 5)*pow(-1, j));
      //pow(-1,i) -1 is the base, i is the number of times that -1 times itself.
      //so that the speed is either positive or negative
      //which decides the direction of the squares moving on y axis
    }
  }
  for (int i = 1;i<row;i++) {
    for (int j = 0;j<squareOnX;j++) {
      xAxisSquare[i][j] = new Xsquare(width/2, height/row*i, color(random(0, 100), random(150, 255), random(0, 100)), random(2, 6), random(1, 5)*pow(-1, j));
    }
  }
  for (int i=0;i<numberOfCircle;i++) {    
    for (int j=0;j<numberOfSquare;j++) {
      mySquare[i][j]= new SpinSquare(8*sq(i+1), sq(i+1), color(random(0, 100), random(0, 100), random(100, 255)), PI*3/2, 0.01*random(1, 5));
    }
  }
}


void draw() {
  displayBackground();
  for (int i = 1;i <col;i++) {
    for (int j = 0;j<squareOnY;j++) {
      yAxisSquare[i][j].display();
      yAxisSquare[i][j] .move();
    }
  }
  for (int i = 1;i<row;i++) {
    for (int j = 0;j<squareOnX;j++) {
      xAxisSquare[i][j].display();
      xAxisSquare[i][j] .move();
    }
  }
  pushMatrix();
  translate(width/2, height/2);//the position of the spinning center
  for (int i=0;i<numberOfCircle;i++) {  
    for (int j=0;j<numberOfSquare;j++) {
      mySquare[i][j].display();
      mySquare[i][j].spin();
    }
  }
  popMatrix();
}

void displayBackground() 
{
  background(255);
  stroke(gridColor);
  strokeWeight(0.2);
  line(0, 0, width, height);
  for (int x = 0; x<width;x+=width/col) {
    line(x, 0, x, height);
  }
  for (int y = 0; y<height;y+=height/row) {
    line(0, y, width, y);
  }
}

class SpinSquare {
  float distance;//the distance to the center
  float sideLength;//the size of the suare
  color sColor;
  float angle;//where the spin starts
  float angleChange; //decide the speed of spinning
  float xPosition;//the position of the square caculated by the angle and distance
  float yPosition;


  SpinSquare (float distance_, float sideLength_, color sColor_, float angle_, float angleChange_) {
    distance=distance_;
    sideLength=sideLength_;
    sColor=sColor_;
    angle=angle_;
    angleChange=angleChange_;
  }

  void display() {
    xPosition=cos(angle)*distance;
    yPosition=sin(angle)*distance;
    pushMatrix();
    noStroke();
    fill(sColor);
    translate(xPosition, yPosition);
    rectMode(CENTER);
    rect(0, 0, sideLength, sideLength);
    popMatrix();
  }

  void spin() {
    angle=angle+angleChange;
  }
}

class Xsquare {
  float xPosition;
  float yPosition;
  color squareColor;
  float sideLength;
  float speed;

  Xsquare (float xPosition_, float yPosition_, color squareColor_, float sideLength_, float speed_) {
    xPosition=xPosition_;
    yPosition=yPosition_;
    squareColor=squareColor_;
    sideLength=sideLength_;
    speed=speed_;
  }

  void display() {
    pushMatrix();
    translate(xPosition, yPosition);
    noStroke();
    fill(squareColor);
    rectMode(CORNER);
    rect(0, 0, sideLength, sideLength);
    popMatrix();
  }
  void move() {
    xPosition=xPosition+speed;
    if (xPosition<0) {
      xPosition=width;
    }
    if (xPosition>width) {
      xPosition=0;
    }
  }
}

class Ysquare {
  float xPosition;
  float yPosition;
  color squareColor;
  float sideLength;
  float speed;

  Ysquare (float xPosition_, float yPosition_, color squareColor_, float sideLength_, float speed_) {
    xPosition=xPosition_;
    yPosition=yPosition_;
    squareColor=squareColor_;
    sideLength=sideLength_;
    speed=speed_;
  }

  void display() {
    pushMatrix();
    translate(xPosition, yPosition);
    noStroke();
    fill(squareColor);
    rectMode(CORNER);
    rect(0, 0, sideLength, sideLength);
    popMatrix();
  }
  void move() {
    yPosition=yPosition+speed;
    if (yPosition<0) {
      yPosition=height;
    }
    if (yPosition>height) {
      yPosition=0;
    }
  }
}



