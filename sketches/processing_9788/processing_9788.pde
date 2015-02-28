
/*
James Patrick Gordon
circuitShock
Based on 'Extrusion'
Song: "e-shock" by De\Vision.
*/

import ddf.minim.*;
import processing.opengl.*;

PImage a;
boolean onetime = true;
int[][] aPixels;
int[][] values;
float angle;
Minim minim;
AudioPlayer song;

void setup() {
  size(screen.width, screen.height, OPENGL);
  
  aPixels = new int[width][height];
  values = new int[width][height];
  noFill();

  // Load the image into a new array
  // Extract the values and store in an array
  a = loadImage("circuit.jpg");
  a.loadPixels();
  for (int i = 0; i < a.height; i++) {
    for (int j = 0; j < a.width; j++) {
      aPixels[j][i] = a.pixels[i*a.width + j];
      values[j][i] = int(blue(aPixels[j][i]));
    }
  }
  minim = new Minim(this);
  song = minim.loadFile("eShock.mp3", 1024);
  song.play();
  song.loop(); 
  
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);
  scale(2.0);
  
  // Update and constrain the angle
  angle +=song.sampleRate() *0.000001;
  println(song.sampleRate());
  rotateY(angle);  
  
  // Display the image mass
  for (int i = 0; i < a.height; i += 2) {
    for (int j = 0; j < a.width; j += 2) {
      stroke(aPixels[j][i], 153);
      line(j-a.width/2, i-a.height/2, -values[j][i], j-a.width/2, i-a.height/2, -values[j][i]-10);
    }
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  song.close();
  // always stop Minim before exiting.
  minim.stop();
 
  super.stop();
}

