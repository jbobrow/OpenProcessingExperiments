
//importing minim - declaring variables
import ddf.minim.*;
Minim minim;
float counter;
PImage img;
AudioPlayer worldmusic;

//set up code block - iniate varibles & canvas size, load image and audio
void setup() {
counter=0.0;
size (860,676);
img = loadImage("Children.png");
minim = new Minim(this);
worldmusic = minim.loadFile("worldmusic.mp3");
}

//draw code block- rotate image
void draw() {
 counter++;
  translate(width/2, height/2);
  rotate(counter*TWO_PI/360);
  translate(-img.width/2, -img.height/2);
  image(img,0,0);
 } 

//create key trigger - start and stop music when any key is pressed
void keyPressed () {
if (!worldmusic.isPlaying()) {
    worldmusic.rewind();
    worldmusic.play();
}else{
    worldmusic.pause();
}
}


