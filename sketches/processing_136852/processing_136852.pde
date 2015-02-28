

int myState = 0;
PFont cursive;
PImage fireworks;
PImage winter;
PImage summer;
PImage fall;
PImage spring;

void setup() {
  size(500, 500);
  cursive = createFont("Allura-Regular.ttf", 200);
  fireworks = loadImage("fireworks.png");
  winter = loadImage("winter.png");
  summer = loadImage("summer.png");
  fall = loadImage("fall.png");
  spring = loadImage("spring.png");
}

void draw() {
  background(0);
  textAlign(CENTER);
  stroke(#000000);
  fill(#FFFFFF);

  switch(myState) {

  case 0:
    textFont(cursive, 35);
    image(winter, 0, 0);
    text("January", 50, 50, 400, 400);
    break;

  case 1:
    textFont(cursive, 35);
    image(winter, 0, 0);
    text("February", 50, 50, 400, 400);
    break;

  case 2:
    textFont(cursive, 35);
    image(spring, 0, 0);
    text("March", 50, 50, 400, 400);
    break;

  case 3:
    textFont(cursive, 35);
    image(spring, 0, 0);
    text("April", 50, 50, 400, 400);
    break;

  case 4:
    textFont(cursive, 35);
    image(spring, 0, 0);
    text("May", 50, 50, 400, 400);
    break;

  case 5:
    textFont(cursive, 35);
    image(summer, 0, 0);
    text("June", 50, 50, 400, 400);
    break;

  case 6:
    textFont(cursive, 35);
    image(summer, 0, 0);
    text("July", 50, 50, 400, 400);
    break;

  case 7:
    textFont(cursive, 35);
    image(summer, 0, 0);
    text("August", 50, 50, 400, 400);
    break;

  case 8:
    textFont(cursive, 35);
    image(fall, 0, 0);
    text("September", 50, 50, 400, 400);
    break;

  case 9:
    textFont(cursive, 35);
    image(fall, 0, 0);
    text("October", 50, 50, 400, 400);
    break;

  case 10:
    textFont(cursive, 35);
    image(fall, 0, 0);
    text("November", 50, 50, 400, 400);
    break;

  case 11:
    textFont(cursive, 35);
    image(winter, 0, 0);
    text("December", 50, 50, 400, 400);
    break;

  case 12:
    image(fireworks, 0, 0);
    textFont(cursive, 35);
    text("HAPPY NEW YEAR", 50, 50, 400, 400);
    break;
  }
}

void mousePressed() {
  myState = (myState + 1);
  if (myState > 12) {
    myState = 0;
  }
}



