

int squareXPosition = 50;
int squareYPosition;
int squareSpeed = 1;


float leftEdge;
float rightEdge;
float upperEdge;
float lowerEdge;
String currentState;

void setup(){
  
  size (400,400);
   squareYPosition = 50;
  rectMode (CENTER);
  
  leftEdge = 50;
    rightEdge = 350;
    upperEdge = 50;
    lowerEdge = 350;
    currentState= "movingRight";
    
}



void draw(){

  if (currentState == "movingRight"){
  if(squareXPosition >= rightEdge) {
    currentState= "movingDown";
    rightEdge = rightEdge -10;
    //move right
  } else {
    squareXPosition = squareXPosition + squareSpeed;
    fill(255,153, 0);
  }
  } else if (currentState == "movingDown"){
    if (squareYPosition >= lowerEdge){
      currentState = "movingLeft";
      lowerEdge = lowerEdge -10;
    } else{
        squareYPosition = squareYPosition + squareSpeed;
        fill(0,0, 255);
    }
  } else if (currentState == "movingLeft"){
    if (squareXPosition <= leftEdge){
      currentState = "movingUp";
      leftEdge = leftEdge + 10;
    } else {
      squareXPosition = squareXPosition - squareSpeed;
      fill(0,136,0);
    }
  } else if (currentState == "movingUp"){
    if (squareYPosition <= upperEdge){
      currentState = "movingRight";
      upperEdge = upperEdge +10;
      squareSpeed = squareSpeed + 1;
    } else {
      squareYPosition = squareYPosition - squareSpeed;
      fill(255,0,0);
    }
  }
  
  rect(squareXPosition, squareYPosition, 40, 40);
 // squareSpeed = squareSpeed + 1;

}


