
float x1, y1, x2, y2;  // centers of three balls
float moveX1, moveX2, moveY1, moveY2;  // speeds of three balls
float theDist;  // distance between any two balls
float points;  // score for a game you invent
float ball1Width = 50;
float ball2Width = 80;
boolean running =false;
float startTime = 0;

void setup() {
  size(400, 400);
  //frameRate(10);
  // starting points for the balls
  x1 = 50;
  y1 = 50;
  x2 = 100;
  y2 = 100;
  // starting speeds for the balls
  moveX1 = -1;
  moveY1 = 2;
  moveX2 = -4;
  moveY2 = 3;
  points = 3;  // starting value for points in your game
  fill(0);
  text("Welcome to the sample game", 20, 20);
  text ("click r to start", 20, 40);
}

void draw() {
  if (running) {
    background(127);
    // draw the balls
    fill(0, 255, 255);
    ellipse(x1, y1, ball1Width, ball1Width);
    fill(255, 255, 0);
    ellipse(x2, y2, ball2Width, ball2Width);

    // move the balls according to their current speeds
    x1 = x1 + moveX1;
    y1 = y1 + moveY1;
    x2 = x2 + moveX2;
    y2 = y2 + moveY2;


    // if the mouse is pressed, check to see if it's inside a ball
    // if it is, drag that ball by setting its x and y to mouseX and mouseY
    // and keep it dragging as long as the mouse is pressed
    if (mousePressed) {
      if ( dist (x1, y1, mouseX, mouseY) < ball1Width/2) {
        x1 = mouseX;
        y1 = mouseY;
      } else if ( dist (x2, y2, mouseX, mouseY) < ball2Width/2) {
        x2 = mouseX;
        y2 = mouseY;
      }
    }
    // bounce each of the balls off all four walls
    if (x1 > width) {
      x1 = width;
      moveX1 = moveX1 * -1;
    } else if (x1 < 0) {
      x1 = 0;
      moveX1 = moveX1 * -1;
    } else if (y1 > height) {
      y1 = height;
      moveY1 = moveY1 * -1;
    } else if (y1 < 0) {
      y1 = 0;
      moveY1 = moveY1 * -1;
    } else if (x2 > width) {
      x2 = width;
      moveX2 = moveX2 * -1;
    } else if (x2 < 0) {
      x2 = 0;
      moveX2 = moveX2 * -1;
    } else if (y2 > height) {
      y2 = height;
      moveY2 = moveY2 * -1;
    } else if (y2 < 0) {
      y2 = 0;
      moveY2 = moveY2 * -1;
    }


    // this is not a "real" bounce, but it's ok for our first game
    // check collision of balls 1 and 2, bounce them if they collide
    theDist = dist(x1, y1, x2, y2);
    if (theDist < (ball1Width/2 + ball2Width/2) ) {
      x1 = x1 - moveX1;
      moveX1 = moveX1 * -1;
      x2 = x2 - moveX2;
      moveX2 = moveX2 * -1;
      y1 = y1 - moveY1;
      moveY1 = moveY1 * -1;
      y2 = y2 - moveY2;
      moveY2 = moveY2 * -1;
      points--;  // reduce the point count
    }


    fill(0);
    text(" current score is " + points, 20, 20);  // display the score

    if (points < 1) {
      running = false;  // stops program
      float theTime = millis();
      float yourTime = theTime - startTime;
      text("Your time was " + yourTime, 40, 40);
      text ("click r to restart", 60, 60);
      points = 3;
    }
  }
}

void keyPressed () {
  if (key == 's') {
    running = false;
  } else if (key == 'r') {
    running = true;
    startTime = millis();
    x1 = 50;
    y1 = 50;
    x2 = 100;
    y2 = 100;
  }
}



