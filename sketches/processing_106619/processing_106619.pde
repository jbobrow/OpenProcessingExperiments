
int numPos = 1200;
int[] xPos = new int[numPos];
int[] yPos = new int[numPos];

int[] randomX1 = new int[numPos];
int[] randomX2 = new int[numPos];
int[] randomX3 = new int[numPos];
int[] randomX4 = new int[numPos];
int[] randomX5 = new int[numPos];
int[] randomX6 = new int[numPos];
int[] randomX7 = new int[numPos];
int[] randomX8 = new int[numPos];
int[] randomX9 = new int[numPos];
int[] randomX0 = new int[numPos];
int[] randomX11 = new int[numPos];
int[] randomX12 = new int[numPos];
int[] randomX13 = new int[numPos];
int[] randomX14 = new int[numPos];
int[] randomX15 = new int[numPos];

int[] randomY1 = new int[numPos];
int[] randomY2 = new int[numPos];
int[] randomY3 = new int[numPos];
int[] randomY4 = new int[numPos];
int[] randomY5 = new int[numPos];
int[] randomY6 = new int[numPos];
int[] randomY7 = new int[numPos];
int[] randomY8 = new int[numPos];
int[] randomY9 = new int[numPos];
int[] randomY0 = new int[numPos];
int[] randomY11 = new int[numPos];
int[] randomY12 = new int[numPos];
int[] randomY13 = new int[numPos];
int[] randomY14 = new int[numPos];
int[] randomY15 = new int[numPos];

int[] fillS1 = new int[numPos];
int[] fillS2 = new int[numPos];
int[] fillS3 = new int[numPos];
int[] fillS4 = new int[numPos];
int[] fillS5 = new int[numPos];
int[] fillS6 = new int[numPos];
int[] fillS7 = new int[numPos];
int[] fillS8 = new int[numPos];
int[] fillS9 = new int[numPos];
int[] fillS0 = new int[numPos];
int[] fillS11 = new int[numPos];
int[] fillS12 = new int[numPos];
int[] fillS13 = new int[numPos];
int[] fillS14 = new int[numPos];
int[] fillS15 = new int[numPos];

int[] fillB1 = new int[numPos];
int[] fillB2 = new int[numPos];
int[] fillB3 = new int[numPos];
int[] fillB4 = new int[numPos];
int[] fillB5 = new int[numPos];
int[] fillB6 = new int[numPos];
int[] fillB7 = new int[numPos];
int[] fillB8 = new int[numPos];
int[] fillB9 = new int[numPos];
int[] fillB0 = new int[numPos];

int[] radians1 = new int[numPos];
int[] radians2 = new int[numPos];
int[] radians3 = new int[numPos];
int[] radians4 = new int[numPos];
int[] radians5 = new int[numPos];
int[] radians6 = new int[numPos];
int[] radians7 = new int[numPos];
int[] radians8 = new int[numPos];
int[] radians9 = new int[numPos];
int[] radians0 = new int[numPos];


int diameter = 10;

PImage img;

boolean snuggle;
boolean bite;


void setup() {
  //size(600, 750);
  size (displayWidth, displayHeight);
  colorMode(HSB, 255);
  background(5, 10, 30);
  rectMode(CENTER);
  img = loadImage("art_generator.jpg");

  for (int i = 0; i < numPos; i++) {
    xPos[i] = -50;
    yPos[i] = -50;
  }
}

void draw() {

  if (snuggle == false && bite == false) {
    image (img, 0, 0);
  }

  //grey background for canvas
  else {
    background(5, 10, 30);
  }

  //drawing line
  for (int i = 0; i < numPos-1; i++) {
    if (xPos[i] != -50 && yPos[i] != -50) {
      line(xPos[i], yPos[i], xPos[i+1], yPos[i+1]);
      strokeWeight(1);
      stroke(100);
    }
  }

  // startOver();

  optSnuggle();
  optBite();
}


//function for when snuggle option's been picekd
void optSnuggle() {
  if (snuggle) {
    for (int i = 0; i < numPos; i++) {
      if (!mousePressed) {
        noStroke();
        fill (fillS1[i], 255, 255, 80);
        ellipse(xPos[i]+randomX7[i], yPos[i]+randomY7[i], diameter+20, diameter+20);
        fill (fillS2[i], 255, 255, 100);
        ellipse(xPos[i]+randomX6[i], yPos[i]+randomY6[i], diameter+15, diameter+15);
        fill (fillS3[i], 255, 255, 90);
        ellipse(xPos[i]+randomX5[i], yPos[i]+randomY5[i], diameter+12, diameter+12);
        fill (fillS4[i], 255, 255, 70);
        ellipse(xPos[i]+randomX4[i], yPos[i]+randomY4[i], diameter+9, diameter+9);
        fill (fillS5[i], 255, 255, 70);
        ellipse(xPos[i]+randomX3[i], yPos[i]+randomY3[i], diameter+6, diameter+6);
        fill (fillS6[i], 255, 255, 80);
        ellipse(xPos[i]+randomX2[i], yPos[i]+randomY2[i], diameter+3, diameter+3);
        fill (fillS7[i], 255, 255, 90);
        ellipse(xPos[i]+randomX1[i], yPos[i]+randomY1[i], diameter, diameter);
        fill (fillS8[i], 255, 255, 80);
        ellipse(xPos[i]+randomX8[i], yPos[i]+randomY8[i], diameter-3, diameter-3);
        fill (fillS9[i], 255, 255, 70);
        ellipse(xPos[i]+randomX9[i], yPos[i]+randomY9[i], diameter-5, diameter-5);
        fill (fillS0[i], 255, 255, 90);
        ellipse(xPos[i]+randomX0[i], yPos[i]+randomY0[i], diameter-7, diameter-7);
        fill (fillS11[i], 255, 255, 70);
        ellipse(xPos[i]+randomX11[i], yPos[i]+randomY11[i], diameter-2, diameter-2);
        fill (fillS12[i], 255, 255, 70);
        ellipse(xPos[i]+randomX12[i], yPos[i]+randomY12[i], diameter-4, diameter-4);
        fill (fillS13[i], 255, 255, 80);
        ellipse(xPos[i]+randomX13[i], yPos[i]+randomY13[i], diameter-6, diameter-6);
        fill (fillS14[i], 255, 255, 90);
        ellipse(xPos[i]+randomX14[i], yPos[i]+randomY14[i], diameter-1, diameter-1);
        fill (fillS15[i], 255, 255, 80);
        ellipse(xPos[i]+randomX15[i], yPos[i]+randomY15[i], diameter-8, diameter-8);
      }
    }
  }
}


//function for when snuggle option's been picked
void optBite() {
  if (bite) {
    for (int i = 0; i < numPos; i++) {
      if (!mousePressed) {

      noStroke();
      fill (fillB1[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX7[i], yPos[i]+randomY7[i]);
      rotate(radians(radians1[i]));
      rect(0, 0, diameter-7, diameter+30);
      popMatrix();

      fill (fillB2[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX6[i], yPos[i]+randomY6[i]);
      rotate(radians(radians2[i]));
      rect(0, 0, diameter-7, diameter+30);
      popMatrix();

      fill (fillB3[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX5[i], yPos[i]+randomY5[i]);
      rotate(radians(radians3[i]));
      rect(0, 0, diameter-8, diameter+25);
      popMatrix();

      fill (fillB4[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX4[i], yPos[i]+randomY4[i]);
      rotate(radians(radians4[i]));
      rect(0, 0, diameter-8, diameter+25);
      popMatrix();

      fill (fillB5[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX3[i], yPos[i]+randomY3[i]);
      rotate(radians(radians5[i]));
      rect(0, 0, diameter-9, diameter+20);
      popMatrix();

      fill (fillB6[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX2[i], yPos[i]+randomY2[i]);
      rotate(radians(radians6[i]));
      rect(0, 0, diameter-9, diameter+20);
      popMatrix();

      fill (fillB7[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX1[i], yPos[i]+randomY1[i]);
      rotate(radians(radians7[i]));
      rect(0, 0, diameter-7, diameter+30);
      popMatrix();

      fill (fillB8[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX8[i], yPos[i]+randomY8[i]);
      rotate(radians(radians7[i]));
      rect(0, 0, diameter-7, diameter+35);
      popMatrix();

      fill (fillB9[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX9[i], yPos[i]+randomY9[i]);
      rotate(radians(radians9[i]));
      rect(0, 0, diameter-9, diameter+25);
      popMatrix();

      fill (fillB0[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX0[i], yPos[i]+randomY0[i]);
      rotate(radians(radians0[i]));
      rect(0, 0, diameter-9, diameter+25);
      popMatrix();
      }
    }
  }
}






//function for option snuggle
void snuggle() {
  for (int i = 0; i < numPos; i++) {
    if (!mousePressed) {
      noStroke();
      fill (fillS1[i], 255, 255, 80);
      ellipse(xPos[i]+randomX7[i], yPos[i]+randomY7[i], diameter+20, diameter+20);
      fill (fillS2[i], 255, 255, 100);
      ellipse(xPos[i]+randomX6[i], yPos[i]+randomY6[i], diameter+15, diameter+15);
      fill (fillS3[i], 255, 255, 90);
      ellipse(xPos[i]+randomX5[i], yPos[i]+randomY5[i], diameter+12, diameter+12);
      fill (fillS4[i], 255, 255, 70);
      ellipse(xPos[i]+randomX4[i], yPos[i]+randomY4[i], diameter+9, diameter+9);
      fill (fillS5[i], 255, 255, 70);
      ellipse(xPos[i]+randomX3[i], yPos[i]+randomY3[i], diameter+6, diameter+6);
      fill (fillS6[i], 255, 255, 80);
      ellipse(xPos[i]+randomX2[i], yPos[i]+randomY2[i], diameter+3, diameter+3);
      fill (fillS7[i], 255, 255, 90);
      ellipse(xPos[i]+randomX1[i], yPos[i]+randomY1[i], diameter, diameter);
      fill (fillS8[i], 255, 255, 80);
      ellipse(xPos[i]+randomX8[i], yPos[i]+randomY8[i], diameter-3, diameter-3);
      fill (fillS9[i], 255, 255, 70);
      ellipse(xPos[i]+randomX9[i], yPos[i]+randomY9[i], diameter-5, diameter-5);
      fill (fillS0[i], 255, 255, 90);
      ellipse(xPos[i]+randomX0[i], yPos[i]+randomY0[i], diameter-7, diameter-7);
      fill (fillS11[i], 255, 255, 70);
      ellipse(xPos[i]+randomX11[i], yPos[i]+randomY11[i], diameter-2, diameter-2);
      fill (fillS12[i], 255, 255, 70);
      ellipse(xPos[i]+randomX12[i], yPos[i]+randomY12[i], diameter-4, diameter-4);
      fill (fillS13[i], 255, 255, 80);
      ellipse(xPos[i]+randomX13[i], yPos[i]+randomY13[i], diameter-6, diameter-6);
      fill (fillS14[i], 255, 255, 90);
      ellipse(xPos[i]+randomX14[i], yPos[i]+randomY14[i], diameter-1, diameter-1);
      fill (fillS15[i], 255, 255, 80);
      ellipse(xPos[i]+randomX15[i], yPos[i]+randomY15[i], diameter-8, diameter-8);
    }
  }
}

//function for option bite
void bite() {
  for (int i = 0; i < numPos; i++) {
    if (!mousePressed) {

      noStroke();
      fill (fillB1[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX7[i], yPos[i]+randomY7[i]);
      rotate(radians(radians1[i]));
      rect(0, 0, diameter-7, diameter+30);
      popMatrix();

      fill (fillB2[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX6[i], yPos[i]+randomY6[i]);
      rotate(radians(radians2[i]));
      rect(0, 0, diameter-7, diameter+30);
      popMatrix();

      fill (fillB3[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX5[i], yPos[i]+randomY5[i]);
      rotate(radians(radians3[i]));
      rect(0, 0, diameter-8, diameter+25);
      popMatrix();

      fill (fillB4[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX4[i], yPos[i]+randomY4[i]);
      rotate(radians(radians4[i]));
      rect(0, 0, diameter-8, diameter+25);
      popMatrix();

      fill (fillB5[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX3[i], yPos[i]+randomY3[i]);
      rotate(radians(radians5[i]));
      rect(0, 0, diameter-9, diameter+20);
      popMatrix();

      fill (fillB6[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX2[i], yPos[i]+randomY2[i]);
      rotate(radians(radians6[i]));
      rect(0, 0, diameter-9, diameter+20);
      popMatrix();

      fill (fillB7[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX1[i], yPos[i]+randomY1[i]);
      rotate(radians(radians7[i]));
      rect(0, 0, diameter-7, diameter+30);
      popMatrix();

      fill (fillB8[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX8[i], yPos[i]+randomY8[i]);
      rotate(radians(radians7[i]));
      rect(0, 0, diameter-7, diameter+35);
      popMatrix();

      fill (fillB9[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX9[i], yPos[i]+randomY9[i]);
      rotate(radians(radians9[i]));
      rect(0, 0, diameter-9, diameter+25);
      popMatrix();

      fill (fillB0[i], 255, 255, 100);
      pushMatrix();
      translate(xPos[i]+randomX0[i], yPos[i]+randomY0[i]);
      rotate(radians(radians0[i]));
      rect(0, 0, diameter-9, diameter+25);
      popMatrix();
    }
  }
}
//renue
void startOver() {
  image (img, 0, 0);
}

void mouseDragged() {
  for (int i = 0; i < numPos-1; i++) {
    xPos[i] = xPos[i+1];
    yPos[i] = yPos[i+1];
  } 
  xPos[numPos-1] = mouseX;
  yPos[numPos-1] = mouseY;
}

void mouseReleased() {
  for (int i = 0; i < numPos; i++) {
    randomY1[i] = int(random(-20, 20));
    randomY2[i] = int(random(-30, 30));
    randomY3[i] = int(random(-15, 15));
    randomY4[i] = int(random(-20, 20));
    randomY5[i] = int(random(-30, 30));
    randomY6[i] = int(random(-15, 15));
    randomY7[i] = int(random(-20, 20));
    randomY8[i] = int(random(-30, 30));
    randomY9[i] = int(random(-15, 15));
    randomY0[i] = int(random(-15, 15));
    randomY11[i] = int(random(-15, 15));
    randomY12[i] = int(random(-20, 20));
    randomY13[i] = int(random(-30, 30));
    randomY14[i] = int(random(-15, 15));
    randomY15[i] = int(random(-15, 15));


    randomX1[i] = int(random(-15, 15));
    randomX2[i] = int(random(-15, 15));
    randomX3[i] = int(random(-15, 15));
    randomX4[i] = int(random(-15, 15));
    randomX5[i] = int(random(-15, 15));
    randomX6[i] = int(random(-15, 15));
    randomX7[i] = int(random(-15, 15));
    randomX8[i] = int(random(-15, 15));
    randomX9[i] = int(random(-15, 15));
    randomX0[i] = int(random(-15, 15));
    randomX11[i] = int(random(-15, 15));
    randomX12[i] = int(random(-20, 20));
    randomX13[i] = int(random(-30, 30));
    randomX14[i] = int(random(-15, 15));
    randomX15[i] = int(random(-15, 15));

    fillS1[i] = 0;
    fillS2[i] = 5;
    fillS3[i] = 10;
    fillS4[i] = 15;
    fillS5[i] = 20;
    fillS6[i] = 25;
    fillS7[i] = 30;
    fillS8[i] = 35;
    fillS9[i] = 40;
    fillS0[i] = 45;
    fillS11[i] = 25;
    fillS12[i] = 30;
    fillS13[i] = 35;
    fillS14[i] = 40;
    fillS15[i] = 45;

    fillB1[i] = 100;
    fillB2[i] = 105;
    fillB3[i] = 110;
    fillB4[i] = 115;
    fillB5[i] = 120;
    fillB6[i] = 125;
    fillB7[i] = 130;
    fillB8[i] = 135;
    fillB9[i] = 140;
    fillB0[i] = 145;

    radians1[i] = 45;
    radians2[i] = 65;
    radians3[i] = 85;
    radians4[i] = 105;
    radians5[i] = 125;
    radians6[i] = 145;
    radians7[i] = 165;
    radians8[i] = 155;
    radians9[i] = 205;
    radians0[i] = 215;
  }
}


//savnig the result
void keyPressed () {
  if (key == ' ') {
    save ("myart.jpg");
    snuggle = false;
    bite = false;
    background (5, 10, 30);
    for (int i=0; i< numPos; i++) {
      xPos[i] = -50;
      yPos[i] = -50;
    }
  }

  //option mode
  if (key == CODED) {
    if (keyCode ==UP) {
      snuggle = true;
      bite = false;
    }
    if (keyCode == DOWN) {
      bite = true;
      snuggle = false;
    }
    if (keyCode == LEFT) {
      startOver();
    }
  }
}


//screen mode
boolean sketchFullScreen() {
  return true;
}



