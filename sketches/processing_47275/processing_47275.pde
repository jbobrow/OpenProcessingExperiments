

import ddf.minim.* ;
  
  Minim minim;
  AudioSample kick ;
  
PImage []  imagearray = new PImage [6];
PImage BG;

int imagenumber = 0 ;

void setup (){
size (563,400);
BG = loadImage ("BG.png");



for ( int counter = 0; counter < 6; counter = counter + 1 ) {
   imagearray [counter] = loadImage ("array"+ str (counter) + ".png");
}
}

void draw () {
 background (BG); 

image (  imagearray [imagenumber], 0, 0 );
}

void keyPressed () {
  if ( key =='1'){
  imagenumber = 0;
   minim = new Minim(this);
  kick = minim.loadSample("sound0.mp3");
   kick.trigger();
    
  }
 if ( key == '2') {
   imagenumber = 1;
      minim = new Minim(this);
  kick = minim.loadSample("sound0.mp3");
   kick.trigger();
 }
 
  if ( key == '3') {
   imagenumber = 2;
      minim = new Minim(this);
  kick = minim.loadSample("sound0.mp3");
   kick.trigger();
 }
 
  if ( key == '4') {
   imagenumber = 3;
      minim = new Minim(this);
  kick = minim.loadSample("sound0.mp3");
   kick.trigger();
 }
 
   if ( key == '5') {
   imagenumber = 4;
      minim = new Minim(this);
  kick = minim.loadSample("sound0.mp3");
   kick.trigger();
 }
 if ( key == '6') {
   imagenumber = 5;
      minim = new Minim(this);
  kick = minim.loadSample("sound0.mp3");
   kick.trigger();
 }
  
}


