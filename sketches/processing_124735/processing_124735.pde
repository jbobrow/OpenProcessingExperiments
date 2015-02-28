
//Import minim 
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Add image 
PImage draw;

//Declere audio
Minim minim;
AudioSample sound;


//Load image and audio
void setup(){
 size(1000,700);
 draw = loadImage ("draw.jpg");
 minim = new Minim(this);
 sound = minim.loadSample("sound.wav");
}

// Draw de image to the screen
void draw() {
 image(draw, 0, 0);  
}

//Key tigger s 
void keyReleased(){
  if (key == 's') sound.trigger();
  if (key == 's') println("sample triggered"); 
} 



