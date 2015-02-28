
/* Init Global Variables */
float xPos = 45;
float vel = 5;
float r = random(0, 225);
float g = random(0, 255);
float b = random(0, 255);

/*SETUP */
void setup() {
  size(500, 500);
  smooth();
}

/* Draw to Stage*/
void draw() {
  frameRate(60);
  background(255);
  fill (r, g, b);
  noStroke();


  /*yPos y-axis, Read as yPos = vel + 1 */
  xPos += vel;

  /* Draw circle */
  ellipse(250, 250, xPos, xPos);
    fill (r, g, b);

  ellipse(250, 250, xPos, xPos);
    fill (r, g, b);

  ellipse(250, 250, xPos, xPos);
    fill (r, g, b);

  ellipse(250, 250, xPos, xPos);
    fill (25, 6, 78);


  /* Set Function to send the ball down yPos, then back up */
  if (xPos < 45  ||  xPos > width) {
    vel *= -1;
  }
}





