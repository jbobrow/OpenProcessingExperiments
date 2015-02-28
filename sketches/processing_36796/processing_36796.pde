
//producing a varying grid

void setup() {
  size(300, 300);
  smooth();
}

//these variables tell the line where to draw
float x; 
float y;
float a;
float b;
int drawLines = 5; //how many possible lines can be drawn


void draw() {

  if (drawLines > 0) {

    fill(0);
    ellipse(width/2, height/2, 10, 10);

    x = random(1, 4);  //random position
    y = random(1, 4);
    a = random(1, 3);
    b = random(1, 3);
    int xDirection = int(x); //makes the random number easier to work with
    int yDirection = int(y);
    int nextCoordX = int(a);
    int nextCoordY = int(b);

    //the following series of if statements converts the random ints
    //into coordnates which can be used to draw lines

    //producing the central grid
    if (xDirection == 1) {
      xDirection = 100;
    }
    if (xDirection == 2) {
      xDirection = 150;
    }
    if (xDirection == 3) {
      xDirection = 200;
    }
    if (yDirection == 1) {
      yDirection = 100;
    }
    if (yDirection == 2) {
      yDirection = 150;
    }
    if (yDirection == 3) {
      yDirection = 200;
    }
    //draws the first, inner set of lines and nodes
    strokeWeight(5);
    line(width/2, height/2, xDirection, yDirection);
    ellipse(xDirection, yDirection, 5, 5);

    //starts the next series of lines spawning off
    //the last set of grid lines
    if (nextCoordX == 1) {
      nextCoordX = 50;
    }
    else {
      nextCoordX = -50;
    }
    if (nextCoordY == 1) {
      nextCoordY = 50;
    }
    else {
      nextCoordY = -50;
    }

    int nextPosX = xDirection+nextCoordX;
    int nextPosY = yDirection+nextCoordY;

    //draws the second set of lines
    strokeWeight(3);
    line(xDirection, yDirection, nextPosX, nextPosY);
    ellipse(nextPosX, nextPosY, 3, 3);

    //starts the next series of lines spawning off
    //the last set of grid lines
    if (nextCoordX == 1) {
      nextCoordX = -50;
    }
    else {
      nextCoordX = 50;
    }
    if (nextCoordY == 1) {
      nextCoordY = -50;
    }
    else {
      nextCoordY = 50;
    }

    int nextNextPosX = xDirection+nextCoordX;
    int nextNextPosY = yDirection+nextCoordY;

    //starts the last and most outer set of lines
    strokeWeight(1);
    line(nextPosX, nextPosY, nextNextPosX, nextNextPosY);
    ellipse(nextNextPosX, nextNextPosY, 2, 2);
  }
  drawLines--;
}


