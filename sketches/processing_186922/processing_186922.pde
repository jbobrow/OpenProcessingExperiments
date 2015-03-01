
int squareXPosition;
int squareYPosition;
 
int rightEdge = 360;
int leftEdge = 0;
int topEdge = 0;
int bottomEdge = 360;
 
boolean isMovingRight = true;
boolean isMovingUp = true;
 
void setup() {
  size(400, 400);
  squareXPosition = 0;
  squareYPosition = 360;
}
 
void draw() {
  background (250);
 
  if (isMovingRight == true && isMovingUp == true) {
    if (squareXPosition < rightEdge) {
      squareXPosition = squareXPosition + 3;
       
    } else {
      isMovingRight = false;
    }
  } else if (isMovingRight == false && isMovingUp == true) {
 
    if (squareYPosition > topEdge) {
      squareYPosition = squareYPosition - 3;
    } else {
      //turn around
      isMovingUp = false;
    }
  } else if (isMovingRight == false && isMovingUp == false) {
      if (squareXPosition > leftEdge) {
        squareXPosition = squareXPosition - 3;
      } else {
          isMovingRight = true;
      }
  } else {
      if (squareYPosition < bottomEdge) {
        squareYPosition = squareYPosition + 3;
      } else {
         isMovingUp = true;
      }
  }
 
  fill (100);
  stroke(0);
  strokeWeight(1);
  rect(squareXPosition, squareYPosition, 39, 39);
}



