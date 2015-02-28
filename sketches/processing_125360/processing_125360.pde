
//Import minim l.
import ddf.minim.*;

// global variables
Minim minim;
AudioSample noise;

//Working in Processing

//Declare a PImage variable type
 int x = 25;
 int y = 25;
 color [] palette = {#837E7E, #A0747C, #9FA074, #66719D, #74A080, #242223};
PImage fractal;

//Load an image file from HDD
/*Don't forget to add the file 
to your sketch 'data' folder*/

void setup() {
  
  size (800,600);
  fractal = loadImage ("cigare.jpg");
  
  minim = new Minim (this);
  noise = minim.loadSample ("noise.wav");
  
}

//Draw the image to the screen at (0,0)
void draw () {
  image(fractal, 0,0);
  
  float r = random (1,5) ; 
  strokeWeight (3);
  stroke (palette [int (r)]); 
  
  line (14, 0, 14, 600);
  line (40, 0, 40, 600);
  line (66, 0, 66, 600);
  line (92, 0, 92, 600);
  line (118, 0, 118, 600);
  line (144, 0, 144, 600);
  line (170, 0, 170, 600);
  line (196, 0, 196, 600);
  line (222, 0, 222, 600);
  line (247, 0, 247, 600);
  line (272, 0, 272, 600);
  line (297, 0, 297, 600);
  line (347, 0, 347, 600);
  line (397, 0, 397, 600);
  line (447, 0, 447, 600);
  line (497, 0, 497, 600);
  line (547, 0, 547, 600);
  line (597, 0, 597, 600);
  line (622, 0, 622, 600);
  line (647, 0, 647, 600);
  line (672, 0, 672, 600);
  line (697, 0, 697, 600);
  line (722, 0, 722, 600);
  line (747, 0, 747, 600);
  line (772, 0, 772, 600);
  line (797, 0, 797, 600);
  
  if ( x < width) {
  x += 50;
  }
}

//key trigger
void keyPressed () {
  if ( key == 'a' ) noise.trigger ();
  if ( key == 'a' ) println ( "sample triggered");
}

