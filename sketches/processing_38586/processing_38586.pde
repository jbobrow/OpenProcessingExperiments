
PImage a;  // Declare variable "a" of type PImage
PImage b;  // Declare variable "b" of type PImage

import ddf.minim.*; //saying that a library will be imported for set of commands

Minim minim; //naming the class, or minim, minim
AudioSample kick; //naming the audiosample library kick

void setup(){
  size(272,416);
  a = loadImage("Guy.jpg"); //loading the guy image as the first display
  b = loadImage("Girl.jpg"); //loading the girl image as the second display
  minim = new Minim(this); //advising that the class should reference back to the library
  kick = minim.loadSample("whistle.wav", 2048); //giving kick a reference file  
}

void draw(){
  if (mouseX < 136){
    image(a,0,0);
    kick.trigger();
  }
  else if(mouseX > 136){
    image(b,0,0);
    }
}

void stop(){ // always close Minim audio classes when you are done with them
  kick.close();  
  minim.stop();
  super.stop();
}  


  


