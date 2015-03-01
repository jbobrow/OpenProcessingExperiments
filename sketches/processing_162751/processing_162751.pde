
//declare variable to hold sqaure instance
Square movingSquare;
int index;

void setup() {
  size(500, 500);
  background(0);

  //initialize the Square instance
  movingSquare = new Square(0, height/2-25, 50);
}

void draw() {
  index = 0;

  //blank the background
  background(0); 
  
  movingSquare.display();
  movingSquare.updatePosition();
}
//class definition for Squares
class Square {
  /*--------------------Properties--------------------*/
  float xSquare; //xposition of the Square
  float ySquare; //y position of the Square
  int sizeSquare; //size of the Square
  float easing = 0.05; //amount of ease
  color fillColor = color(255, 128, 0);
  color strokeColor = fillColor;
  boolean movingRight = true;
  float distanceX;
  float easeX;

  /*----------------------Methods---------------------*/
  //create constructor method
  public Square(float newX, float newY, int newSize) {
    //assign properties
    xSquare = newX;
    ySquare = newY;
    sizeSquare = newSize;
  }

  //create display method
  public void display() {
    rectMode(CORNER);
    fill(fillColor);
    stroke(strokeColor);
    rect(xSquare, ySquare, sizeSquare, sizeSquare);
  }

  //create method that move square along x-axis and wraps back to beginning 
  public void updatePosition() {
    //calculate the distance between the square and target
    float distanceX = width - xSquare;
    //ease toward the target
    float easeX = distanceX * easing;
    //if the square is moving right...
    if (movingRight) {
      //if the square is within the canvas...
      if (xSquare + sizeSquare  < width) {
        xSquare += easeX; //increase x position by easeX
      }
      //otherwise...
      else {
        xSquare = width - sizeSquare;
        movingRight = false; //change direction to left
      }
    }
    //otherwise...
    else {
      //calculate the distance between the square and target
      distanceX = xSquare;
      //ease toward the target
      easeX = distanceX * easing;
      //if square is within canvas...
      if (xSquare - easeX > 0.5) {
        xSquare -= easeX; //decrease x position by easeX
      }
      //otherwise...
      else {
        xSquare = 0;
        movingRight = true; //change direction to right
      }
    }
  }
}



