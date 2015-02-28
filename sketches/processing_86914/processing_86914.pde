
// Simple bat and ball example
// By Laurent (2013/Jan)

// http://forum.processing.org/topic/very-basic-and-detailed-ball-bat-example-using-direction

void setup() {
  // Set the screen size
  size(400, 400);
  
  // Set shapes to be drawn from their center instead of their upper right corners
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  
  // Call the bat and the ball functions
  batMain();
  ballMain();
}

float ballX = 200, ballY = 200;
float direction = PI * .3f;
byte  speed = 4;

final static byte  ballSize  = 20;
final static color ballColor = #00FF00;

void ballMain() {
  // Draw the ball
  fill(ballColor);
  ellipse(ballX, ballY, ballSize, ballSize);

  // Update the ball
  ballX += speed * cos(direction);
  ballY += speed * sin(direction);

  // Call the walls function
  walls();

  // Keep the direction below two PI in order to keep control: You may ignore this
  if (direction > TWO_PI)        direction -= TWO_PI;
  else if (direction < -TWO_PI)  direction += TWO_PI;
}

short a = 200;

final static color batColor1 = #FF0000, batColor2 = #FFCC33;

void batMain() {
  // Draw the bat
  fill(batColor1);
  rect(a, 380, 60, 10);
  noStroke();

  // Draw the yellow sides
  fill(batColor2);
  rect(a - 25, 380, 15, 10);
  rect(a + 25, 380, 15, 10);

  // Update the bat only if mouse is pressed
  if (mousePressed) {

    // Right side of the screen
    if (mouseX > width>>1)    a += 4;
    // Other side of the screen
    else                      a -= 4;
  }

  // Detect contact with ball
  if (ballY + 10 > 375 && ballY + 10 < 385 && ballX + 10 > a - 30 && ballX - 10 < a + 30) {

    // If it hits the left side (yellow): Bounce back AND increase speed 
    if (ballX + 10 > a - 30 && ballX < a - 15) { // Left part
      direction = TWO_PI - direction;
      ++speed;
    }

    // Else if it hits the right side (yellow): Bounce back AND increase speed 
    else if (ballX - 10 < a + 30 && ballX < a + 15) {
      direction = TWO_PI - direction;
      ++speed;
    }

    // Else if it hits the middle (red): Bounce back AND reset speed
    else {
      direction = TWO_PI - direction;
      speed = 4;
    }
  }
}

void walls() {
  // Detect contact with the sides of the screen and mirror the direction
  // the 'ballX = 11' is just to make sure the ball will not get stuck
  if (ballX < 10) {
    ballX = 11;
    direction = PI - direction;
  }
  if (ballX > 390) {
    ballX = 389;
    direction = PI - direction;
  }
  if (ballY < 10) {
    ballY = 11;
    direction = TWO_PI - direction;
  }
  if (ballY > 390) {
    ballY = 389;
    direction = TWO_PI - direction;
  }
}
