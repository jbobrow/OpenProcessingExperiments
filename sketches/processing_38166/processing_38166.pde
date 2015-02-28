
// Jolyn Sandford
// CMU EMS Section D
// Assignment 4, September 21st, 2011
// Images property of BBC and JT's Blog

//images
PImage[] TARDIS = new PImage[6];
PImage cosmos;
PImage DALEK;
PImage danger;
int timeRecord = -40000;
int flicker;
int dalekVariation;
int dalekPosition;
int variation, position;
int DALEKfloat;

void setup() {
  smooth();
  size (1024, 768);

  //load the images!
  for (int i = 0; i <= 5; i++) {
    TARDIS[i] = loadImage ("tardis" + i + ".png");
  }

  //load images
  cosmos = loadImage ("cosmos.jpg");
  DALEK = loadImage ("dalek.png");
  danger = loadImage ("DANGER.png");
}





void draw() {
  tint(255, 255);
  dalekPosition = int(random(50, 650));
  dalekVariation = int(random(-300, 300));
  image(cosmos, 0, 0);

  //button
  DANGERBUTTIN();
  
  DANGER();

  //rotating TARDIS
  TARDIS();
}



void TARDIS() {
  int rotateTime = ((millis()/60) % 6); //rotates the TARDIS
  int TARDISfloat = ((millis()/10) % 1320); // moves the TARDIS across the screen

  // makes the TARDIS bob
  int TARDISbob = ((millis()/3) % 2000);
  float inc = TWO_PI/25.0;
  float a = (inc*(TARDISbob))/40;
  float y = 50*(sin(a));

  // makes the TARDIS flicker
  float b = (inc*(rotateTime))/20;
  tint(255, 255);

  //draws the TARDIS
  image (TARDIS[rotateTime], TARDISfloat-200, 250+y);

  // if the mouse is clicked, the TARDIS flickers
  if (mousePressed && (632>mouseX) && (mouseX<968) && (679>mouseY) && (mouseY<721)) {
    int TARDISflicker = ((millis()/5) % 255);
    if (flicker == 255) {

      flicker = 255;
    }
    else {
      flicker = 255;
    }
  }
}

void DALEK() {
  tint(255, 255);
  image (DALEK, 200, 200);
}





void DANGERBUTTIN() {
  fill(224, 61, 7);
  strokeWeight(2);
  stroke(191, 58, 13);
  fill (111, 20, 4);
  int DALEKfloat = ((millis()/5) % 1620);
  if (mousePressed && (632<mouseX) && (mouseX<968) && (679<mouseY) && (mouseY<721)) {
    timeRecord = millis();
  }
  else {
    fill(224, 61, 7);
  }
  rect (800, 700, 168, 21);
  image (danger, 804, 704);
}


void DANGER() {
  DALEKfloat = ((millis()-timeRecord)/5);
  image (DALEK, (DALEKfloat-600), 400);
  image (DALEK, (DALEKfloat-600)+200, 300);
  image (DALEK, (DALEKfloat-600-100), 100);
  image (DALEK, (DALEKfloat-600), 150);
  image (DALEK, (DALEKfloat-600+150), 600);
  image (DALEK, (DALEKfloat-700), 550);
  image (DALEK, (DALEKfloat-600-100), 100);
  image (DALEK, (DALEKfloat-600-150), 250);
  image (DALEK, (DALEKfloat-600-150), 250);
}


