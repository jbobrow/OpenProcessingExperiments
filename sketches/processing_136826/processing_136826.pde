
//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample song;

//Load audio file from HDD
void setup() {
  minim = new Minim(this);
  song = minim.loadSample("Capital Kings - I Feel So Alive.mp3");
}

//Draw code block (anything goes)
void draw() {
  background(0);
}

//Create a key trigger
void keyPressed() {
  if (key == 'b' ) song.trigger();
  if (key == 'b' ) println("sample triggered");
}





