
//Diana Yuh
//Introduction to Digital Media Fall 2012 - Assignment 01b
//Section B
//9.13.12

int pupilx = 0;
int pupily = 0;
int pupilx1 = 0;
int pupily1 = 0;
int recty = 0;
int randomRed = 0; 
boolean boolRed = false; 


void setup() {
  size (1200, 600);
  background(0);
}


void draw() {

  smooth();
  ellipse (width/3, height/2, 150, 200);
  ellipse (width*2/3, height/2, 150, 200);

  recty = mouseY;


  pupilx = mouseX + int(100);
  if (pupilx < width*2/3-45) {
    pupilx=width*2/3-45;
  }
  if (pupilx > width*2/3+45) {
    pupilx = width*2/3 +45;
  }

  pupily = mouseY;
  if (pupily>350) {
    pupily=350;
  }
  if (pupily<250) {
    pupily=250;
  }

  pupilx1 = mouseX - int(100);
  if (pupilx1>width/3+45) {
    pupilx1 = width/3+45;
  }
  if (pupilx1<width/3-45) {
    pupilx1 = width/3-45;
  }

  pupily1 = mouseY;
  if (pupily1>350) {
    pupily1=350;
  }
  if (pupily1<250) {
    pupily1=250;
  }


  fill(0);
  rect(0, 0, width, recty);

  if (boolRed ==true) {


    if (randomRed ==0) {
      randomRed=255;
    }


    else {
      randomRed = 0;
    }
  }
 
  fill(randomRed, 0, 255);
  ellipse (pupilx, pupily, 50, 50);
  fill (randomRed, 0, 255);
  ellipse (pupilx1, pupily1, 50, 50);
  fill(0);
  ellipse(pupilx, pupily, 25, 25);
  ellipse(pupilx1, pupily1, 25, 25);
  fill(0);
  rect(0, 0, width, recty);

  fill(0, 50);


  rect(0, 0, width, height);

  fill(255);
}


void mousePressed() {

  boolRed= !boolRed;
}


void keyPressed() {
  if (key == 's') {
    save("dianaYuh_interactive.png");
  }
}
