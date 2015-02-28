
int card = 0;

PImage HomeFrame1;
PImage arrow;
PImage Frame2;
PImage arrowOver;
PImage Frame2_1;
PImage Frame2_2;
PImage Frame3;


/* @pjs preload="HomeFrame1.png,arrow.png,arrowOver.png,Frame2_1.png,Frame2_2.png,Frame3.png"; */

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
      card = 0;
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
    image(arrow, 690, 545);
  }
}


