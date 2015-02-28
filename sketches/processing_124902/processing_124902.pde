

  //Project 3- "self-portrait (wormhole)"

  //Declare 3 PImage variable types 
  PImage portrait4;
  PImage portrait5;
  PImage portrait6;
  
  // Declare pictures offset and float easing
  
  float offset = 0;
  float easing = 0.05;
  //import 'Minim' library files
  import ddf.minim.*;
  
  //Declare global variables
  
  Minim minim;
  AudioPlayer project3_sound2;
    
  
  void setup() {
   size(800, 620);
   
   //Load 3 image files from HDD
  //Add files to sketch 'data' folder
   
  portrait4 = loadImage("portrait4.png"); 
  portrait5 = loadImage("portrait5.png");
  portrait6 = loadImage("portrait6.png");
  
  
  //load audio file fromHDD
  
  minim =new Minim(this);
  project3_sound2 = minim.loadFile("project3_sound2.wav");
  project3_sound2.play();
  }
  

  
  //Draw the images to the screen 
  void draw() {
    
   image(portrait4, 0, 10);
   image(portrait5, 0, 210);
   image(portrait6, 0, 410);
   
   
    
//  set mouse input
float dx = (mouseX-portrait4.width/4) - offset;
float bx = (mouseX-portrait5.width/4) - offset;
float cx = (mouseX-portrait6.width/4) - offset;
offset += dx * easing;
offset += bx * easing;
offset += cx * easing;

// set transparency parameters
tint(255, 127);

image(portrait4, offset, 210);
image(portrait5, offset, 410);
image(portrait6, offset, 10);
  }

