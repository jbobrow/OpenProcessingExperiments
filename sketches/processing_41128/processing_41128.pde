
// ball variables
float x = 0;
float speedX = 3;

float y = 0;
float speedY = 5;

// bar variables
int barX = 175;
int barSpeed = 4;

// game variables
int level = 1;
int counter = 0;
boolean statePlay = true;

// font variable
PFont Font;


void setup() {
  size(400, 400);
  background(200);
  smooth();
  noCursor();
  Font = createFont("Arial", 16);
}


void draw() {
  if (statePlay) {
    // redraw background with transp
    noStroke();
    fill(200, 50);
    rect(0, 0, width, height);

    // display the counter
    fill(255);
    textFont(Font, 350);
    textAlign(CENTER, CENTER);
    text(counter, width/2, height/2-50);

    // change ball direction
    if (x >= width || x < 0) {
      speedX = speedX * -1;
    }
    if (y < 0) {
      speedY = speedY * -1;
    }

    // set ball position
    x = x + speedX;
    y = y + speedY;

    // set bar position
    if (keyPressed && keyCode == RIGHT && barX < width-40) {
      barX += barSpeed;
    }
    if (keyPressed && keyCode == LEFT && barX > 0) {
      barX -= barSpeed;
    }

    // check collisions between bar and ball (with offset)
    if (x > barX-5 && x < barX+45 && y == height-105) {
      // change ball direction
      speedY = speedY * -1;
      // update the points
      counter++;
    }

    // draw the bar
    fill(0);
    rect(barX, 300, 40, 5);

    // draw the ball
    ellipse(x, y, 20, 20);

    // increase speed in 3 levels every 5 points
    for (int val = 1; val < 4; val++) {
      if (counter == val*5 && level == val) {
        if (speedX < 0) {
          speedX = -1*(abs(speedX) + abs(speedX)/5);
        } 
        else {
          speedX = speedX + speedX/5;
        }
        if (speedY < 0) {
          speedY = -1*(abs(speedY) + abs(speedY)/5);
        } 
        else {
          speedY = speedY + speedY/5;
        }
        barSpeed += 2;
        level = val+1;
      }
    }

    // check missed ball
    if (y >= height) {
      background(0);
      // reset the ball position
      x = 0;
      y = 0;
      // reset speed
      speedX = 3;
      speedY = 5;
      // reset bar position
      barX = 175;
      barSpeed = 4;
      // reset level
      level = 1;
      // reset the counter
      counter = 0;
      // stop the game
      statePlay = false;
      // show the game over text
      fill(200);
      textFont(Font, 14);
      text("press a button to restart", width/2, height/2);
    }
  }
}

void keyPressed() {
  if (statePlay == false) {
    statePlay = true;
  }
}               
