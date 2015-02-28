
/**
 *
 * TODO: main thing: a single variable that keeps track of which screen the user is currently at
 *
 * Let's make several arrays, each is numberOfScreens long
 *
 **/

int currentScreen = 0;

// TODO: start with an int that indicates the number of screens
int numberOfScreens = 30;

// TODO: start by making an array of image filenames (one for each screen):
String[] screenImageFilenames = new String[numberOfScreens];

PImage[] screenImages = new PImage[numberOfScreens];

// TODO: create an array of "choice 1" for each screen (where choice 1 goes from that screen)
int[] firstChoice = new int[numberOfScreens];
int[] secondChoice = new int[numberOfScreens];


void setup() {

// TODO: go through and specify each image filename. For ex:
screenImageFilenames[0] = "filename.jpg";
// etc ....

// TODO: create a loop, that loops over every item in the screenImageFilenames array,
//   and call loadImage() on that filename to set the value of screenImages array

/*int i = 30;
  while ( i <= 30 ) {
    screenImageFilenames = [i]
    [i] = loadImage();
  }
*/

// TODO: finish building the choice tree by specifying all the choices:
firstChoice[0] = 1;
secondChoice[0] = 2;
// etc .....


}

void draw() {

// TODO: use image() to draw screenImages of the currentScreen

/*
img = loadImage (screenImageFilename[i]);
*/

}

void keyPressed() {

if ( key == 1 ) {
  currentScreen = firstChoice[currentScreen];

}
else if ( key == 2 ) {
}
 // TODO: do the same for secondChoice
}

