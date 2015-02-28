
import ddf.minim.*; 

Minim minim;     
AudioPlayer mySound;


PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
float columns, rows;   // Number of columns and rows in our system

import peasy.*;
 
 
PeasyCam cam;

//import processing.pdf.*;
  
//boolean recording;
//PGraphicsPDF pdf;

void setup() {
  size(800, 800, P3D); 
  
   minim = new Minim(this);    
  mySound = minim.loadFile("Purple Haze.mp3"); 
  mySound.loop();

  float leftLevel = mySound.left.level() * 1000;
  float mixLevel = mySound.mix.level()*1000;
   float rightLevel = mySound.right.level()*1000;
   // pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
  img = loadImage("Jimi_Hendrix.jpg");  // Load the image
  columns = img.width / cellsize+leftLevel;  // Calculate # of columns
  rows = img.height / cellsize +rightLevel ;  // Calculate # of rows
  

cam = new PeasyCam(this,800);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(5000);

}

void draw() {
   
  float mixLevel = mySound.mix.level()*1000;
  background(0);
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mixLevel/100) * brightness(img.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  
  }
}


void keyPressed()
{
   if ( key == 'm' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
}

void stop()
{
 mySound.close();
  minim.stop();

  super.stop();
}
  //if((key=='s')||(key=='S')) {
   // saveFrame("#.pdf");
  //}
//}

  

