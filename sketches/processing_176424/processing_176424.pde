
//Working with Images and Sound in Processing
//To listen to de audio please press the letter "n" in your keyborad

// Import 'Minin' library files
import ddf.minim.*;
 
// Declare global variables
Minim minim;
AudioSample sayourname;

//Declare a PImage variable type
PImage computationalartsfinalproject;

//Load Image from HDD
void setup() {
  size ( 1280, 720);
  computationalartsfinalproject = loadImage("computationalartsfinalproject.png");
minim = new Minim(this);
  sayourname = minim.loadSample("sayourname.wav");
}

//Draw the Image to the secreen
void draw() {
  image(computationalartsfinalproject, 0, 0);
}
// Create a key trigger
 
void keyPressed() {
  if ( key == 'n' ) sayourname.trigger();
}


