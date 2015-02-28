
/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */
 
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 
import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage mon;  // Declare variable "a" of type PImage
PImage wade;
PImage wade2;
PImage wade3;
PImage wade4;

void setup() {
  size(900, 800);
  //frameRate (3);
  minim = new Minim(this);
  player = minim.loadFile("Spectrum (Odyssey's Prism Mix).mp3");
  
  // play the file
  player.play();
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  mon = loadImage("mon.jpg"); 
  wade =loadImage("wade.jpg");
  wade2 =loadImage("wade2.jpg");
  wade3 =loadImage("wade3.jpg");
  wade4 =loadImage("wade4.jpg");
}

void draw() {
  
  background(0);
  stroke(255);
  
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
  
  // Displays the image at its actual size at point (0,0)
  //image(moonwalk, 0, 0);
  // Displays the image at point (0, height/2) at half of its size
  //image(moonwalk, 0, 0, moonwalk.width/2, moonwalk.height/2);
  
  image(mon, 0, 0, 900, 1000);
  image(wade, random(0, 900), random(0, 800), random(400, 900), random(300, 800));
  image(wade2, random(0, 900), random(0, 800), random(900), random(800));
  image(wade3, random(0, 900), random(0, 800), random(900), random(800));
  image(wade4, random(0, 900), random(0, 800), random(900), random(800));
  
  
  
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    line( x1, 700 + player.left.get(i)*50, x2, 700 + player.left.get(i+1)*50 );
  
  }
  //image(dog, random(0, 320), random(0, 360), random(320), random(180));
 // image(space, random(0, 320), random(0, 360), random(320), random(180));
  //image(moonwalk, 0, 180, moonwalk.width/2, moonwalk.height/2);
 // image(moonwalk, 320, 180, moonwalk.width/2, moonwalk.height/2);

}


