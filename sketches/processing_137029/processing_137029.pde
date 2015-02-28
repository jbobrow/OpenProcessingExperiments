
/* @pjs preload="dropsss1.png, dropsss2.png, dropsss3.png, dropsss4.png, dropsss5.png, dropsss6.png, dropsss7.png, dropsss8.png, dropsss9.png, dropsss10.png, dropsss11.png, wave.png"; */

PImage drops1 ;
PImage drops2 ;
PImage drops3 ;
PImage drops4 ;
PImage drops5 ;
PImage drops6 ;
PImage drops7 ;
PImage drops8 ;
PImage drops9 ;
PImage drops10 ;
PImage drops11 ;
PImage wave ;
int x = 0 ;
int ywave = 1100 ;
int myState = 0;
int myCounter = 3;

void setup () {
  size(650, 1000);
  background(255, 255, 255);
  drops1 = loadImage("dropsss1.png");
  smooth();
  drops2 = loadImage("dropsss2.png");
  smooth();
  drops3 = loadImage("dropsss3.png");
  smooth();
  drops4 = loadImage("dropsss4.png");
  smooth();
  drops5 = loadImage("dropsss5.png");
  smooth();
  drops6 = loadImage("dropsss6.png");
  smooth();
  drops7 = loadImage("dropsss7.png");
  smooth();
  drops8 = loadImage("dropsss8.png");
  smooth();
  drops9 = loadImage("dropsss9.png");
  smooth();
  drops10 = loadImage("dropsss10.png");
  smooth();
  drops11 = loadImage("dropsss11.png");
  smooth();
  wave = loadImage("wave.png");
  smooth(); 
};

void draw () {

  myCounter = myCounter - 1;

  switch(myState) {

  case 0:
    //drops1//
    image(drops1, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 1;
    }
    break;

  case 1:

    //drops2//
    image(drops2, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 2;
    }
    break;
    
  case 2:

    //drops2//
    image(drops3, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 3;
    }
    break;
    
  case 3:

    //drops2//
    image(drops4, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 4;
    }
    break;
    
  case 4:

    //drops2//
    image(drops5, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 5;
    }
    break;
    
  case 5:

    //drops2//
    image(drops6, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 6;
    }
    break;
    
  case 6:

    //drops2//
    image(drops7, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 7;
    }
    break;
    
    case 7:

    //drops2//
    image(drops8, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 8;
    }
    break;
    
    case 8:

    //drops2//
    image(drops9, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 9;
    }
    break;
    
    case 9:

    //drops2//
    image(drops10, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 10;
    }
    break;
    
    case 10:

    //drops2//
    image(drops11, 0, 0);
    if (myCounter < 0) {
      myCounter = 3;
      myState = 0;
    }
    break;
  }
  //wave//
  image(wave, 0, ywave);
  ywave = ywave - 1;
    if (ywave == -70) {
      ywave = 1100;
    }
};



