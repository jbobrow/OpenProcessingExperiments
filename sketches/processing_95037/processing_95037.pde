
import ddf.minim.*;

Minim minim;
AudioPlayer player;

PImage img; // Declare variable "a" of type PImage

void setup() {
  size(800, 300);
  img = loadImage("walking.png"); // Load the image into the program

  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);

  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("drums.wav");
}

void draw() {
  background(0);
  //tunnel
  fill(60);
  rect(0, 40, 800, 240);

  //wooden beams
  fill(93, 66, 25);
  rect(20, 40, 20, 240);

  fill(93, 66, 25);
  rect(340, 40, 20, 240);

  fill(93, 66, 25);
  rect(640, 40, 20, 240);

  // Displays the image at point (mouseX, 200) at half of its size
  imageMode(CENTER);
  image(img, mouseX, 200, img.width/2, img.height/2);

  //cart
  fill(150);
  rect(290, 215, 140, 50);  
  ellipse(310, 275, 20, 20);
  ellipse(410, 275, 20, 20);

  if (mouseX >= 320 && mouseX <= 340) {
    // play the file
    player.play();
  }
  else {
    // stop audio and reset to beginning
    player.pause();
    player.rewind();
  }
}



