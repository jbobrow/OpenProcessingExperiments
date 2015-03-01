

//Final Project / Silent Night

//integrating image in processing 

//PImage variable
PImage bridge;

//Import 'Minim' library files
import ddf.minim.*;
Minim minim;
AudioPlayer silent_night;


//setup code

void setup() {
  size(1000, 654);
  background (0);
  noStroke();
  
  //setting image
  bridge = loadImage("bridge.png");
  image(bridge, 0,0);
  //setting sound
  minim = new Minim(this);
  silent_night = minim.loadFile("silent_night.wav");
  silent_night.play();
}
//Snowflakes animation
void draw () { 
}
void keyPressed () {
  fill(0,2);
  rect(0,0, width, height);  
  fill(255);
  ellipse(random(width), random(height), 7, 7);
}






