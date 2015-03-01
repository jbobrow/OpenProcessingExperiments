
// Importing Minim module and establishing setup for loading sound and image
import ddf.minim.*;
Minim minim;
AudioSample cry;
PImage img;
void setup () {
  size (800,600);
  background (0);
  strokeWeight (5);
  img = loadImage("imagen.jpg");
  minim = new Minim(this);
  cry = minim.loadSample("cry.wav");
}
// Drawing symetric lines of random colors depending on the mouse position
void draw (){
  image (img,200,300);
  stroke (random (width), random (height), random (100));
  line (pmouseX, pmouseY, mouseX, mouseY);
  line (width/2+((width/2)-pmouseX), pmouseY, width/2 +((width/2)-mouseX), mouseY);
}
// If mouse is pressed, the sound is played. Press several times the mouse to have a polyphonic result
void mousePressed (){
    cry.trigger();
  } 

