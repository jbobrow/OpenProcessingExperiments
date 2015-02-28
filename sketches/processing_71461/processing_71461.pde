
int nSpots = 30;
float xPos, yPos;
float xVel, yVel;
PImage img;
Spot [] mySpot = new Spot [30];

void setup() {
  size(800, 800);
  smooth();
  img = loadImage("star.png");

  for (int i=0; i<mySpot.length ; i++) {
    mySpot[i] = new Spot(random(width), random(height), random(5, 15), random(255));
  }

  xPos = 300;
  yPos = 300;
  xVel = 20;
  yVel = 20;
}

void draw() {
  background(0);

  for (int i=0; i<mySpot.length ; i++) {
    mySpot[i].update(mouseX, mouseY);
    mySpot[i].display();
  }

  if (xPos > 20 && xPos < 400) {
    xPos = xPos + xVel;
    yPos = yPos + yVel;
    fill(0, 0, 255, 0);
    noStroke();
    ellipse(xPos, yPos, 15, 15);
  }
}


