
PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
import ddf.minim.*;
import ddf.minim.analysis.*;
  
Minim minim;
AudioPlayer song;
BeatDetect beat;
 
float eRadius;
 
void setup() {
  size(275, 257, P3D);
 minim = new Minim(this);
  song = minim.loadFile("song4.mp3", 800);
  
  img  = loadImage("gaga4.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;   // Calculate # of rows
  beat = new BeatDetect();
}
 
void draw() {
  background(0);
  img.loadPixels();
 beat.detect(song.mix);
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
     int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      if ( beat.isOnset() ) eRadius = 200;
      float z = (eRadius/(float)width) * brightness(img.pixels[loc]) - 100.0;
      // Translate to the location, set fill and stroke, and draw the rect
     eRadius *= 0.85;
  if ( eRadius < 20 ) eRadius = 20;
   
       pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
       
      popMatrix();
       
       
      }
       
    }
    if (keyPressed) {
      if ((key == 'S') || (key == 's')) {

  // always stop Minim before exiting
   song.pause();
 
       
  }
       if ((key == 'P') || (key == 'p')) {
        
 // minim.stop();
 
  song.play();
 
    }
     if ((key == 'B') || (key == 'b')) {
        if(song.isPlaying() )
         {
  song.rewind();
     }
     else
     {
      song.play();
       song.rewind();
     }
     }
  }///end key
    
    
  }//draw
 
 
 
void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
   
  super.stop();
}


