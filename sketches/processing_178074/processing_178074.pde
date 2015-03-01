
/* Hello there! My application works with keyboard input. 
If you press the letter e or E you will listen to the entrance of the song. With r or R you will listen to the refrain, with g or G the guitar solo
and with n or N all of the piece. The title of the song is "Nemo" and it is from the band Nightwish. I hope yoy like it.
*/

import ddf.minim.*;

Minim minim;
AudioSample entrance;
AudioSample guitars;
AudioSample Nemo;
AudioSample refrain;
PImage back;

void setup() {
   
  size(1024, 768);
  back = loadImage("back.jpg");

  minim = new Minim(this);
  entrance = minim.loadSample("entrance.mp3");
  guitars = minim.loadSample("guitars.mp3");
  refrain = minim.loadSample("refrain.mp3");
  Nemo = minim.loadSample("Nemo.mp3");
 
 

}

void draw() {
  image(back, 0, 0);
  
  fill(#FFFFFF);
  textSize(30);
  textAlign(CENTER);
  text("E:Entrance, R:Refrain, G:Guitar, N:Nemo(All the piece)", 550, 50);
}

void keyPressed() {
  if ( key == 'e' || key== 'E' ) entrance.trigger();
  if ( key == 'r' || key== 'R' ) refrain.trigger();
  if ( key == 'g' || key== 'G' ) guitars.trigger();
  if ( key == 'n' || key== 'N' ) Nemo.trigger();
}

