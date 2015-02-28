
//This project combines both sound and visuals.
//Use the 'h' key to hear the owls.

//Incorporate sound
import ddf.minim.*;
Minim minim;
AudioSample owls;

//Array for palette 
color[] palette = {
  #fbf3ec, #e32072, #f88cb6, #f88cb6, #fc0675
};

//Original image created in Photoshop
PImage img;

//Frame rate reduced to see text
float framerate = .6;

//Setup (includes audio, size, frame rate and loading the image)
void setup() {
  minim = new Minim(this);
  owls = minim.loadSample("owls.wav");
  size(1200, 700);
  frameRate(framerate);
  img = loadImage("owls.png");
}

//Draw
void draw() {
  image(img, 0, 0);
}

//Pressing the 'h' key controls the audio of the owls
//and the text appearing on screen
//Pressing the 's'key will create a screenshot
void keyPressed () {
  if (key=='h' || key=='H') owls.trigger();
  PFont curlz = loadFont("curlz.vlw");
  float r = random(5);
  textFont(curlz);
  fill(palette[int (r)]);
  textSize(random(20, 150));
  text("Hoot", random(height), random(width));
  text("Hoot", random(height), random(width));
  text("Hoot", random(height), random(width));
  if (key=='s' || key=='S') saveFrame("screenshot.png");
}


