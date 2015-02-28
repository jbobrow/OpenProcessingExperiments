
/* @pjs preload="frame0.jpg, frame1.jpg, frame2.jpg, frame3.jpg, frame4.jpg, frame5.jpg, frame6.jpg, frame7.jpg, frame8.jpg, frame9.jpg, frame10.jpg, frame11.jpg, frame12.jpg, frame13.jpg, frame14.jpg"; */

// Images by BMSproductionz (YouTube)
// Added by Daniel Jovanov, 5 February 2013

// Original code: Daniel Shiffman
// http://www.learningprocessing.com
 
// Example 15-4: Image sequence
 
// Input code added by Devon Scott-Tunkin
 
int maxImages = 15; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
boolean isPlaying = true;
 
// Declaring an array of images.
PImage[] images = new PImage[maxImages];
 
void setup() {
  size(820,700);
   
  // Loading the images into the array
  // Don't forget to put the JPG files in the data folder!
  // DAN JOVANOV, 6 February 2013
  images[0] = loadImage("frame0.jpg");
  images[1] = loadImage("frame1.jpg");
  images[2] = loadImage("frame2.jpg");
  images[3] = loadImage("frame3.jpg");
  images[4] = loadImage("frame4.jpg");
  images[5] = loadImage("frame5.jpg");
  images[6] = loadImage("frame6.jpg");
  images[7] = loadImage("frame7.jpg");
  images[8] = loadImage("frame8.jpg");
  images[9] = loadImage("frame9.jpg");
  images[10] = loadImage("frame10.jpg");
  images[11] = loadImage("frame11.jpg");
  images[12] = loadImage("frame12.jpg");
  images[13] = loadImage("frame13.jpg");
  images[14] = loadImage("frame14.jpg");
  //images[1].filter(BLUR, 20);
  frameRate(1); // slow enough for the action--DAN JOVANOV
}
 
void draw() {
   
  background(0);
  image(images[imageIndex],0,0);
   
  // Happens continuously while pressed
  if (keyPressed == true) {
    if (key == '6') {
      imageIndex = 6;
    }
    else if (key == '7') {
      imageIndex = 7;
    }
    else if (key == '8') {
      imageIndex = 8;
    }
    else if (key == '9') {
      imageIndex = 9;
    }
    // no more numbers, so use QWERT
    // DAN JOVANOV, 6 February 2013
    else if (key == 'q') {
      imageIndex = 10;
    }
    else if (key == 'w') {
      imageIndex = 11;
    }
    else if (key == 'e') {
      imageIndex = 12;
    }
    else if (key == 'r') {
      imageIndex = 13;
    }
    else if (key == 't') {
      imageIndex = 14;
    }
  }
   
  // Happens continuously while pressed
  if (mousePressed == true) {
    if (mouseButton == CENTER) {
      imageIndex = 0;
    }
  }
   
 
  // Only cycle if isPlaying is true
  if (isPlaying == true) {
   
    // increment image index by one each cycle
    // use modulo " % "to return to 0 once the end of the array is reached
    imageIndex = (imageIndex + 1) % images.length;
  }
}
 
// Only happens when you release key
void keyReleased() {
  if (key == '0') {
    imageIndex = 0;
  }
  else if (key == '1') {
    imageIndex = 1;
  }
  else if (key == '5') {
    imageIndex = 5;
  }
     
  // Toggle isPlaying with space bar
  else if (key == ' ' && isPlaying == false) {
    // want to move to next slide and play
    // DAN JOVANOV--6 February 2013
    imageIndex = (imageIndex + 1) % images.length;
    isPlaying = true;
  }
  else if (key == ' ' && isPlaying == true) {
    isPlaying = false;
  }
   
  // keyCode are used for keys that don't type characters (LEFT, UP, DOWN, ESC, CONTROL, SHIFT, ENTER, ALT)
  else if (keyCode == RIGHT) {
    // Cycle
    if (imageIndex >= 1) {
      imageIndex = 0;
    }
    else {
      imageIndex += 1;
    }
  }
  else if (keyCode == LEFT) {
    // Cycle backwards
    if (imageIndex <= 0) {
      imageIndex = 9;
    }
    else {
      imageIndex -= 1;
    }
  }
}
 
// Happens every time key is pressed (keeps happening if held down)
void keyPressed() {
  if (key == '2') {
    imageIndex = 2;
  }
  else if (key == '3') {
    imageIndex = 3;
  }
  else if (key == '4') {
    imageIndex = 4;
  }
}
 
// Only happens after mouse button is pressed AND released
void mouseClicked() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
}
 
// Only happens once when the mouse button is released
void mouseReleased() {
  if (mouseButton == RIGHT) {
    isPlaying = false;
  }
}
 
// Happens once when clicked
void mousePressed() {
  if (mouseButton == LEFT) {
    isPlaying = true;
  }
}



