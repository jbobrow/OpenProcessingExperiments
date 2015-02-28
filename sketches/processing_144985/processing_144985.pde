
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Hye Mi
// ID: 201420076


int x = 5;
int y = 5;
int xspeed = 4;
int yspeed = 8;
int ballX = 0;
int ballSpeed = 5;
int ballRadius = 25;

void setup() {
  size(600, 600);
  smooth();
 
}

void draw() {
  background(0);
  displayBall();
  bounceBall();
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;

  if ((x > width-30) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xspeed = xspeed * -1;
  }
  if ((y > height-20) || (y < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    yspeed = yspeed * -1;
  }


  // Display circle at x location
  stroke(0);
  fill(175);
  quad(x, y, width-x, 0, 0, height-y, width-x, height-y);
  fill(y, 0, x, 100);
  quad(x, y, 0, height-y, width-x, 0, x, y);
  fill(255);
  quad(x, y, width-x, height-y, width-x, 0, x, y);
  
  stroke(0);
  fill(175);
  quad(x, y, width+x, 0, 0, height+y, width+x, height+y);
  fill(y, 0, x, 100);
  quad(x, y, 0, height+y, width+x, 0, x, y);
  fill(255);
  quad(x, y, width+x, height+y, width+x, 0, x, y);
  
  
}


void displayBall() {
  for(int come = 0; come <= height; come = come +50){
  fill(234, 80, 80);
  ellipse(ballX, come, ballRadius, ballRadius);
  
  }
  
  ballRadius = constrain(ballRadius-1, 25, 36);
}

void bounceBall() { 
  ballX = ballX + ballSpeed; 
 
  if ((ballX > width) || (ballX < 0)) {
    ballSpeed = ballSpeed * -1; 
    ballRadius = 36;
  }
}
