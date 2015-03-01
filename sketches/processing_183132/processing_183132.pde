
int squareXPosition = 100;
int squareYPosition;

int rightEdge = 375;
int leftEdge = 125;

boolean isMovingRight = true;

void setup() {
  size(500,500);
  squareYPosition = height/2;
  rectMode(CENTER);
}

void draw() {
  background(50,100,200);
  fill(255);
  rect(100,250,10,100);
  rect(400,250,10,100);
  if (isMovingRight){
    if(squareXPosition < rightEdge){
      squareXPosition = squareXPosition + 5;
    } else {
     isMovingRight = false;
    }
  } else {
      if(squareXPosition > leftEdge) {
      squareXPosition = squareXPosition - 5;
      } else {
        isMovingRight = true;
      }
  }
  fill(255,0,0);
  ellipse(squareXPosition, squareYPosition, 40,40);
}


