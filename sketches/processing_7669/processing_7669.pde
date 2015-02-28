
//INT
int x = 480;
int page = 1;
int startTime = 0;
int payTime = 3000;

//FLOAT
float targetX, targetY;
float easing = 1;
float b = 0.0;

//SHAPE
PShape intro, instruct, choose, appetizer, entree, sashimi, roll, combo, dod, pay, pay1, drink, spin, soft, beer, custom;

//SETUP
void setup () {
  smooth ();
  noStroke();
  size (640, 480);

  //SHAPE
  intro = loadShape ("Intro.svg");
  instruct = loadShape ("Instructions.svg");
  choose = loadShape ("Choose.svg");
  appetizer = loadShape ("Appetizer.svg");
  entree = loadShape ("Entree.svg");
  sashimi = loadShape ("Sashimi.svg");
  roll = loadShape ("Roll.svg");
  combo = loadShape ("Combination.svg");
  dod = loadShape ("dod.svg");
  pay = loadShape ("pay.svg");
  pay1 = loadShape ("pay1.svg");
  drink = loadShape ("drinks.svg");
  spin = loadShape ("spin.svg");
  soft = loadShape ("soft.svg");
  beer = loadShape ("beer.svg");
  custom = loadShape ("custom.svg");
}

//DRAW
void draw () {
  //Page 1: Maki Introduction Screen
  if (page == 1) {
    //BACKGROUND
    shape (intro, 0, 0);
  }
  //Page 2: Maki Instruction Screen
  if (page == 2) {
    //BACKGROUND 
    shape (instruct, 0, 0);
  }
  //Page 3: Maki Choose Screen
  if (page == 3) {
    //BACKGROUND
    shape (choose, 0, 0);
  }
  //Page 4: Appetizer Screen
  if (page == 4) {
    //BACKGROUND 
    shape (appetizer, 0, 0);
  }
  //Page 41: Entree Screen 
  if (page == 41) {
    //BACKGROUND
    shape (entree, 0, 0);
  }
  //Page 42: Sashimi Screen
  if (page == 42) {
    //BACKGROUND
    shape (sashimi, 0, 0);
  }
  //Page 43: Roll Screen
  if (page == 43) {
    //BACKGROUND
    shape (roll, 0, 0);
  }
  //Page 44: Combination Screen
  if (page == 44) {
    //BACKGROUND
    shape (combo, 0, 0);
  }
  //Page 5: Drinks and Desserts Screen
  if (page == 5) {
    //BACKGROUND
    shape (dod, 0, 0);
  }
  //Page 5: Drinks and Desserts Screen
  if (page == 51) {
    //BACKGROUND
    shape (dod, 0, 0);
  }
  //Page 6: Payment Screen
  if (page == 6) {
    //BACKGROUND
    shape (pay, 0, 0);
    if (millis () > payTime + 3000) {
      page = 61;
    }
    pushMatrix();
    translate (329, x - 180);
    rotate (b);
    shape (spin, -16, -16);
    b = b + 0.1;
    popMatrix();
  }
  //Page 61: Payment Screen
  if (page == 61) {
    //BACKGROUND
    shape (pay1, 0, 0);
    if (millis () > payTime + 6000) {
      page = 1;
    }
  }
  //Page 7: Drinks Screen
  if (page == 7) {
    //BACKGROUND
    shape (drink, 0, 0);
  }
  //Page 71: Soft Drinks Screen
  if (page == 71) {
    //BACKGROUND
    shape (soft, 0, 0);
  }
  //Page 72: Beer Screen
  if (page == 72) {
    //BACKGROUND
    shape (beer, 0, 0);
  }
  //Page 8: Custom Screen
  if (page == 8) {
    //BACKGROUND 
    shape (custom, 0, 0);
  }
}

//MOUSE
void mousePressed() {
  //Page 1: Title Page
  if (page == 1) {
    if ((mouseX > 278) && (mouseX < 381) &&
      (mouseY < x - 45) && (mouseY > x - 71)) {
      page = 2;
    } 
    else {
      page = 1;
    }
  }
  //Page 2: Instruction Page
  if (page == 2) {
    if ((mouseX > 485) && (mouseX < 600) &&
      (mouseY < x - 48) && (mouseY > x - 77)) {
      page = 3;
    } 
    else {
      page = 2;
    }
  }
  //Page 3: Screen Page
  if (page == 3) {
    if ((mouseX > 30) && (mouseX < 120) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 4;
    }
    else {
    }
    if ((mouseX > 155) && (mouseX < 246) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 41;
    } 
    else {
    }
    if ((mouseX > 280) && (mouseX < 370) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 42;
    } 
    else {
    }
    if ((mouseX > 404) && (mouseX < 495) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 43;
    } 
    else {
    }
    if ((mouseX > 520) && (mouseX < 614) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 44;
    } 
    else {
    }
  }
  //Page 4: Appetizer
  if (page == 4) {
    if ((mouseX > 142) && (mouseX < 240) &&
      (mouseY < x - 200) && (mouseY > x - 295)) {
      page = 5;
    } 
    else {
    }
    if ((mouseX > 279) && (mouseX < 376) &&
      (mouseY < x - 200) && (mouseY > x - 295)) {
      page = 5;
    } 
    else {
    }
    if ((mouseX > 416) && (mouseX < 512) &&
      (mouseY < x - 200) && (mouseY > x - 295)) {
      page = 5;
    } 
    else {
    }
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
    } 
    else {
    }
  }
  //Page 41: Entree
  if (page == 41) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
    } 
    else {
    }
  }
  //Page 42: Sashimi
  if (page == 42) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
    } 
    else {
    }
  }
  //Page 43: Roll
  if (page == 43) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
    } 
    else {
    }
    if ((mouseX > 280) && (mouseX < 380) &&
      (mouseY < x - 380) && (mouseY > x - 400)) {
      page = 8;
      payTime = millis();
    } 
    else {
    }
  }
  //Page 44: Roll
  if (page == 44) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
    } 
    else {
    }
  }
  //Page 5: Drinks or Desserts
  if (page == 5) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 285) && (mouseX < 390) &&
      (mouseY < x - 60) && (mouseY > x - 100)) {
      page = 6;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 215) && (mouseX < 300) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 7;
      payTime = millis();
    } 
    else {
    }
  }
  //Page 6: Wait
  if (page == 6) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
      payTime = millis();
    } 
    else {
    }
  }
  //Page 7: Drinks
  if (page == 7) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 285) && (mouseX < 390) &&
      (mouseY < x - 60) && (mouseY > x - 100)) {
      page = 6;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 350) && (mouseX < 440) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 71;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 480) && (mouseX < 580) &&
      (mouseY < x - 200) && (mouseY > x - 300)) {
      page = 72;
      payTime = millis();
    } 
    else {
    }
  } 
  //Page 71: Soft Drinks
  if (page == 71) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 285) && (mouseX < 390) &&
      (mouseY < x - 60) && (mouseY > x - 100)) {
      page = 6;
      payTime = millis();
    } 
    else {
    }
  }
  //Page 72: Beer
  if (page == 72) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 285) && (mouseX < 390) &&
      (mouseY < x - 60) && (mouseY > x - 100)) {
      page = 6;
      payTime = millis();
    } 
    else {
    }
  }
  //Page 8: Custom
  if (page == 8) {
    if ((mouseX > 560) && (mouseX < 630) &&
      (mouseY < x - 390) && (mouseY > x - 470)) {
      page = 3;
      payTime = millis();
    } 
    else {
    }
    if ((mouseX > 285) && (mouseX < 390) &&
      (mouseY < x - 30) && (mouseY > x - 80)) {
      page = 6;
      payTime = millis();
    } 
    else {
    }
  }
}











