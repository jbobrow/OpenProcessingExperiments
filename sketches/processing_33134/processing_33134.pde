
/* Init Global Variables */
float yPos = 0;
float vel = 5;
PImage bg;

float r = random(0, 225);
float g = random(0, 255);
float b = random(0, 255);

/*SETUP */
void setup() {
  size(1005, 605);
  bg = loadImage("america.jpeg");
  smooth();
}

/* Draw to Stage*/
void draw() {
  PFont font;
  frameRate(30);
  background(bg);
  fill(255, 97, 3);
  noStroke();


  /*yPos y-axis, Read as yPos = vel + 1 */
  yPos += vel;

  /* Draw circle */

  //ellipse(width*.5, yPos, 250, 250);
  // font

  font = loadFont("Bebas-48.vlw");
  textFont(font);
  fill(r, g, b);
  text("E M O T I V E ", 50, yPos, 250, 250);
  text("C O N J U C T I O N S", 60, yPos+40, 360, 250);


  /* Set Function to send the ball down yPos, then back up */
  if (yPos < 0  ||  yPos > width*.5) {
    vel *= -1;
    textFont(font);
    fill(r, g, b);
    text("P I G H E A D", 50, yPos, 250, 250);
  }
}


