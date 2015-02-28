
int card = 0;

PImage HomeFrame1;
PImage arrow;
PImage Frame2;
PImage arrowOver;
PImage Frame2_1;
PImage Frame2_2;
PImage Frame3;
PImage Frame4;
PImage Frame5;
PImage Frame5_1;
PImage Frame5_2;
PImage Frame6;


/* @pjs preload="HomeFrame1.png,arrow.png,arrowOver.png,Frame2_1.png,Frame2_2.png,Frame3.png,Frame4.png,Frame5.png,Frame5_1.png,Frame5_2.png,Frame6.png"; */

void setup() {
  size (958,666);
  invite = loadImage("Frame2.png");
  //openning = loadImage("HomeFrame1.png");
  //arrow = loadImage("arrow.png");
}

void draw() {
  if (card == 0) {
    openning = loadImage("HomeFrame1.png");
    arrow = loadImage("arrow.png");
    //background (0);
    image(openning, 0, 0, width, height);
    image(arrow, 770, 150);
    int left = 770;
    int right = 923;
    int top = 150;
    int bottom = 254;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
      if (mousePressed) {
        card = 1;
      } else {
        arrowOver = loadImage("arrowOver.png");
      }
      image(arrowOver, 770, 150);
    }
      

  } else if (card == 1){
    //background (255);
    image(invite, 0, 0, width, height);
    int left = 9;
    int right = 384;
    int top = 248;
    int bottom = 579;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
    if (mousePressed) {
      card = 3;
    } else {
      motherOver = loadImage("Frame2_1.png");
    }
    image(motherOver, 9, 248);
    }
    left = 577;
    right = 953;
    top = 250;
    bottom = 580;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
    if (mousePressed) {
      card = 2;
    } else {
      flowerOver = loadImage("Frame2_2.png");
    }
    image(flowerOver, 577, 248);
    }    
  } else if (card == 2){
    frame3 = loadImage("Frame3.png");
    image(frame3, 0, 0);
    image(arrow, 660, 560);
    int left = 660;
    int right = 813;
    int top = 580;
    int bottom = 895;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom){
      if (mousePressed){
      card = 0;
    } else {
      arrowOver = loadImage("arrowOver.png");
      }
      image(arrowOver, 660, 560);
    }
  } else if (card == 3){
    frame4 = loadImage("Frame4.png");
    image(frame4, 0, 0);
    image(arrow, 400, 545);
    int left = 400;
    int right = 553;
    int top = 545;
    int bottom = 875;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
    if (mousePressed) {
      card = 4;
    } else {
        arrowOver = loadImage("arrowOver.png");
      }
      image(arrowOver, 400, 545);
    }
  } else if ( card == 4){
    frame5 = loadImage("Frame5.png");
    image(frame5, 0, 0);
    int left = 9;
    int right = 384;
    int top = 248;
    int bottom = 579;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
    if (mousePressed) {
      card = 5;
    } else {
      deerOver = loadImage("Frame5_1.png");
    }
    image(deerOver, 9, 248);
    }
    left = 577;
    right = 953;
    top = 250;
    bottom = 580;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
    if (mousePressed) {
      card = 2;
    } else {
      flowerOver2 = loadImage("Frame5_2.png");
    }
    image(flowerOver2, 577, 248);
    }    
  } else if ( card == 5){
    frame6 = loadImage("Frame6.png");
    image(frame6, 0, 0);
    image(arrow, 790, 375);
    int left = 790;
    int right = 943;
    int top = 375;
    int bottom = 489;
    if ( mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) {
      if (mousePressed) {
        card = 0;
      } else {
        arrowOver = loadImage("arrowOver.png");
      }
      image(arrowOver, 790, 375);
    }
  }
}


