
/**
 * My Assignment Man on horseback, in the rain.
 * Scores & Original Piece from Filtered Noise (Sound Assignment 3 - C3) of Course Mooc
 * Introduction to Computational Arts of The State University of New York, Open Suny.
 * With the musical theme background Marc Teichert Daydream and effects as steps horse,
 * rain, birds that blend in a natural environment.
 * After running the sketch only you must press the key 'B' or 'b' to hear the sound.
 * By Luznery Vera
 * Enjoy!
 
 */

// Import 'Minin' library files
import ddf.minim.*;

// Declare global variables
Minim minim;
AudioSample Sound;
// Load audio file from HDD

// Declare a PImage variable type
PImage img;
int smallPoint, largePoint;

// Load an image file from HDD
/* Don't forget to add the file to your sketch 'data' folder; */

void setup() {
  size(900, 666); 
  img = loadImage("Noise 3_A.jpg");
  smallPoint = 10;
  largePoint = 20;
  imageMode(CENTER);
  noStroke();
  background(255);

  minim = new Minim(this);
  Sound = minim.loadSample("Man on horseback, in the rain.mp3");
}

// Draw code block (anything goes)

void draw () {
  image(img, 450, 333);
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 500);
  ellipse(x, y, pointillize, pointillize);
}
/** Keyboard Input.
 */

// Create a key trigger

void keyPressed() {
  if ( key == 'b' ) Sound.trigger();
}


