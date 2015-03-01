
int squareXPosition = 200;
int squareYPosition;
int square2XPosition;
int square2YPosition = 400;
int ellipseXPosition = 0;
int ellipseYPosition = 0;
int topEdge = 400;
int bottomEdge = 0;
int rightEdge = 400;
int leftEdge = 0;
boolean isMovingRight = true;
boolean is2MovingRight = true;
boolean isMovingDown = true;

void setup() {
  size(400,400);
  ellipseXPosition = height/2;
  squareXPosition = height/2;
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  background(#226737);
  if (isMovingDown){
    if(ellipseYPosition < topEdge){
      ellipseYPosition = ellipseYPosition + 2;
    } else {
     isMovingDown = false;
    }
  } else {
      if(ellipseYPosition > bottomEdge) {
      ellipseYPosition = ellipseYPosition - 2;
      } else {
        isMovingDown = true;
      }
  }
  
  if (isMovingRight){
    if(squareXPosition < rightEdge){
      squareXPosition = squareXPosition + 2;
    } else {
     isMovingRight = false;
    }
  } else {
      if(squareXPosition > leftEdge) {
      squareXPosition = squareXPosition - 2;
      } else {
        isMovingRight = true;
      }
  }
   
  
   if (is2MovingRight){
    if(square2XPosition < rightEdge){
      square2XPosition = square2XPosition + 1;
    } else {
     is2MovingRight = false;
    }
  } else {
      if(square2XPosition > leftEdge) {
      square2XPosition = square2XPosition - 1;
      } else {
        is2MovingRight = true;
      }
  }
  
  fill (#ffff00);
  ellipse(ellipseXPosition, ellipseYPosition, 20,20);
  fill (255);
  noStroke ();
  rect(squareXPosition, squareYPosition, 60,20);
  rect(square2XPosition, square2YPosition, 60,20);
  stroke (255);
  noFill ();
  rect(0,0, 799,399);
  rect(0,0, 799,799);
}


