
/* @pjs preload="arrow0.jpg,arrow1.jpg,arrow2.jpg,arrow3.jpg,arrow4.jpg,arrow5.jpg,arrow6.jpg,arrow7.jpg,arrow8.jpg,arrow9.jpg,arrow10.jpg,arrow11.jpg,arrow12.jpg,arrow13.jpg,arrow14.jpg,arrow15.jpg,arrow16.jpg,arrow16.jpg,arrow17.jpg,arrow18.jpg"; */
 
// Learning Processing
 
// Daniel Shiffman
// http://www.learningprocessing.com
 
// Example 15-4: Image sequence
 
// Input code added by Devon Scott-Tunkin
 
int maxImages = 19; // Total # of images
int imageIndex = 0; // Initial image to be displayed is the first
boolean isPlaying = false;
 
// Declaring an array of images.
PImage[] images = new PImage[maxImages];
 
void setup() {
  size(720,480);
  for (int i = 0; i < images.length; i ++ ) {
    images[i] = loadImage( "arrow" + i + ".jpg" );}
   
  

     frameRate(6);     
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
    isPlaying = true;
  }
  else if (key == ' ' && isPlaying == true) {
    isPlaying = false;
  }
   
  // keyCode are used for keys that don't type characters (LEFT, UP, DOWN, ESC, CONTROL, SHIFT, ENTER, ALT)
  else if (keyCode == RIGHT) {
    // Cycle
    if (imageIndex >= 18) {
      imageIndex = 0;
    }
    else {
      imageIndex += 1;
    }
  }
  else if (keyCode == LEFT) {
    // Cycle backwards
    if (imageIndex <= 0) {
      imageIndex = 18;
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



