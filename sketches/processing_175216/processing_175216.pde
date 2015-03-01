

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample Bells001a;

//Load audio file from HDD
void setup() {
  minim = new Minim(this);
  Bells001a = minim.loadSample("Bells001a.wav");
}

//Draw code block (anything goes)
void draw (){//Declare a PImage variable type
PImage winter;

  size (1800, 1500);
 winter = loadImage("winter.jpg");

  image(winter, 0, 0);
}


//Create a key trigger
void keyPressed() {
  if ( key == 'b' ) Bells001a.trigger();
  if ( key == 'b' ) println("sample triggered");
}

