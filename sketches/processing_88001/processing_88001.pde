
int black = 0;
int light = 245;
int value = 0;

PImage img;  // Declare variable "a" of type PImage

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(800, 300);
  background(95, 50, 15);

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("hey.wav");

  noCursor();
  img = loadImage("walking.png");  // Load the image into the program
}

void draw() {
  background(95, 50, 15);
  noStroke();
  println(mouseX + " " + mouseY);

  //columns
  fill(137);
  rect(166, 40, 10, 260);
  rect(632, 40, 10, 260);

  //black for lights off
  fill(value);
  rect(166, 40, 10, 20);
  rect(632, 40, 10, 20);


  // Displays the image and position on X-axis is controlled by cursor
  imageMode(CENTER);
  image(img, mouseX, 200, img.width/2, img.height/2);

  if (mouseX >= 166+-10) {
    player.play();
  } //if the X position of the cursor equals 166 pixels then the player will play
  if (mouseX >= 632+-10) {
    player.play();
  } //if the X position of the cursor equals 632 pixels then the player will play
  else {
    player.pause();
    player.rewind();
  } //pauses player and rewinds audio to beginning
}





void mousePressed() {
  if (value == 0) {
    value = 245;
  } 
  else {
    value = 0;
  }
}

void mouseReleased() {
  if (value == 1) {
    value = 245;
  } 
  else {
    value = 0;
  }
}



