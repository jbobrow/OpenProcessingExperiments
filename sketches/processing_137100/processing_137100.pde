
// Always Remember 2 forget me with Francoise Hardy Sound

// import Minim

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim; // Creates an instance of Minim itself. Access the functionality of Minim
AudioPlayer fhardy; // file of fHardy's song

//Always remember to forget me
// An ironical present for Valentin's day or
// a sort of good-by

// working with while
// Text for Canvas
// Global Variables

float x = 25;
float y = 25;
float counter = 0;
color [] palette = {
  0x7F6FE5D1, 0x7FFC2F0A, 0x7FFCF50A, 0x7F1A1271, 0x7F3FFA0D
};

//String phrase = "Always remember to forget me";
float theta;


// Setup
void setup() {
  size(1250, 700);
  background(palette[0]);

// create instance of minim class
  minim = new Minim(this); //a new instance of the minm class (this is argument for contents
  fhardy = minim.loadFile("fhardy.mp3");
  fhardy.play(); // call the command to play back the audiofile
  
}

// draw()
void draw() {
  frameRate (7);
  float r = random(1, 5);
  strokeWeight(random(100));
  stroke(palette[int(r)]);
  noFill();
  rect(0, 0, width, height);

  // while Statement
  while (counter < random (300)) {
    x = random(width);
    y = random(height);
    float d = random(200);
    ellipse (x, y, d, d);
    counter ++;
  }



  String phrase = "Always remember to forget me";

  // PFont and loading external font
  PFont comic = loadFont("ComicSansMS-Bold-48.vlw");
  textFont(comic);
  fill(#0A0A01) ;
  textSize(50);
  textAlign(CENTER);
  rotate(theta);
  text(phrase, width/2, height/2);
  theta += 0.6;
}


