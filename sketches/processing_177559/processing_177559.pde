
//declare a PImage variable type
PImage story;
PImage star;
PImage heart;

//Import 'Minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioPlayer XmasCarol;

//load an image file from HDD

void setup() {
  size(960,720);
  story=loadImage("Final_Project_Background.png");
  star=loadImage("Star.png");
  heart=loadImage("heart.png");
  image(story,0,0);
  minim = new Minim(this);
  XmasCarol = minim.loadFile("WeWishYouAMerryXmas1.mp3");
  XmasCarol.play();
  XmasCarol.loop();
}

//Draw the image to the screen at (0,0)
void draw() {
  if (key=='l') {
    if (mousePressed==true) {
      image(heart,mouseX-300/7,mouseY-308/7,300/3.5,308/3.5);
    }
  }
  if (key=='w') {
    if (mousePressed==true) {
      image(star,mouseX-247/12,mouseY-214/12,247/6,214/6);
    }
  } 
}
  
//---keyPressed()---
void keyPressed() {
  if (key=='s'||key=='S') saveFrame("screenshot.png");
  if (key==DELETE || key==BACKSPACE) {
    image(story,0,0);
    XmasCarol.rewind();
  }
}

