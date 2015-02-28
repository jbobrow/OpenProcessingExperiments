

//Working with Images  and Audio in Processing

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
boolean ongoing = false;

String saywhat1 = "The following images are from one of the oldest cities on this planet,";
String saywhat2 = "they were token on 2011 before it was converted to destructions,";
String saywhat3 = "here are three images from a big collection representing a very sad memories.";
String saywhat4 = "press the keys 'a', 's', and 'd' to move from an image to another. ";

Minim minim;
AudioPlayer project_audio;

//Declare a PImage variable type
PImage image1;
PImage image2;
PImage image3;

//Load audio file from HDD
//Load an image file from HDD
void setup() {
 size(900, 700);
 image1 = loadImage("im1.png");
 image2 = loadImage("im2.png");
 image3 = loadImage("im3.png");
 minim = new Minim(this);
 project_audio = minim.loadFile("project_3.wav");
 project_audio.play();
  
}

//Draw code block (anything goes)
//Draw the image to the screen at (0, 0)
void draw() {
  smooth();
  fill(0,0,0);
  textAlign(CENTER);
  textSize(20);
  text(saywhat1, width/2, height/2);
  text(saywhat2, width/2, height/2 + 30);
  text(saywhat3, width/2, height/2 + 60);
  text(saywhat4, width/2, height/2 + 90);
  if (key == 'a') image(image2, 0, 0);
  if (key == 's') image(image3, 0, 0);
  if (key == 'd') image(image1, 0, 0);

}

