
/*
 Longing
 Sara Teasdale
 I am not sorry for my soul that it must go unsatisfied,
 For it can live a thousand times, 
 Eternity is deep and wide.
 
 I am not sorry for my soul, 
 But oh,
 My body that must go Back to a little drift of dust without the joy it longed to know
 */

PFont F1, F2, F3;
PImage [] img = new PImage[9];

String P1_1 = " Longing ";
String P1_2 = " Sara Teasdale "; 
String P2 = " I am not sorry for my soul that it must go unsatisfied, ";
String P3 = " For it can live a thousand times, ";
String P4 = " Eternity is deep and wide. ";
String P5 = " I am not sorry for my soul,  ";
String P6 = " But oh, ";
String P7_1 = " My body that must go Back to a little drift of dust  ";
String P7_2 = " without the joy it longed to know ";
String P8_1 = " My body that must go Back to a little drift of dust  ";
String P8_2 = " without the joy it longed to know ";
String P8_3 = " End . ";

int page = 1;

void setup() {
  size (700, 600);
  background(0);

  for (int i = 1; i<=8; i++) {
    img[i] = loadImage(i+".jpg");
  }

  F1 = createFont("Palace Script MT", 48);
  F2 = createFont("Palace Script MT", 36);
  F3 = createFont("Palace Script MT", 60);
}

void draw() {

  fill(0);
  rect(0, 0, width, height);

  if (page == 1) {

    fill(0);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(300, 30, 332, 500);
    image(img[1], 320, 50);


    fill(255, 245, 250);
    textFont(F1);
    text(P1_1, 80, 190);
    text(P1_2, 80, 250);
  } 
  else if (page == 2) {
    fill(0);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(120, 60, 500, 332);
    image(img[2], 140, 80);

    fill(255, 245, 250);
    textFont(F1);
    text(P2, 30, 490);
  }
  else if (page == 3) {
    fill(0);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(100, 60, 500, 332);
    image(img[3], 80, 80);

    fill(255, 245, 250);
    textFont(F1);
    text(P3, 280, 490);
  }
  else if (page == 4) {
    fill(0);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(90, 100, 500, 332);
    image(img[4], 110, 120);

    textFont(F1);
    text(P4, 150, 410);
  }
  else if (page == 5) {
    fill(0);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(50, 70, 332, 500);
    image(img[5], 70, 50);

    fill(255, 245, 250);
    textFont(F1);
    text(P5, 327, 185);
  }
  else if (page == 6) {
    fill(15,5,5);
    rect(0, 0, width, height);

    fill(25,9,9);
    rect(70, 70, 500, 375);
    image(img[6], 90, 90);

    textAlign(CENTER);
    textFont(F3);
    text(P6, 351, 271);
    fill(255, 245, 250);
    text(P6, 350, 270);
    textAlign(LEFT);
  }
  else if (page == 7) {
    fill(15,5,5);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(60, 200, 500, 332);
    image(img[7], 80, 180);
    textAlign(RIGHT);
    fill(255, 245, 250);
    textFont(F1);
    text(P7_1, 650, 80);
    text(P7_2, 650, 130);
    textAlign(LEFT);
  }
  else if (page == 8) {
    fill(15,5,5);
    rect(0, 0, width, height);

    fill(25, 9, 9);
    rect(60, 200, 500, 332);
    image(img[8], 80, 180);
    textAlign(RIGHT);
    fill(255, 245, 250);
    textFont(F1);
    text(P8_1, 650, 80);
    text(P8_2, 650, 130);
    textFont(F2);
    text(P8_3, 650, 570);
    textAlign(LEFT);
  }
}

void mousePressed() {
  if (page == 1) {
    page = 2;
  }
  else if ( page == 2) {
    page = 3;
  }
  else if ( page == 3) {
    page = 4;
  }
  else if ( page == 4) {
    page = 5;
  }
  else if ( page == 5) {
    page = 6;
  }
  else if ( page == 6) {
    page = 7;
  }
  else if ( page == 7) {
    page = 8;
  }
  else if ( page == 8) {
    page = 1;
  }
}



