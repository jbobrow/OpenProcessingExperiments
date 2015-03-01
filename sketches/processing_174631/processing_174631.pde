
//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
PImage Project2image;
PImage Project2imagesmall;


Minim minim;
AudioSample project2audio;

//Load audio file from HDD
void setup () {
   size(1640,1000);
   
  Project2image = loadImage("Project2image.png"); 
    Project2imagesmall = loadImage("Project2imagesmall.png");
 minim = new Minim(this);
project2audio = minim.loadSample("SD.wav"); 
 
}

//Draw code block (anything goes)
void draw () {
  image(Project2image,50,50);
  image(Project2imagesmall,0,0);
}
//Create a key trigger
void keyPressed() {
 if (key == 'b') project2audio.trigger();
if (key == 'b') println("sample triggered");
}

