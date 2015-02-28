

// Introduction to Computational Arts: Processing
// Week5 - Final Assignment

// The objective of this assignment is to create an 
// interactive sketch in Processing to show how much
// i have learned in this course.
// This sketch will start painting butterflies from
// external files (butterfly1 to butterfly4.png).
// The color (tint) depends of X and Y position of
// the mouse. The program draws 4 types of butterflies,
// rotating and in random positions.
// If you press the button of the mouse canvas is cleared
// and changes the background color depending mouse position.
// WHen the scketh executes, song "Butterfly kises" is played
// until you press SPACE key, using "Minim" library.

// Interactions:

// Press mouse button to erase canvas with background
// color depending of mouse position.
// Key "s" or "S" saves the file to sketch folder.
// ENTER: stops playing the song.

// Minim library import
import ddf.minim.*;

// Global variables declaration
Minim minim;
AudioPlayer butterflySong;
PImage b1;
PImage b2;
PImage b3;
PImage b4;
float x,y;
float rotationAngle;


// Setup Code Block
void setup(){
  // Audio settings and start playing
  minim = new Minim (this);
  butterflySong = minim.loadFile ("butterfly_kisses.mp3");
  butterflySong.play();
  
  // Define canvas, frame rate, variables and images to be loaded
  size(900,700);
  background(0,255);
  frameRate(3);
  b1 = loadImage("butterfly1.png");
  b2 = loadImage("butterfly2.png");
  b3 = loadImage("butterfly3.png");
  b4 = loadImage("butterfly4.png");
  x = 0.0;
  y = 100;
  rotationAngle = 0.0;
}

// Draw Code Block
void draw(){

  tint (255,mouseX,mouseY);
  translate(x,y);
  rotate(rotationAngle);
  image(b1,random (700), random (500),300,250);
  x += 1.0;
  rotationAngle += 0.01;
  if (x > width) {
    x = 0;
  }
  tint(255,mouseX,mouseY);
  translate(x,y);
  rotate(rotationAngle);
  image(b2,random(700),random(500),300,250);
  x += 1.0;
  rotationAngle += 0.01;
  if (x > width) {
    x = 0;
  }
  tint(255,mouseX,mouseY);
  translate(x,y);
  rotate(rotationAngle);
  image(b3,random(700),random(500),300,250);
  x += 1.0;
  rotationAngle += 0.01;
  if (x > width) {
    x = 0;
  }
  tint(255,mouseX,mouseY);
  translate(x,y);
  rotate(rotationAngle);
  image(b4,random(700),random(500),300,250);
  x += 1.0;
  rotationAngle += 0.01;
  if (x > width) {
    x = 0;
  }

}

// Mouse Input Code Block
void mousePressed() {
  background(mouseY,mouseX);
 }

// Keyboard Input Code Block
void keyPressed () {
 if (key == 's' || key == 'S') saveFrame ("Final_Assignmet.png");
 if (key == ENTER) minim.stop();
 }
 

