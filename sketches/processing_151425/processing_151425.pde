
/*
 * Creative Coding
 * Week 2, 04 - The Clocks
 * Original sketch by Indae Hwang and Jon McCormack
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 * 
 * I answered the challenge of changing the pattern of the grid to alternate squares and changing
 * the direction of the second hand to counterclockwise.
 *
 * Because I'm interested in figuring out how to manage particulate behavior asap, 
 * frankensteind in the code for bubbling circles - then played with transparency and color . . .
 *
 */
 
 //set up array - bubbling circles
 int numberOfCircles = 350; 
// first, declare the arrays (name and data type)
float[] xCoordinate, yCoordinate, radius, xVelocity, yVelocity, radiusChange;

void setup() {
  // scale the array
  xCoordinate = new float[numberOfCircles];
  yCoordinate = new float[numberOfCircles];
  radius = new float[numberOfCircles];
  xVelocity = new float[numberOfCircles];  
  yVelocity = new float[numberOfCircles];
  radiusChange = new float[numberOfCircles];
  // provide array with numeric values
  for (int ii = 0; ii < numberOfCircles; ii++) {
    xCoordinate[ii] = random(0, 600);
    yCoordinate[ii] = random(0, 600);
    radius[ii] = random(11, 42);
    xVelocity[ii] = random(-1, 1);
    yVelocity[ii] = random(-8, 13);
    radiusChange[ii] = random(-0.2, 2.2);
 
  size(600, 600);
  background(#FFFFFF);
  rectMode(CENTER);
  noStroke();
  smooth();
}
}

void draw() {
  // array statements loop at 60 frames per second
  // and have a second, nested (internal) loop that manages each circle individually
  for (int ii = 0; ii < numberOfCircles; ii++) {
    ellipse(xCoordinate[ii], yCoordinate[ii], radius[ii], radius[ii]);
    
    // now we can change the speed of the motion over time by varying velocity
    xCoordinate[ii] = (xCoordinate[ii] + xVelocity[ii]) % 600; 
    yCoordinate[ii] = (yCoordinate[ii] + yVelocity[ii]) % 600;
    xVelocity[ii] = xVelocity[ii] + 0.01;
    yVelocity[ii] = yVelocity[ii] + 0.10;
    if(xVelocity[ii] > 1) {
      xVelocity[ii] = random(-1, 0.05);
    }
    if(yVelocity[ii] > 1) {
      yVelocity[ii] = random(-1, 1.00);
    }
    radius[ii] = (radius[ii] + radiusChange[ii]);
    if((radius[ii] >= 25) || (radius[ii] <= 11)) {
      radiusChange[ii] = radiusChange[ii] * -1;
    }
  }
  
  //here we go clock faces here we go ~
  noStroke();

  int num = 5;
  int margin = 80;
  float gutter = 0; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);

  int circleNumber = 0; // counter

  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      ++circleNumber;

      float tx = margin + cellsize * i + gutter * i;
      float ty = margin + cellsize * j + gutter * j;
      float evens = circleNumber%2;

//link color to shape on the movingCircle and movingSquare functions
if (evens == 1) {
        movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
        fill(77, 210, 245, 200);
        } else {
        movingSquare(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
        fill(29, 197, 237, 200);
        }
      
    }
  }

}

//end of draw 

void movingCircle(float x, float y, float size, float angle) {
  //calculate endpoint of the line
   float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(#FFFFFF);
  strokeWeight(3);
  ellipse(x, y, size, size);//circle
  stroke(#FFFFFF);
  line(x, y, tempX, tempY); // second hand
}

void movingSquare(float x, float y, float size, float angle) {

  // calculate endpoint of the line
  float tempX = x + (size / 2) * sin(angle);
  float tempY = y + (size / 2) * cos(angle);

  stroke(#FFFFFF);
  strokeWeight(3);
  fill(154, 245, 77, 180);
  rect(x, y, size, size); // square
  
  stroke(#FFFFFF);
  line(x, y, tempX, tempY); // second hand  
  
    // Save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("circlegetsthesquare-array-.jpg");
}
}
