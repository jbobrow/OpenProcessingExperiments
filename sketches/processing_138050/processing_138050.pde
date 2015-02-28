
/*
* Introduction to Computational Arts: Processing - Final Project
* Title: 'Crystal Sounds'
* Description: The aim of this work is to produce a chain of sounds based ovalidate()le
* that the user can draw dynamically on the screen. It uses piano samples and it's 
* intended to reflect a calm feeling between the mixture of sounds and cold colors.
* The stars are thre to give a visual rythm to the image and to reflect constant
* change in sound.
* Author: Bruno Faundez Valenzuela (brunofaundezv@gmail.com)
* Instructions: Click and drag the mouse over the image to adjust the tone of the notes
* being played.
*/

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/*
* Sets up bars quantity and prepares variables for the values in the bars,
* the color palette and the radii of the two stars.
*/
int bars = 20;
int barWidth;
float [] values = new float[bars];
int barId;
int frameCounter;
color [] palette = new color[4];

int starRadius = 250;
int starInnerRadius = int(starRadius*0.6);
int starRadius2 = 200;
int starInnerRadius2 = int(starRadius*0.7);


//Sound related variables
Minim minim;
AudioSample [] sample = new AudioSample [8];

void setup(){
  size(1000, 600);
  frameRate(60);
  for(int i=0; i<bars; i++){
    values[i] = random(1);
  }
  barId = 0;
  frameCounter = 0;
  rectMode(CORNERS);
  noStroke();
  
  //Sets up the palette based on cold colors
  palette[0] = color(120, 201, 184, 128);
  palette[1] = color(37, 142, 120);
  palette[2] = color(15, 81, 165, 200);
  palette[3] = color(39, 185, 123, 150);
  
  //Starts up minim and loads the eight notes of the scale
  minim = new Minim(this);
  sample[0] = minim.loadSample("sound01.wav");
  sample[1] = minim.loadSample("sound02.wav");
  sample[2] = minim.loadSample("sound03.wav");
  sample[3] = minim.loadSample("sound04.wav");
  sample[4] = minim.loadSample("sound05.wav");
  sample[5] = minim.loadSample("sound06.wav");
  sample[6] = minim.loadSample("sound07.wav");
  sample[7] = minim.loadSample("sound08.wav");
  
  barWidth = width/bars;
}

void draw(){
  background(255);
  //Draws Bars based on the values stored in the array
  noStroke();
  for(int i=0; i<bars; i++){
    fill(palette[0]);
    if(i == barId){
      fill(palette[1]);
    }
    rect(width/bars*i, height, width/bars*(i+1), height*values[i]);
  }
  
  //Iterates through the array of values using a barId variable
  //which changes every 15 frames (1/4 second) and it's used to
  //plat the following sound
  frameCounter += 1;
  if(frameCounter == 15){
    frameCounter = 0;
    barId += 1;
    if(barId == bars){
      barId = 0;
    }
    int sampleId = (int) map(values[barId], 0, 1, 8, 0);
    sample[sampleId].trigger();
  }
  
  //Draws the first star using a for cycle and some trigonometry
  fill(palette[3]);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount/3));
  ellipse(0, 0, 30, 30);
  beginShape();
  curveVertex(starRadius*cos(0), starRadius*sin(0));
  int i = 0;
  for(i=0; i<bars; i++){
    if(i == barId){
      curveVertex(starRadius*1.3*cos(TWO_PI/bars*i), starRadius*1.3*sin(TWO_PI/bars*i));
    }else{
      curveVertex(starRadius*cos(TWO_PI/bars*i), starRadius*sin(TWO_PI/bars*i));
    }
    curveVertex(starInnerRadius*cos(TWO_PI/bars*(i+0.5)), starInnerRadius*sin(TWO_PI/bars*(i+0.5)));
  }
  curveVertex(starRadius/2*cos(TWO_PI/bars*i+0.5), starRadius/2*sin(TWO_PI/bars*i+0.5));
  endShape(CLOSE);
  popMatrix();
  
  
  //Draws the second star
  stroke(palette[2]);
  fill(palette[2]);
  pushMatrix();
  translate(width/2, height/2);
  rotate(-radians(frameCount/2));
  ellipse(0, 0, 30, 30);
  beginShape();
  curveVertex(starRadius2*cos(0), starRadius2*sin(0));
  i = 0;
  for(i=0; i<bars; i++){
    if(i == barId){
      curveVertex(starRadius2*1.3*cos(TWO_PI/bars*i), starRadius2*1.3*sin(TWO_PI/bars*i));
    }else{
      curveVertex(starRadius2*cos(TWO_PI/bars*i), starRadius2*sin(TWO_PI/bars*i));
    }
    curveVertex(starInnerRadius2*cos(TWO_PI/bars*(i+0.5)), starInnerRadius2*sin(TWO_PI/bars*(i+0.5)));
  }
  curveVertex(starRadius/2*cos(TWO_PI/bars*i+0.5), starRadius/2*sin(TWO_PI/bars*i+0.5));
  endShape(CLOSE);
  popMatrix();
}

void mouseDragged(){
  //Calculates the id of the bar being dragged and adjusts it's value based on the Y-Position
  int bar = mouseX/barWidth;
  bar = constrain(bar, 0, bars-1);
  values[bar] = map(mouseY, 0, height, 0, 1);
}

