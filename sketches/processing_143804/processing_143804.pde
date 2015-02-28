
/* @pjs preload="screen1.jpg";*/
/* @pjs preload="screen2.jpg";*/
/* @pjs preload="screen3.jpg";*/
/* @pjs preload="screen4.jpg";*/
/* @pjs preload="screen5.jpg";*/
/* @pjs preload="screen6.jpg";*/
/* @pjs preload="screen7.jpg";*/
/* @pjs preload="screen8.jpg";*/
/* @pjs preload="screen9.jpg";*/
/* @pjs preload="screen10.jpg";*/
/* @pjs preload="screen11.jpg";*/
/* @pjs preload="screen12.jpg";*/
/* @pjs preload="screen13.jpg";*/
/* @pjs preload="screen14.jpg";*/
/* @pjs preload="screen15.jpg";*/
/* @pjs preload="screen16.jpg";*/
/* @pjs preload="screen17.jpg";*/
/* @pjs preload="screen18.jpg";*/
/* @pjs preload="screen19.jpg";*/
/* @pjs preload="Ghostpocalypse_-_1_Departure.mp3";*/

/**
 *
 * TODO: main thing: a single variable that keeps track of which screen the user is currently at
 *
 * Let's make several arrays, each is numberOfScreens long
 *
 **/

import ddf.minim.*;

Minim minim;

AudioPlayer player;

int currentScreen = 0;
int previousScreen = 0;

// TODO: start with an int that indicates the number of screens

int numberOfScreens = 19;

// TODO: start by making an array of image filenames (one for each screen):

String[] screenImageFilenames = new String[numberOfScreens];

PImage[] screenImages = new PImage[numberOfScreens];

// TODO: create an array of "choice 1" for each screen (where choice 1 goes from that screen)

int[] firstChoice = new int[numberOfScreens];

int[] secondChoice = new int[numberOfScreens];

int[] thirdChoice = new int[numberOfScreens];

int transparency = 0;

void setup() {

  size(1366, 768);

  minim = new Minim(this);

  player = minim.loadFile("Ghostpocalypse_-_1_Departure.mp3");

  player.loop();


  // TODO: go through and specify each image filename. For ex:

  screenImageFilenames[0] = "screen1.jpg";

  screenImageFilenames[1] = "screen2.jpg";

  screenImageFilenames[2] = "screen3.jpg";

  screenImageFilenames[3] = "screen4.jpg";

  screenImageFilenames[4] = "screen5.jpg";

  screenImageFilenames[5] = "screen6.jpg";

  screenImageFilenames[6] = "screen7.jpg";

  screenImageFilenames[7] = "screen8.jpg";

  screenImageFilenames[8] = "screen9.jpg";

  screenImageFilenames[9] = "screen10.jpg";

  screenImageFilenames[10] = "screen11.jpg";

  screenImageFilenames[11] = "screen12.jpg";

  screenImageFilenames[12] = "screen13.jpg";

  screenImageFilenames[13] = "screen14.jpg";

  screenImageFilenames[14] = "screen15.jpg";

  screenImageFilenames[15] = "screen16.jpg";

  screenImageFilenames[16] = "screen17.jpg";

  screenImageFilenames[17] = "screen18.jpg";

  screenImageFilenames[18] = "screen19.jpg";

  // TODO: create a loop, that loops over every item in the screenImageFilenames array,
  //   and call loadImage() on that filename to set the value of screenImages array

  for (int i = 0; i < 19; i++) {
    screenImages[i] = loadImage(screenImageFilenames[i]);
  }


  // TODO: finish building the choice tree by specifying all the choices:

  thirdChoice[0] = 1;

  thirdChoice[1] = 2;

  firstChoice[2] = 4;
  secondChoice[2] = 16;

  thirdChoice[4] = 5;
  
  thirdChoice[5] = 6;
  
  firstChoice[6] = 7;
  secondChoice[6] = 10;
  
  firstChoice[10] = 18;
  secondChoice[10] = 13;
  
  thirdChoice[13] = 14;
  
  thirdChoice[14] = 15;
  
  thirdChoice[18] = 11;
  
  thirdChoice[11] = 12;
  
  thirdChoice[7] = 8;
  
  thirdChoice[8] = 9;

  thirdChoice[16] = 17;
}


void draw() {

  // TODO: use image() to draw screenImages of the currentScreen

  background(255);

  tint(255, 255);
  image(screenImages[previousScreen], 0, 0);

  tint(255, transparency);
  image(screenImages[currentScreen], 0, 0);

  transparency = transparency + 10;
}

void keyPressed() {

  if ( key == '1' ) {
    previousScreen = currentScreen;
    currentScreen = firstChoice[currentScreen];
    transparency = 0;
    println("User pressed 1");
  }
  else if ( key == '2' ) {
    previousScreen = currentScreen;
    currentScreen = secondChoice[currentScreen];
    transparency = 0;
    println("User pressed 2");
  }
  else if ( key == ENTER || key  == RETURN ) {
    previousScreen = currentScreen;
    currentScreen = thirdChoice[currentScreen];
    transparency = 0;
    println("User pressed ENTER");
  }
}



