
//load up variables, music and images

PImage ori; PImage blu; PImage gree; PImage ora; PImage pin; 
PImage purp;PImage yell;
import ddf.minim.*;
AudioPlayer player;
Minim minim;

int cellsize = 3; 
int cols, rows; 

//loading up images and setting up the file

void setup() {
  ori = loadImage("waterfall.jpg");
  blu = loadImage("waterfallblue.jpg");
  gree = loadImage("waterfallgreen.jpg");
  ora = loadImage("waterfallorange.jpg");
  pin = loadImage("waterfallpink.jpg");
  purp = loadImage("waterfallpurple.jpg");
  yell = loadImage("waterfallyellow.jpg");
  size(500, 667, P3D);
  image(ori, 0, 0);
  noStroke();
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("waterfall.mp3");
  player.play();
  cols = width/cellsize;              
  rows = height/cellsize;   

}
// the image gets pixalted evertyime you get move mouse
  void draw() {
image(ori, 0, 0);
ori.loadPixels();
 
   for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = ori.pixels[loc];       // Grab the color

      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(ori.pixels[loc])- 100.0;

      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x,y,z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
    }
    }
 
}

//if you do this with your mouse, the image will change
void mouseClicked() {
  image(blu, 0,0 );
}
void mousePressed() {
  image(gree, 0,0 );
}
void mouseMoved() {
 image(pin, 0,0 );
}


//music stops

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
  


