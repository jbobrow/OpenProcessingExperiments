
int Score = 0; 
final int stateMenu                  = 0;
final int stateSeeQ1      = 1;
final int stateSeeQ2 = 2;
final int stateSeeQ3 = 3;
final int stateSeeQ4 = 4;
final int stateSeeQ5 = 5;
final int stateSeeQ6 = 6;
final int stateSeeQ7 = 7;
final int stateSeeQ8 = 8;
final int stateSeeQ9 = 9;
int state = stateMenu;
PFont font; 
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage image;

void setup()
{
  size(600, 600);
  smooth();
  font = createFont("CenturyGothic-Bold-30.vlw", 30);
  textFont(font);
  image = loadImage("cursor.gif");
   img = loadImage("SNAKE.jpg");
   img1 = loadImage("BIRD.jpg");
   img2 = loadImage("COW.jpg");
   img3 = loadImage("ELEPHANT.jpg");
   img4 = loadImage("FISH.jpg");
   img5 = loadImage("MOUSE.jpg");
   img6 = loadImage("PIG.jpg");
   img7 = loadImage("ZEBRA.jpg");
} 
void draw()
{
   if (mouseX < 50) {
    cursor(HAND);
  } else {
    cursor(image,0,0);
  }
  
  switch (state) {
  case stateMenu:
    showMenu();
    break;
  case stateSeeQ1:
    handleStateSeeQ1();
    break;
  case stateSeeQ2:
    handleStateSeeQ2();
    break;
  case stateSeeQ3:
    handleStateSeeQ3();
    break;
  case stateSeeQ4:
    handleStateSeeQ4();
    break;
   case stateSeeQ5:
    handleStateSeeQ5();
    break;
   case stateSeeQ6:
    handleStateSeeQ6();
    break;
   case stateSeeQ7:
    handleStateSeeQ7();
    break;
   case stateSeeQ8:
    handleStateSeeQ8();
    break;
  default:
    println ("Unknown state (in draw) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
// ----------------------------------------------------------------
// keyboard functions

void keyPressed() {
  // keyboard. Also different depending on the state.
  switch (state) {
  case stateMenu:
    keyPressedForStateMenu();
    break;
  case stateSeeQ1:
    keyPressedForStateSeeQ1();
    break;
  case stateSeeQ2:
    keyPressedForStateSeeQ2();
    break;
  case stateSeeQ3:
    keyPressedForStateSeeQ3();
    break;
   case stateSeeQ4:
    keyPressedForStateSeeQ4();
    break;
   case stateSeeQ5:
    keyPressedForStateSeeQ5();
    break;
   case stateSeeQ6:
    keyPressedForStateSeeQ6();
    break;
   case stateSeeQ7:
    keyPressedForStateSeeQ7();
    break;
   case stateSeeQ8:
    keyPressedForStateSeeQ8();
    break;
  default:
    println ("Unknown state (in keypressed) "
      + state
      + " ++++++++++++++++++++++");
    exit();
    break;
  } // switch
  //
} // func
void keyPressedForStateMenu() {
  //
  switch(key) {
  case '1':
    state = stateSeeQ1;
    break;
  case '2':
    state = stateSeeQ2;
    break;
  case '3':
    state = stateSeeQ3;
    break;
  case '4':
    state = stateSeeQ4;
    break;
  case '5':
    state = stateSeeQ5;
    break;
  case '6':
    state = stateSeeQ6;
    break;
  case '7':
    state = stateSeeQ7;
    break;  
 case '8':
    state = stateSeeQ8;
    break;

  case 'x':
  case 'X':
    // quit
    exit();
    break;
  default:
    // do nothing
    break;
  }
} 
void keyPressedForStateSeeQ1() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ2;
    break;
  } 
} 
void keyPressedForStateSeeQ2() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ3;
    break;
  } 
}
 void keyPressedForStateSeeQ3() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ4;
    break;
  }
} 
void keyPressedForStateSeeQ4() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ5;
    break;
  } 
}
void keyPressedForStateSeeQ5() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ6;
    break;
  }
} 
void keyPressedForStateSeeQ6() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ7;
    break;
  } 
}
void keyPressedForStateSeeQ7() {
  // any key is possible
  switch(key) {
  default:
    state = stateSeeQ8;
    break;
  }
}
void keyPressedForStateSeeQ8() {
  // any key is possible
  switch(key) {
  default:
    state = stateMenu;
    break;
  } 
}

void showMenu() {
  background(138, 219, 235 );
  fill(0);
  textSize(32);
  text(" Animal QUIZ time! ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES ", 100, 200);
  text("Press 2 to say NO ", 100, 220);
  //
  text("Press x to quit ", 100, 260);
  //
} // func

void handleStateSeeQ1() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a snake? ", 180, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 200, 200);
   image(img,110,230);
  //
} // func
//

void handleStateSeeQ2() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this an elephant?", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img1,110,230);
  //
} // func
void handleStateSeeQ3() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a bird? ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img2,110,230);
  //
} // func
//
void handleStateSeeQ4() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a zebra? ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img3,110,230);
  //
} // func
//
void handleStateSeeQ5() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a cow? ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img4,110,230);
  //
} // func
//
void handleStateSeeQ6() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a fish? ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img5,110,230);
  //
} // func
//
void handleStateSeeQ7() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a mouse? ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img6,110,230);
  //
} // func
//
void handleStateSeeQ8() {
  background(255, 204, 0);
  fill(0);
  textSize(32);
  text(" Is this a dog? ", 150, 100, 3);
  textSize(14);
  text("Press 1 to say YES or to to say NO ", 100, 200);
  image(img7,110,230);
  //
} // func
//



