
int x = 0; //ball x-position
int y = 100; //ball y-position
int speedX = 1; //speed of ball movement, X-axis
int speedY = 2; //speed of ball movement, Y-axis

void setup() {
  size(200,200);
  smooth();
  frameRate(50); //stop the animation from running too fast in web browsers
  }

void draw() {
  background(255);
  x = x + speedX;
  y = y + speedY;

  /* Bounce the ball horizontally */
  if(x > width) {
    speedX = speedX * -1;
  }
  else if (x < 0) {
    speedX = speedX * -1;
  }


  /* Move the ball vertically */
  if(y > 3.8/4 * height) {
    speedY = speedY * -1;
  }

  else if(y < 0.2/4 * height) {
    speedY = speedY * -1;
  }


  /* Draw ellipse */
  stroke(0);
  fill(x,y,(x-y));
  ellipse(x,y,30,30); //draw ellipse
}
                
