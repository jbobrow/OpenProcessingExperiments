
//Import 'Minim' library files, Working with sound; Sketch-Import Minim
import ddf.minim.*;

//Declare global variables (sound file)
Minim minim;
AudioPlayer sound;
int a;
PImage img1;
PImage img2;
// ...
boolean hasClicked;

//Load audio file from harddrive Sketch-Addfile
void setup() {
size(683,820); // or however big you need.
  img1=loadImage("ProjectIMG.jpg");
  img2=loadImage("ProjectIMG3.jpg");
  a=0;
   minim = new Minim(this);
 sound = minim.loadFile("TheFirstNoel.mp3"); 
 sound.play();
}

void draw() {
 image(img1,0,0);
  tint(255,255,255,a);
  if(a<255);
    a++; // 4th variable is the alpha, or transparency.
// so the next image will start off 100% transaprent, then
// slowly fade into view, until it's solid.  
image(hasClicked? img2 : img1, 0, 0);
 
}
//Create a mouse trigger
void mousePressed() {
  hasClicked = true;
}

void keyPressed(){
if ( key == 'c' ) println("Merry Christmas!"); 
}

