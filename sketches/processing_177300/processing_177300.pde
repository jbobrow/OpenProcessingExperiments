
//import "Minim" library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample carlo;
AudioSample battimani;
AudioSample dong;
AudioSample dongdong;
AudioSample ohoh;

//Load audio file from HDD
void setup() {
  minim = new Minim(this);
  carlo = minim.loadSample("carlo.wav");   
  battimani = minim.loadSample("battimani.wav");
  dong = minim.loadSample("dong.wav");  
  dongdong = minim.loadSample("dongdong.wav"); 
  ohoh = minim.loadSample("ohoh.wav");     
}

//Draw code block 
void draw () {
background (0);
}

//Create a key trigger
void keyPressed() {
    if ( key == 'b' ) carlo.trigger();
    if ( key == 'c' ) battimani.trigger();
    if ( key == 'v' ) dong.trigger();
    if ( key == 'n' ) dongdong.trigger();
    if ( key == 'm' ) ohoh.trigger();
    if ( key == 'b' ) println("sample triggered");
  }



