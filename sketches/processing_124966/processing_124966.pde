
//Interactive sketch with Image and Sound

//Final Project Ellen's Tree and Blackbirds

/*Load the file and you will see a tree which 
I cobbled together in GIMP from three different photographs
I took of a tree in my friend's yard.

If you hit the 'b' key you will hear audio 
which I downloaded from samples in Soundation and made into 
a 20 second piece.  You may hit the 'b' key several 
times and the audio will overlap.

If you then hit the 'c' key will see a flash of 
what is making the noise :) I made the drawings 
of the blackbirds in GIMP as well
*/

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample blackbird;

//Load audio file from HDD - see below
//Draw code block
//Create a key trigger

void keyPressed(){
  if (key == 'b') blackbird.trigger ();
  if (key == 'b') println("sample triggered");
  if (key == 'c') image (blackbirdbackground, 0,0);
  if (key == 'c') println("image.triggered");
  }

//Declare a PImage variable type

PImage newellentree;
PImage blackbirdbackground;

//Load an image file from HDD

void setup(){
  size (720,960);
  newellentree = loadImage("newellentree.jpg");
  blackbirdbackground =loadImage("blackbirdbackground.jpg");
  minim = new Minim(this);
  blackbird = minim.loadSample("blackbird.wav");
}

//Draw the image to the screen at (0,0)
  
  void draw(){ 

    image(newellentree, 0,0);
    
}




