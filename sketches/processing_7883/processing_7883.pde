

int page = 1;

PFont font;

//images
PImage down_1_copy;
PImage down_2_copy;
PImage down_3_copy;
PImage through_the_earth_copy;
PImage antipathies_copy;
PImage there_are_no_mice_in_the_air_copy;
PImage cat_bat_copy;
PImage bat_cat_copy;
PImage and_the_fall_was_over;
PImage wake_up_alice_copy;
PImage alice_with_pig_copy;
PImage queen_off_with_hh_copy;
PImage fall_objects_copy_less_3;
PImage baby_portrait_copy_tint;
PImage queen_liz_copy_tint;
PImage jam_copy_tint;
PImage fall_objects_copy_no_jam;
PImage baby_portrait;
PImage queen_liz;
PImage jam;
PImage alice_to_queen_copy;
PImage duchess_copy;
PImage alice_falling;
PImage bat;
PImage beetle;
PImage blowfly;
PImage butterfly;
PImage cup_1;
PImage dodo;
PImage flamingo;
PImage geography_items_copy;
PImage keys;
PImage owl;
PImage oyster;
PImage serving_dish;
PImage snail_3;
PImage tapyr;
PImage tea_service;
PImage trenton_copy;
PImage turtle_skeleton;
PImage cards;
PImage hedgehog_left;
PImage mad_copy;
PImage cat_on_tree_copy;
PImage down_1;
PImage down_2;
PImage down_3;


//BUTTONS
////page 1
//button one
int b1Ax = 60;
int b1Ay = 50;
int b1Aw = 140;
int b1Ah = 60;
////page 2
//button one
int b2Ax = 210;
int b2Ay = 40;
int b2Aw = 97;
int b2Ah = 60;
//button two
int b2Bx = 288;
int b2By = 100;
int b2Bw = 170;
int b2Bh = 30;
////page 3
//button one
int b3Ax = 310;
int b3Ay = 50;
int b3Aw = 75;
int b3Ah = 30;
//button two
int b3Bx = 362;
int b3By = 120;
int b3Bw = 230;
int b3Bh = 30;
////page 4
//button one
int b4Ax = 110;
int b4Ay = 128;
int b4Aw = 110;
int b4Ah = 55;
//button two
int b4Bx = 462;
int b4By = 60;
int b4Bw = 110;
int b4Bh = 55;
////page 5
//button one
int b5Ax = 477;
int b5Ay = 380;
int b5Aw = 110;
int b5Ah = 55;
////page 6
//button one
int b6Ax = 283;
int b6Ay = 110;
int b6Aw = 220;
int b6Ah = 35;
////page 7
//button one
int b7Ax = 434;
int b7Ay = 58;
int b7Aw = 120;
int b7Ah = 40;
//
////page 8
//button one
int b8Ax = 477;
int b8Ay = 322;
int b8Aw = 120;
int b8Ah = 60;
//
////page 9
//button one
int b9Ax = 371;
int b9Ay = 48;
int b9Aw = 50;
int b9Ah = 30;
//button two
int b9Bx = 463;
int b9By = 49;
int b9Bw = 90;
int b9Bh = 30;
//page 10
//
int b10Ax = 330;
int b10Ay = 230;
int b10Aw = 190;
int b10Ah = 70;
//
//page 11
//button 1
int b11Ax = -20;
int b11Ay = -10;
int b11Aw = 210;
int b11Ah = 345;
//button 2
int b11Bx = 208;
int b11By = 220;
int b11Bw = 260;
int b11Bh = 500;
//button 3
int b11Cx = 490;
int b11Cy = 0;
int b11Cw = 150;
int b11Ch = 80;
//
//page 12
//button 1
int b12Ax = 291;
int b12Ay = 185;
int b12Aw = 150;
int b12Ah = 50;
//
//page 13
//take this child
int b13Bx = 200;
int b13By = 50;
int b13Bw = 210;
int b13Bh = 70;
//
//leave it behind...?
int b13Ax = 20;
int b13Ay = 350;
int b13Aw = 270;
int b13Ah = 50;
//
//page 14 head!
//button 1
int b14Ax = 490;
int b14Ay = 140;
int b14Aw = 110;
int b14Ah = 60;
//
//page 15 mad?
//button 1
int b15Ax = 490;
int b15Ay = 140;
int b15Aw = 110;
int b15Ah = 60;
//
//page 16 you are mad
//button 1
int b16Ax = 120;
int b16Ay = 200;
int b16Aw = 270;
int b16Ah = 60;
//
//page 17 you are mad
//button 1
int b17Ax = 110;
int b17Ay = 180;
int b17Aw = 200;
int b17Ah = 60;



void setup()
{

  size(640, 480);
  smooth();
  //font
  font = loadFont("EutemiaI-Italic-48.vlw");
  font = loadFont("EutemiaI-Italic-60.vlw");
  font = loadFont("EutemiaI-Italic-72.vlw");
  font = loadFont("EutemiaI-Italic-30.vlw");
  font = loadFont("EutemiaI-Italic-32.vlw");
  textFont(font);

  //load images
  down_1_copy = loadImage("down_1_copy.png");
  down_2_copy = loadImage("down_2_copy.png");
  down_3_copy = loadImage("down_3_copy.png");
  through_the_earth_copy = loadImage("through_the_earth_copy.png");
  antipathies_copy = loadImage("antipathies_copy.png");
  there_are_no_mice_in_the_air_copy = loadImage("there_are_no_mice_in_the_air_copy.png");
  cat_bat_copy = loadImage("cat_bat_copy.png");
  bat_cat_copy = loadImage("bat_cat_copy.png");
  and_the_fall_was_over = loadImage("and_the_fall_was_over.png");
  wake_up_alice_copy = loadImage("wake_up_alice_copy.png");
  alice_with_pig_copy = loadImage("alice_with_pig_copy.png");
  queen_off_with_hh_copy = loadImage("queen_off_with_hh_copy.png");
  fall_objects_copy_less_3 = loadImage("fall_objects_copy_less_3.png");
  baby_portrait = loadImage("baby_portrait.png");
  queen_liz = loadImage("queen_liz.png");
  jam = loadImage("jam.png");
  queen_liz_copy_tint = loadImage("queen_liz_copy_tint.png");
  jam_copy_tint = loadImage("jam_copy_tint.png");
  baby_portrait_copy_tint = loadImage("baby_portrait_copy_tint.png");
  alice_to_queen_copy = loadImage("alice_to_queen_copy.png");
  duchess_copy = loadImage("duchess_copy.png");
  alice_falling = loadImage("alice_falling.png");
  bat = loadImage("bat.png");
  beetle = loadImage("beetle.png");
  blowfly = loadImage("blowfly.png");
  butterfly = loadImage("butterfly.png");
  blowfly = loadImage("blowfly.png");
  cup_1 = loadImage("cup_1.png");
  dodo = loadImage("dodo.png");
  flamingo = loadImage("flamingo.png");
  geography_items_copy = loadImage("geography_items_copy.png");
  keys = loadImage("keys.png");
  owl = loadImage("owl.png");
  oyster = loadImage("oyster.png");
  serving_dish = loadImage("serving_dish.png");
  snail_3 = loadImage("snail_3.png");
  tapyr = loadImage("tapyr.png");
  tea_service = loadImage("tea_service.png");
  trenton_copy = loadImage("trenton_copy.png");
  turtle_skeleton = loadImage("turtle_skeleton.png");
  cards = loadImage("cards.png");
  hedgehog_left = loadImage("hedgehog_left.png");
  cat_on_tree_copy = loadImage("cat_on_tree_copy.png");
  mad_copy = loadImage("mad_copy.png");
  down_1 = loadImage("down_1.png");
  down_2 = loadImage("down_2.png");
  down_3 = loadImage("down_3.png");
  
}

void draw() {

  if (page == 1) {
    pageOne();
  } 
  else if (page == 2) {
    pageTwo();
  } 
  else if (page == 3) {
    pageThree();
  }
  else if (page == 4) {
    pageFour();
  }
  else if (page == 5) {
    pageFive();
  }
  else if (page == 6) {
    pageSix();
  }
  else if (page == 7) {
    pageSeven();
  }
  else if (page == 8) {
    pageEight();
  }
  else if (page == 9) {
    pageNine();
  }
  else if (page == 10) {
    pageTen();
  }
  else if (page == 11) {
    pageEleven();
  }
  else if (page == 12) {
    pageTwelve();
  }
  else if (page == 13) {
    pageThirteen();
  }
  else if (page == 14) {
    pageFourteen();
  }
  else if (page == 15) {
    pageFifteen();
  }
  else if (page == 16) {
    pageSixteen();
  }
  else if (page == 17) {
    pageSeventeen();
  }
}

void mousePressed() { //button connections


  if (page == 1) {
    if (overButton(b1Ax, b1Ay, b1Aw, b1Ah) == true) { //page 1 to 2
      page = 2;
    }
  }
  else if (page == 2) {
    if (overButton(b2Ax, b2Ay, b2Aw, b2Ah) == true) { //page 2 to 3
      page = 3;
    }
   
    if (overButton(b2Bx, b2By, b2Bw, b2Bh) == true) { //page 2 to 11
      page = 11;
    }
  }
  else if (page == 3) {
    if (overButton(b3Ax, b3Ay, b3Aw, b3Ah) == true) { //page 3 to 1
      page = 11;
    }    
    if (overButton(b3Bx, b3By, b3Bw, b3Bh) == true) { //page 3 to 11
      page = 4;
    }
  }
  else if (page == 4) {
    if (overButton(b4Ax, b4Ay, b4Aw, b4Ah) == true) { //page 4 to 5
      page = 5;
    }
    if (overButton(b4Bx, b4By, b4Bw, b4Bh) == true) { //page 4 to 1
      page = 11;
    }
  }
  else if (page == 5) {
    if (overButton(b5Ax, b5Ay, b5Aw, b5Ah) == true) { //page 5 to 6
      page = 6;
    }
  }
  else if (page == 6) {
    if (overButton(b6Ax, b6Ay, b6Aw, b6Ah) == true) { //page 6 to 7
      page = 7;
    }
  }
  else if (page == 7) {
    if (overButton(b7Ax, b7Ay, b7Aw, b7Ah) == true) { //page 7 to 8
      page = 8;
    }
  }
  else if (page == 8) {
    if (overButton(b8Ax, b8Ay, b8Aw, b8Ah) == true) { //page 8 to 9
      page = 9;
    }
  }
  else if (page == 9) {
    if (overButton(b9Ax, b9Ay, b9Aw, b9Ah) == true) { //page 9 to 10
      page = 1;
    }
    if (overButton(b9Bx, b9By, b9Bw, b9Bh) == true) { //page 9 to 1
      page = 10;
    }
  }
  else if (page == 10) {
    if (overButton(b10Ax, b10Ay, b10Aw, b10Ah) == true) { //page 10 to 1
      page = 11;
    }
  }
  else if (page == 11) { //OBJECTS
    if (overButton(b11Ax, b11Ay, b11Aw, b11Ah) == true) { //11 to 12
      page = 12;
    }
    if (overButton(b11Bx, b11By, b11Bw, b11Bh) == true) { //11 to 14
      page = 14;
    }
    if (overButton(b11Cx, b11Cy, b11Cw, b11Ch) == true) { //11 to 14
      page = 17;
    }
  }
    else if (page == 12) {
      if (overButton(b12Ax, b12Ay, b12Aw, b12Ah) == true) { //12 to 13 DUCHESS
        page = 13;
      }
    }
    else if (page == 13) {
      if (overButton(b13Ax, b13Ay, b13Aw, b13Ah) == true) { //page 13 to 1
        page = 1;
      }
      if (overButton(b13Bx, b13By, b13Bw, b13Bh) == true) { //page 13 to 11
        page = 11;
      }
    }
    else if (page == 14) {
      if (overButton(b14Ax, b14Ay, b14Aw, b14Ah) == true) { //page 12 to 1
        page = 17;
      }
    }
  else if (page == 15) {
      if (overButton(b15Ax, b15Ay, b15Aw, b15Ah) == true) { //page 12 to 1
         page = 16;
      }
    }
    else if (page == 16) {
      if (overButton(b16Ax, b16Ay, b16Aw, b16Ah) == true) { //page 16 to 11
         page = 11;
      }
    }
    else if (page == 17) {
      if (overButton(b17Ax, b17Ay, b17Aw, b17Ah) == true) { //page 16 to 11
         page = 15;
      }
    }
  }



// BUTTON BOOLEAN
boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  }
  else {
    return false;
  }
}

// PAGE ONE
void pageOne() {
  image (down_1,0,0);
  //text
  font = loadFont("EutemiaI-Italic-72.vlw");
  textFont(font);
  text("Down", 60, 75);


  // Button
  if (overButton(b1Ax, b1Ay, b1Aw, b1Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }
}

// PAGE TWO

void pageTwo() {
  image (down_2,0,0);

  font = loadFont("EutemiaI-Italic-60.vlw"); //down
  textFont(font);

  // Button 1
  if (overButton(b2Ax, b2Ay, b2Aw, b2Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }
  // rect(b2Ax, b2Ay, b2Aw, b2Ah);
  // textAlign(LEFT);
  // noFill();
  text("down", 210, 75);


  font = loadFont("EutemiaI-Italic-40.vlw"); //such a a fall as this, 
  textFont(font);

  //button2
  if (overButton(b2Bx, b2By, b2Bw, b2Bh) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }
  //rect(b2Bx, b2By, b2Bw, b2Bh);
  //textAlign(LEFT);
  //noFill();
  textSize(34);
  text("such a fall as this,", 287, 129);
}

////PAGE THREE
void pageThree() {
  image(down_3, 0,0);

  font = loadFont("EutemiaI-Italic-40.vlw"); //Down...
  textFont(font);

  //button1
  if (overButton(b3Ax, b3Ay, b3Aw, b3Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }
  //rect(b3Ax, b3Ay, b3Aw, b3Ah);
  //textAlign(LEFT);
  //noFill();
  text("down ...", 310, 72);

  font = loadFont("EutemiaI-Italic-40.vlw"); //right through the earth!
  textFont(font);

  //button2
  if (overButton(b3Bx, b3By, b3Bw, b3Bh) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }
  //rect(b3Bx, b3By, b3Bw, b3Bh);
  //textAlign(LEFT);
  //noFill();
  textSize(30);
  text("right through the earth!", 363, 146);
}

// PAGE FOUR

void pageFour() {
  image (through_the_earth_copy,0,0);

  font = loadFont("EutemiaI-Italic-60.vlw"); //There
  textFont(font);

  // Button 1
  if (overButton(b4Ax, b4Ay, b4Aw, b4Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b4Ax, b4Ay, b4Aw, b4Ah);
  //noFill();
  text("There", 110, 175);


  font = loadFont("EutemiaI-Italic-60.vlw"); //Here
  textFont(font);

  //button2
  if (overButton(b4Bx, b4By, b4Bw, b4Bh) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b4Bx, b4By, b4Bw, b4Bh);
  //noFill();
  text("Here", 460, 110);
}

// PAGE FIVE

void pageFive() {
  image (antipathies_copy,0,0);

  font = loadFont("EutemiaI-Italic-40.vlw"); //There
  textFont(font);

  // Button 1
  if (overButton(b5Ax, b5Ay, b5Aw, b5Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }
  //rect(b5Ax, b5Ay, b5Aw, b5Ah);
  //noFill();
  textSize(36);
  text("I think ...", 477, 428);

}

// PAGE SIX
void pageSix() {
  image (there_are_no_mice_in_the_air_copy,0,0);

  font = loadFont("EutemiaI-Italic-60.vlw"); //There
  textFont(font);

  // Button 1
  if (overButton(b6Ax, b6Ay, b6Aw, b6Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }

  //rect(b6Ax, b6Ay, b6Aw, b6Ah);
  //noFill();
  textSize(48);
  text("mice in the air.", 283, 133);

}

// PAGE SEVEN
void pageSeven() {
  image (cat_bat_copy,0,0);

  font = loadFont("EutemiaI-Italic-72.vlw"); //There
  textFont(font);

  // Button 1
  if (overButton(b7Ax, b7Ay, b7Aw, b7Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }

  //rect(b7Ax, b7Ay, b7Aw, b7Ah);
  //noFill();

  text("bats?", 430, 98);

}

// PAGE EIGHT
void pageEight() {
  image (bat_cat_copy,0,0);

  font = loadFont("EutemiaI-Italic-72.vlw"); //There
  textFont(font);

  // Button 1
  if (overButton(b8Ax, b8Ay, b8Aw, b8Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 130);
  }

  //rect(b8Ax, b8Ay, b8Aw, b8Ah);
  //noFill();

  text("cats?", 477, 380);

}

//// PAGE NINE
//
void pageNine() {
  image (and_the_fall_was_over,0,0);

  font = loadFont("EutemiaI-Italic-60.vlw"); //fall
  textFont(font);

  // Button 1
  if (overButton(b9Ax, b9Ay, b9Aw, b9Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b9Ax, b9Ay, b9Aw, b9Ah);
  //noFill();
  textSize(50);
  text("fall", 371, 80);

  font = loadFont("EutemiaI-Italic-72.vlw"); //over
  textFont(font);

  //button2
  if (overButton(b9Bx, b9By, b9Bw, b9Bh) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b9Bx, b9By, b9Bw, b9Bh);
  //noFill();
  text("over.", 460, 80);
}

//// PAGE TEN
//
void pageTen() {
  image (wake_up_alice_copy,0,0);

  font = loadFont("EutemiaI-Italic-72.vlw"); //over
  textFont(font);

  //button2
  if (overButton(b10Ax, b10Ay, b10Aw, b10Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b10Ax, b10Ay, b10Aw, b10Ah);
  //noFill();
  text("long sleep", 335, 285);
}

//// PAGE ELEVEN OBJECTS////////////////////////////////////////////////////////
//
void pageEleven() {
  background(72, 85, 107);
  
  if (overButton(b11Ax, b11Ay, b11Aw, b11Ah) == true) {
    tint(255);
  }
  else {
    tint(255, 150);
  }
  image(baby_portrait, -55, -20);
  
  noTint();
  if (overButton(b11Bx, b11By, b11Bw, b11Bh) == true) {
    tint(255);
  }
  else {
    tint(255, 150);
  }
  image(queen_liz, 240, 200);
  noTint();
  
  if (overButton(b11Cx, b11Cy, b11Cw, b11Ch) == true) {
    tint(255);
  }
  else {
    tint(255, 150);
  }
  image(cards, 500, -5);
  
  noTint();
  
  image(jam, 520, 230);
  image(flamingo, 155, 10);
  image(tea_service, -40, 350);
  image(geography_items_copy, 250, 50);
  image(dodo, 500, 330);
  image(turtle_skeleton, 530, 70);
  image(cup_1, 155, 250);
  image(hedgehog_left, 294, -40);
  image(keys, 245, 184);
  
  
  
  


  //button2
  if (overButton(b11Ax, b11Ay, b11Aw, b11Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b11Ax, b11Ay, b11Aw, b11Ah);
  //noFill();
  //rect(b11Bx, b11By, b11Bw, b11Bh);
  //rect(b11Cx, b11Cy, b11Cw, b11Ch);
  //noFill();

}
//// PAGE TWELVE
//
void pageTwelve() {
  image(duchess_copy, 0, 0);

  font = loadFont("EutemiaI-Italic-60.vlw"); //over
  textFont(font);

  //button2
  if (overButton(b12Ax, b12Ay, b12Aw, b12Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b12Ax, b12Ay, b12Aw, b12Ah);
  //noFill();
  text("a moral", 295, 225);
}

//// PAGE THIRTEEN
//
void pageThirteen() {
  image(alice_with_pig_copy,0,0);

  font = loadFont("EutemiaI-Italic-48.vlw"); //fall
  textFont(font);

  // Button 1
  if (overButton(b13Bx, b13By, b13Aw, b13Bh) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b13Bx, b13By, b13Bw, b13Bh);
  //noFill();
  textSize(36);
  text("take this", 200, 95);
  font = loadFont("EutemiaI-Italic-60.vlw");
  textFont(font);
  text("child",300 ,95);


  font = loadFont("EutemiaI-Italic-40.vlw"); //over
  textFont(font);

  //button2
  if (overButton(b13Ax, b13Ay, b13Aw, b13Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b13Ax, b13Ay, b13Aw, b13Ah);
  //noFill();
  textSize(36);
  text("to leave it behind...?",60, 390);
}
//// PAGE FOURTEEN
//
void pageFourteen() {
  image(queen_off_with_hh_copy, 0, 0);

  font = loadFont("EutemiaI-Italic-72.vlw"); //over
  textFont(font);

  //button2
  if (overButton(b14Ax, b14Ay, b14Aw, b14Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b14Ax, b14Ay, b14Aw, b14Ah);
 // noFill();
  text("head!", 485, 192);
}

//// PAGE FIFTEEN
//
void pageFifteen() {
  image(mad_copy, 0, 0);

  font = loadFont("EutemiaI-Italic-40.vlw"); //over
  textFont(font);
  fill(0);
  text("How do you know I'm", 200, 187);

  //button2
  if (overButton(b15Ax, b15Ay, b15Aw, b15Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 150);
  }
  //rect(b15Ax, b15Ay, b15Aw, b15Ah);
 // noFill();
  text("mad?", 521, 187);
   
}
//// PAGE SIXTEEN
//
void pageSixteen() {
  image(cat_on_tree_copy, 0, 0);

  font = loadFont("EutemiaI-Italic-40.vlw"); //over
  textFont(font);
  fill(0);
  text("We're all mad here. I'm mad.", 10, 167);

  //button1
  if (overButton(b16Ax, b16Ay, b16Aw, b16Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 160);
  }
  //rect(b16Ax, b16Ay, b16Aw, b16Ah);
  //noFill();
  font = loadFont("EutemiaI-Italic-72.vlw"); //over
  textFont(font);
  text("You are mad.", 120, 250);
}
//// PAGE SEVENTEEN
//
void pageSeventeen() {
  image(alice_to_queen_copy, 0, 0);
  //button1
  if (overButton(b17Ax, b17Ay, b17Aw, b17Ah) == true) {
    fill(255);
  }
  else {
    fill(255, 160);
  }
  //rect(b17Ax, b17Ay, b17Aw, b17Ah);
  //noFill();
  font = loadFont("EutemiaI-Italic-60.vlw"); //over
  textFont(font);
  textSize(50);
  text("pack of cards!", 110, 225);
}







