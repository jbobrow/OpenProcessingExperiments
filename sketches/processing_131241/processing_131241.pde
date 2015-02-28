
//Carlyn Maw, January 2014
//Week 3 Boundries, Example 4
//The ball drops, what happens to it now?

int ySpeed = 1;
int ballRadius = 15;
int ballY = ballRadius+1;


void setup() { 
  size(480, 360); //cannot use constants in JavaScript mode.
  background(204);
}

void draw() {
  background(204);
  ellipseMode(RADIUS);
  ellipse(width/2, ballY, ballRadius, ballRadius);
  ballY = ballY + ySpeed;
  if (ballY > height-ballRadius || ballY < 0+ballRadius) {
      ySpeed *= - 1;
    }
}



