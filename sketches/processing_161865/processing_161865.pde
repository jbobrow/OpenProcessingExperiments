
//Val Head's help with Code (Processing User)

/*
a bouncing ball
 */

float ballX = 170;
float ballY = 0;
float j = 50;

//create a variable for speed
float speed = 2;

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  // change the mode we draw circles so they are
  // aligned in the top left
  ellipseMode(CORNER);
}

void draw() {

  background(21, 110, 242);
  fill(255);

  ellipse(ballX, ballY, j, j);

  // gravity for the speed
  speed = speed + 0.5; 

  // speed for the ball
  ballY = ballY + speed;

  if (ballY > height - j) {
    // the position to be on the floor
    ballY = height - j;
    //the opposite direction
    speed = speed * -0.9;

    //direction switch

  } else if (ballY <= 0) {
    // if the ball hits the top,
    // make it bounce
    speed = -speed;
  }
}



