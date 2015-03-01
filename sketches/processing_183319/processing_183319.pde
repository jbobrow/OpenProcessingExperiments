
int squarePositionX = 300;
int squarePositionY = 0;
int rightSide = 0;
int leftSide = 300;
int bottomSide = 0;
int topSide = 300;
boolean isGoingDown = true;
boolean isGoingLeft = true;

void setup() { 
 size (350, 350); 
}

void draw() {
  background (100, 75, 150);
  rect (squarePositionX, squarePositionY, 50, 50);
  fill(60, 12, 114);
  
  if (isGoingDown == true && isGoingLeft == true) {
      if (squarePositionY > bottomSide) {
        squarePositionY = squarePositionY - 2;  
      }
     else {
       isGoingDown = false; 
     }
  }
  else if (isGoingDown == false && isGoingLeft == true) {
    
    if (squarePositionX > rightSide) {
      squarePositionX = squarePositionX - 2;
    }
  else {
    isGoingLeft = false;
    }
  }
  else if (isGoingDown == false && isGoingLeft == false) {
   if (squarePositionY < topSide) {
     squarePositionY = squarePositionY + 2;
   }
   else { 
     isGoingDown = true;
     }
  } else {
    if (squarePositionX < leftSide) {
      squarePositionX = squarePositionX + 2;
    } else {
      isGoingLeft = true;
    }
  }   
  
}


