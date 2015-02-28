
//Import 'Minis library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioPlayer piano;

//Load audio file from HDD
void setup() {
 minim = new Minim(this);
 piano = minim.loadFile("piano.mp3"); 
 piano.play();
}

//Draw code block (anything goes)
void draw (){
  background(0);
}
//Create a key trigger

