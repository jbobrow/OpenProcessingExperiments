
// import Minim library files
import ddf.minim.*;

// Declare global variables
Minim minim;
AudioSample piano;
//Declare  a PImage variable type
PImage ReflectedA;

// Load audio file from HDD
void setup() {
   minim = new Minim(this);
   piano = minim.loadSample("piano.wav");
//load an image file from HDD
/*add the file to the sketch data folder*/
  size(800, 741);
  ReflectedA = loadImage("ReflectedA.jpg");
  }

//Draw the image to the screen at (0,0)
void draw() {
  image(ReflectedA, 0, 0);
}

// Create a key trigger
 void keyPressed() {
   if ( key == 'c' ) piano.trigger();

}

