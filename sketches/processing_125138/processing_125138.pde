
/*
This program entails a complex simulation of world society
 as it exists during and after the theorized Great Fecal Disturbance
 of the late 21st century as projected by statistical modeling
 which uses data going back to the 18th century. It is not meant as an absolute
 prediction but only as a representation of one possible outcome
 should our current, flawed, fecal distribution practices remain
 unchanged.
 */


PFont font, font1, font2, font3, font4;
int fontY;
int fillR, fillG, fillB;
boolean fillRReverse;
float poopSize, poopSpreadAmount, poopSpreadX, poopSpreadY;
int poopCount, poopOverload;
int i, y;

void setup() {

  size(600, 600);

  frameRate(225);

  font = loadFont("font.vlw");
  fontY = 20;

  fillR = 252;

  font1 = loadFont("poopMeterFont.vlw");

  font2 = loadFont("bigFont.vlw");

  font3 = loadFont("font3.vlw");

  font4 = loadFont("font4.vlw");

  noSmooth();
  background(128);

  poopCount = 0;

  poopOverload = 0;

  i = 0;
}

void draw() {

  if (poopOverload >= 100) {
    fill(fillR, 255, 255, i);
    ellipse(width/2, height/2, i, i);
    i = i + 10;
    fill(255, 5);
    rect(0, 0, width, height);
    fill(0, 200);
    textFont(font);
    textAlign(CENTER);
    text("POOPAGEDDON", width/2, height/2);
  }

  //draws poop meter outline
  if (poopOverload < 101) {
    rectMode(CORNER);
    stroke(200);
    fill(0, 0, 0, 0);
    rect(470, 20, 75, 500);

    //covers poop meter each turn
    rectMode(CORNERS);
    noStroke();
    fill(128);
    rect(472, 518, 544, 23);

    //draws poop meter bar
    rectMode(CORNERS);
    noStroke();
    if (poopCount < 495) {
      fill(map(poopCount, 0, 494, 0, 255), 50, 50);
    }
    else if (poopCount == 495) { //makes poop meter flash when it's full
      fill(fillR, 50, 150);
    }
    rect(472, 518, 544, 518 - poopCount);

    //text for poop meter
    fill(180);
    textFont(font1);
    text("poop meter", 473, 537);

    //poop overload
    if (poopCount == 495) {
      noStroke();
      fill(fillR, 200, 200);
      textFont(font2);
      text("POOP", 30, 100);
      text("OVERLOAD", 30, 200);
      textFont(font3);
      fill(fillR, 200, 100);
      text("PRESS SPACEBAR REPEATEDLY!!", 30, 250);
      fill(fillR, map(poopOverload, 0, 100, 50, 255), map(poopOverload, 50, 100, 0, 255));
      textFont(font4, 300);
      text(poopOverload, 50, 500);
    }

    //setting up poop appearance
    noStroke();
    fill(random(87, 97), random(85, 95), random(36, 46), random(175, 225));
    poopSize = random(75);
    poopSpreadAmount = random (-50, 50);
    poopSpreadX = poopSpreadAmount + mouseX;
    poopSpreadAmount = random (-50, 50);
    poopSpreadY = poopSpreadAmount + mouseY;

    //draws poop when mouse is pressed
    if (mousePressed == true) {
      ellipse (poopSpreadX, poopSpreadY, poopSize, poopSize);
      if (poopCount <= 495) {
        poopCount = poopCount + 2;
      }
    }

    //decreases poop meter when poop is not being flung
    if (poopCount > 0 && poopCount != 495) {
      poopCount = poopCount - 1;
    }

    fill(fillR, 100, 100);
    textFont(font, 24);
    text("Let's all poop together as one!", 5, fontY);

    if (fillR == 252) {
      fillRReverse = false;
    }
    if (fillR == 0) {
      fillRReverse = true;
    }

    if (fillRReverse == true) {
      fillR = fillR + 18;
    }
    else if (fillRReverse == false) {
      fillR = fillR - 18;
    }

    fontY = fontY + 20;

    if (fontY == height + 20) {
      fontY = 20;
    }
  }
}

void keyReleased() {
  //poop overload gameplay
  if (poopCount == 495) {
    if (key == ' ') {
      poopOverload = poopOverload + 1;
      fill(map(poopOverload, 0, 100, 0, 255), 0, 0, 3);
      rect(0, 0, width, height);
    }
  }
}



