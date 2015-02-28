

int xPos;
int yPos;
int dia;
int speed = 3;
PImage img;
PFont fontA;

void setup() {
  size (500, 500);
  xPos=150;
  dia=150;
  yPos=height/2;
  smooth();
  fontA = loadFont("HelveticaNeue-Light-24.vlw");
  textFont(fontA, 32);
}


void draw() {
  background(0, 0, 0);
  img = loadImage("Me Norm small.png");

  xPos = xPos + speed;

  if ((xPos > width-75) || (xPos <= 75)) {

    speed = speed * -1;
  }

  if ((xPos > width-85) || (xPos <= 85)) {

    img = loadImage("Me Pain small.png");
  }

  if ((xPos > width-85) || (xPos <= 85)) {

    background(200, 10, 10);
  }


  rect(xPos, yPos, dia, dia);
  rectMode(CENTER);
  stroke(255);
  image(img, xPos-dia/2, yPos-dia/2);

  fill(255);
  text("Learning Process", 120, 60);
}


