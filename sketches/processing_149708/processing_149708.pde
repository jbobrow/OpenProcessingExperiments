
//Import 'Minim' library files


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


//Declare global variables

Minim minim;

AudioSample Pad;
PImage Galaxy;


//Load audio file from HDD
void setup() {
  minim = new Minim(this);
  Pad = minim.loadSample("PadOne.wav");
  size (800, 600);
  Galaxy = loadImage ("galaxy_one.jpg");

  
}
//Draw code block (anything goes)

void draw () {
  image(Galaxy, 0, 0, 800, 600);
 
}
  


//Create a key trigger

void keyPressed (){
 if ( key == 'b' ) Pad.trigger();  
 if ( key == 'b' ) println("One" );
  
}

