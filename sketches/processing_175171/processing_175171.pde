
/**
 * Bringing it All Together (Project 3 (Processing, Sound and Image) - FF)
 * My Project 3 of Course Mooc, Introduction to Computational Arts 
 * of The State University of New York, Open Suny.
 * This project was created in an environment in where, Children are playing
 * in the Snow, under the musical theme background of Marc Teichert, 
 * A New Beginning, you will also appreciate effects of snow falling and the 
 * laughter of children.
 * With regard to the code, I've used pointillism to simulate falling snow. 
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
  size(900, 600); 
  img = loadImage("Project 3_A.png");
  smallPoint = 10;
  largePoint = 30;
  imageMode(CENTER);
  noStroke();
  background(255);

  minim = new Minim(this);
  Sound = minim.loadSample("Sound 2.mp3");
}

// Draw code block (anything goes)

void draw () {
  image(img, 450, 300);
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


