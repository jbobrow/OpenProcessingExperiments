
//Import 'Minim' library files
import ddf.minim.*;
//Declare global variables
Minim minim;
AudioSample ohoh;

//Declare a PImage variable type
PImage stupore;

//Load audio file from HDD
//Load an image file from HDD
void setup() {
  minim = new Minim(this);
  ohoh = minim.loadSample("ohoh.wav");
  size(1200, 720);
  stupore = loadImage("stupore.JPG");
  
  textSize(100);
  fill(#FFFFFF);
}
//Draw code block (anything goes)

//Draw the image to the screen at (0,0);
void draw() {
  background(1);
  image(stupore, 0,0);
  text("ohohhoh", 500, 600);
}

//Create a key trigger
void keyPressed() {
  if (key =='p') ohoh.trigger();
}







