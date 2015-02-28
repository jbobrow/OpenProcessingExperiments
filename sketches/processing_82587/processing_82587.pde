
/** Coors_Light interaction project
* Group"SYSTEM 32" (prepared by Simona Sandaraite)
* This sketch displays the sequence of 59 individual 
* images which creates the single animation based on Coors Light project.
*/

import ddf.minim.*;
int numFrames = 59; // The number of frames in the animation
int frame = 0; // Y axes value

PImage[] images = new PImage[numFrames];

AudioPlayer player;
Minim minim;

void setup() {
  size(600, 600); // Window size

  frameRate(1.9); // The speed of changing frames 
                  // (the higher the number, the quicker one image is replaced by another) 
  images[0] = loadImage("coors0000.jpg"); //Uploading the first image of whole sequence
  for (int i=0; i<numFrames; i++) {                  //This code helps to run whole animation 
    String imageName = "coors" + nf(i, 4) + ".jpg";  // without uploading images separately  
    images[i] = loadImage(imageName);
    }
  minim = new Minim(this);
  player = minim.loadFile("nasa.wav"); //Uploading the music tone
  player.loop(); //Repeat the song
}

void draw() {
  frame = (frame+1) % numFrames; // "%" helps to cycle from one frame to another
  image(images[frame], 0, 0);
}      

void stop() {     //It helps to stop the player when it is finished
  player.close(); 
  minim.stop();
  super.stop();
}

void mouseReleased() { //One mouse press and quick release helps to stop the animation
  noLoop();
}

void mousePressed() { //If mouse is pressed the program works again
  loop();
}

