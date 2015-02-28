
/* Test for array of bouncing balls: working (i.e., ball bounces and expands
in size when it hits either edge, giving a "bounce effect."
*/

int ballX = 0;

int ballSpeed = 5;
int ballRadius = 25;

void setup () {
  size(200,200);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  frameRate(30);
}

 void draw () {
   background(255);
   displayBall();
   bounceBall();

 }
 
// displayBall

void displayBall() {
  fill(234,80,80); 
  ellipse(ballX,50,ballRadius,ballRadius);
  ballRadius = constrain(ballRadius-1,25,36);

}

// bounceBall

void bounceBall() { // Tried to introduce argument here "int ballSpeed" and pass in value 5 from up in the draw() section of code, specifically, bounceBall(5)
  ballX = ballX + ballSpeed; // move ball (add current speed to ball x position)
  
  if ((ballX > width) || (ballX < 0)) {
    ballSpeed = ballSpeed * -1; // change direction
    ballRadius = 36;
  }

}

