
float speedX;
float speedY;
float ballX;
float ballY;

float gravity;

void setup() {
  size(400, 400);
  background(#ededed);

  ballX = int(random(0, width));
  ballY = int(random(0, height/5));

  speedX = 4;
  speedY = 10;

  gravity = 0.3;

  smooth();
  noStroke();
}

void draw() {
  drawBall();
  drawText("HEY", 124, 5, height/2);
  drawText("YOU", 124, 5, 3*height/4);
  drawText("Get off my crown", 12, 5, height-15);
}

void drawText(String head, int fontSize, int x, int y) {
  fill(#ededed);
  PFont myFont;
  myFont = createFont("Arvo-Regular", fontSize, true);
  textFont(myFont);
  text(head, x, y);
//  text(head1, 5, height/2);
//  text(head2, 5, 3*height/4);
//  PFont myFont2;
//  myFont2 = createFont("Arvo-Regular", 12, true);
//  textFont(myFont2);
//  text(subhead, 5, height-15);
}

// Randomly generate balls that drop (and bounce) at varying speeds
// Function: BallGenerator with random variables for starting X location (Starting Y is constant) and for speed/mass
// For loop determines various opacities

// Balls eventually settle on floor to reveal text message

void drawBall() {
  // background(255);
  fill(int(random(mouseX, mouseY)), int(random(mouseX/5, mouseY/2)), int(random(mouseX/5, mouseY/4)));
  ellipse(ballX, ballY, 20, 20);
  ballY += speedY;
  ballX += speedX;

  if (ballY >= height || ballY <= 0 ) {
    // This is important, so that speedY slows down when it hits the edges
    // Not necessary for speedX for some reason
    speedY *= -1;
  }
  if (ballX >= width || ballX <= 0 ) {
    speedX *= -1;
  }


  // Add gravity to speedY here, instead of at the end
  speedY += gravity;


  // Limit bottom EDGE of the ball (not the center position of the ball) to the bottom of the screen
  if (ballY >= 390) {
    ballY = 390;
    speedY *= 1;
    speedX *= 1;
  }

}


