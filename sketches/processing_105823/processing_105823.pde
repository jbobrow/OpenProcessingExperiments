
int numBalls = 1000; //this is the variable we use to determine the number of elements in each array.

int[] posX = new int[numBalls]; //create an array for the x position of the circles
int[] posY = new int[numBalls]; //create an array for the y position of the circles
int[] speedX = new int[numBalls]; //create an array for the x speed of the circles
int[] speedY = new int[numBalls]; //create an array for the y speed of the circles
int[] diameter = new int[numBalls]; //create an array for the diameter of the circles
int[] hue = new int[numBalls]; //create an array for the color of the clrcles
int[] opacity = new int[numBalls]; //create an array for the opacity of the circles

int disappearArea = 100; //this variable is used to allow the mouse to "erase" circles in a wider area

void setup() {

  size(600, 600); 
  colorMode(HSB, 255); //change the color mode to HSB
  noStroke();

//use a for loop to go through every element in the array.
//we will then set the variables to random values. 
//this means that if we wanted the posX, posY, and diameter of the "first" circle,
//we could use posX[0], posY[0], diameter[0]
  for (int i = 0; i < numBalls; i++) {
    posX[i] = int(random(0, width));
    posY[i] = int(random(0, height));
    speedX[i] = int(random(2, 6));
    speedY[i] = int(random(2, 6));
    diameter[i] = int(random(10, 30));
    hue[i] = int(random(0, 255));
    opacity[i] = 120;
  }
}

void draw() {
  background(10); //draw the background so that we do not draw the circles on top of each other
  
  //here i am calling the functions that do various tasks: bounce, move, draw, etc.
  //i'm using fuctions because it makes my draw function cleaner and easier to read
  disappearBalls();
  collideBalls();
  moveBalls();
  drawBalls();

  //draw a circle that indicates the size of the "eraser"
  fill(0, 0, 50, 30);
  ellipse(mouseX, mouseY, disappearArea, disappearArea);
}

//in this function i simply loop through the array and draw each ball according
//to its specific posX, posY, and diameter. we also change the colors using hue and opacity
void drawBalls() {
  for (int i = 0; i < numBalls; i++) {
    fill(hue[i], 200, 255, opacity[i]);
    ellipse(posX[i], posY[i], diameter[i], diameter[i]);
  }
}

//in this function we loops through the array and move the balls according to their
//speed. Just like when we made one bouncing ball, we add the speed to the position to
//create movement. this time we are just moving all of the balls at the same time.
void moveBalls() {
  for (int i = 0; i < numBalls; i++) {

    posX[i] += speedX[i];
    posY[i] += speedY[i];
  }
}

//in this function we loop through the array and check to see if any of
//the balls have hit the edge of the screen. if they have, change their direction
//and move them to the edge of the screen
void collideBalls() {
  for (int i = 0; i < numBalls; i++) {

    if (posX[i] < diameter[i]/2) {
      speedX[i] = -speedX[i];
      posX[i] = diameter[i]/2;
    }

    if (posX[i] > width-diameter[i]/2) {
      speedX[i] = -speedX[i];
      posX[i] = width-diameter[i]/2;
    }

    if (posY[i] < diameter[i]/2) {
      speedY[i] = -speedY[i];
      posY[i] = diameter[i]/2;
    }

    if (posY[i] > height-diameter[i]/2) {
      speedY[i] = -speedY[i];
      posY[i] = height-diameter[i]/2;
    }
  }
}

//in this function we loop through all of the balls and check to see if
//the mouse is near them. if the mouse is within a certain distance,
//set the opacity of that specific ball to 0
void disappearBalls() {
  for (int i = 0; i < numBalls; i++) {
    if (dist(mouseX, mouseY, posX[i], posY[i]) < disappearArea) {
      opacity[i] = 0;
    }
  }
}

//when we press a key, loops through the array and change the opacity
//of all of the balls back to 120
void keyPressed() {
  for (int i = 0; i < numBalls; i++) {
    opacity[i] = 120;
  }
}



