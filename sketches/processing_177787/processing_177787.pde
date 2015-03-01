
/*
Press x to make bubbles appear
Image was taken from editable/usable section of Flickr

Piece is meant to convey the calming, soothing aspect of being 
on the beach. This is conveyed through the sound piece, the calm
visual input, and the minimal interaction with the piece. All
combine together to create a calm, yet beautiful piece.
*/
import ddf.minim.*;

//global variables
Minim minim;
AudioPlayer waves;


//declare a PImage variable type
PImage beach;


//load an image file
/* Dont' forget to add the file 
to your sketch 'data' folder */
void setup() {
 size(800, 600); 
 beach = loadImage("Beach.jpg"); 
  minim = new Minim(this);
   image(beach, 0, 0, 800, 600);
   class PlayAudio {
     PlayAudio() {
         waves = minim.loadFile("waves.wav");
     }
}
}

void draw() {
 float counter1 = 0;
}

void keyReleased(){
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch(key) {
    case 'x':
    pushMatrix();
    noFill();
    float d = random(75);
    float d1 = random(50);
    stroke(#FFFFFF);
    ellipse(random(width), random(height), d1, d1);
    ellipse(random(width), random(height), d, d);
    ellipse(random(width), random(height), d1, d1);
    ellipse(random(width), random(height), d, d);
    ellipse(random(width), random(height), d1, d1);
    ellipse(random(width), random(height), d1, d1);
    ellipse(random(width), random(height), d, d);   
    popMatrix();
    break;
 
}
}


