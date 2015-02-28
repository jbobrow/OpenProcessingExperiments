


// Import minim and create audiosamples for all the possible actions
import ddf.minim.*;
Minim minim;
AudioSample torchOn, torchOff, bigger, smaller;


// declare the two images used
PImage light, dark;

// torch on or off
boolean on=false;

// variables to build the torch
float val, d, r;


//allocate mask array that represents the torch
int [] mask = new int[1080*720];


void setup(){
  
 // canvas
 size(1080,720);

 //load the audio tracks, different noises correspond to different actions, all triggered by inputs
 minim = new Minim(this);
 torchOn = minim.loadSample("clickOn.wav");
 torchOff = minim.loadSample("torchOff.mp3");
 bigger = minim.loadSample("biggerTorch.mp3");
 smaller = minim.loadSample("smallerTorch.mp3");
  
 // load the two images 
 light = loadImage("lightnatural.png");
 dark = loadImage("darkviolet.png");
 
 // sets up the initial radius of the torch
 r=1.2;
 
}

void draw() {
  // draw the first image as background
  image(dark,0,0); 
  
  // builds the masking array, which will reveal only part of the lit image
 for(int i = 0; i<width; i++){
   for(int j = 0; j<height; j++){
     d =  sqrt( pow(i-mouseX,2) + pow(j-mouseY,2) );
     val = 300 - d*r;
     if (val>255) 
       val = 255; 
       else if (val<0)
       val = 0;
       else
       val = floor(val);
     mask[i+j*width] = int(val)  ;
   }
 }
 
 // if the torch is on, adds the "lights-on" image, and masks it so only a small part is revealed
 if (on){
 image(light,0,0); 
 light.mask(mask);}
 
}



void keyPressed(){
  
  switch(key){
    case 't': //turn on and off the torch, play a sound according to the action
      on = !on;
      if (on) { torchOn.trigger();}
      else {torchOff.trigger();}
      break;
    case '-':  // decrease the torch radius, play a sound
       r+=0.1;
       smaller.trigger();
       break; 
    case '+': // increase the torch radius, play a sound
       r-=0.1;
       bigger.trigger();
       break;
       
  }}

