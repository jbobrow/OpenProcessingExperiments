
//Import "Minim" Libary files
import ddf.minim.*;

//working with Images in Processing
//Declare global variables
Minim minim;
AudioPlayer bongo;
AudioSample rabbit;
AudioSample cat;
AudioSample pig;
AudioSample owl;

//Declare a PImage variable type
PImage BG; 

//Load an image file from HD
void setup(){
  size (800, 600);
  BG = loadImage("BG_Gris.jpg");
  minim = new Minim(this);
  bongo = minim.loadFile("bongo.wav");
  bongo.loop();
  rabbit = minim.loadSample("rabbit.wav");
  cat = minim.loadSample("cat.wav");
  pig = minim.loadSample("pig.wav");
  owl = minim.loadSample("owl.wav");
}
// Draw the image to the screen at (0,0)
    void draw() {
  image(BG, 0, 0);
}

//Create a key trigger
  void keyPressed() {
  if ( key == 'r') rabbit.trigger();
   if ( key == 'c') cat.trigger();
    if ( key == 'o') owl.trigger();
     if ( key == 'p') pig.trigger();
  
}

