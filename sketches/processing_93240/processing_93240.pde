
/* circularMovementWithVariables is a code developped to understand
the basics of movement through the environment, understanding the 
relationships and ratios between variables.

tip:  by pressing and holding mouse button rectangle turns into circle
      (nothing special - inspired by tutorials from the book "Learning
      Processing - A Beginners Guide to Programming, Images, Animation
      and Interaction", pg. 67, (D. Shiffman, 2008).

Dimitrije Dica Miletic, Sun, 17 March 2013, 00:21 */

float x, y;

float steps = 200; //ORIGINAL : 9
float movement = steps / 100;

float startX = 750 / 2 - steps / 2; //ORIGINAL : 45
float startY = 750 / 2 - steps*1.5; //ORIGINAL : 45

float minX = startX - steps; // 36
float maxX = startX + 2* steps; // 63
float maxY = startY + 3* steps; // 72
float minY = startY; // 45

float midRightX = startX + steps; // 54
float firstOfThreeY = startY + steps; // 54
float secondOfThreeY = startY + 2* steps; // 63

float r = random (0, 255);
float g = random (0, 255);
float b = random (0, 255);

void setup () {
  size (750, 750);
  smooth ();
  background (0);
  x = startX;
  y = startY;
  
  //DRAW THIN LINES ACCROSS THE MIDDLE OF THE WINDOW
  strokeWeight(0.2);
  stroke (255);
  line (width / 2, 0, width/2, height);
  line (0, height / 2, width, height/2);
}

void draw () {
  
  strokeWeight (1);
  stroke (0);
  fill (150);
//  noFill ();
  if (!mousePressed) {                              // RECTANGLE
//    fill (r+movement, g+movement, b+movement);
    rectMode (CENTER);
    rect (x, y, 50, 50);
  } 
  else {                                             // CIRCLE
//    fill (r+movement, g+movement, b+movement);
    ellipseMode (CENTER);
    ellipse (x, y, 50, 50);
  }

  // MOVE FROM BEGINNING ALONG x-AXIS, + DIRECTION
  if ((x >= startX) && (x < midRightX) && (y == startY)){  
    x += movement;
  }

  // MOVE FROM PREVIOUS POSITION ALONG x AND y-AXIS, + DIRECTION
  if ((x >= midRightX) && (x < maxX) && (y >= startY) && (y < firstOfThreeY)) {
    x +=movement;
    y +=movement;
  }
  
  // MOVE FROM PREVIOUS POSITION ALONG y-AXIS, + DIRECTION
  if ((x == maxX) && (y >= firstOfThreeY) && (y < secondOfThreeY)) {
    y += movement;
  }
  
  // MOVE FROM PREVIOUS POSITION ALONG x-AXIS (-) AND y-AXIS (+)
  if ((x <= maxX) && (x > midRightX) && (y >= secondOfThreeY) && (y < maxY)) {
    y += movement;
    x -= movement;
  }
  
  // MOVE FROM PREVIOUS POSITION ALONG x-AXIS (-)
  if ((x <= midRightX) && (x > startX) && (y == maxY)) {
    x -= movement;
  }
  
  // MOVE FROM PREVIOUS POSITION ALONG x-AXIS (-) AND y-AXIS (-)
  if ((x <= startX) && (x > minX) && (y <= maxY) && (y > secondOfThreeY)) {
    x -= movement;
    y -= movement;
  }
  
  // MOVE FROM PREVIOUS POSITION ALONG y-AXIS (-)
  if ((x == minX) && (y <= secondOfThreeY) && (y > firstOfThreeY)) {
    y -= movement;
  }
  
  // MOVE FROM PREVIOUS POSITION ALONG x-AXIS (+) AND y-AXIS (-)
  if ((x >= minX) && (x < startX) && (y <= firstOfThreeY) && (y > startY)) {
    x += movement;
    y -= movement;
  }
  
  println (x + ", " + y);
  x = constrain (x, minX, maxX);
  y = constrain (y, minY, maxY);
}


