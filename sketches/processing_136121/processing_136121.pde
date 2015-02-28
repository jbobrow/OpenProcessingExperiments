
import ddf.minim.*;
//Author: Cat
//Date Created: 25/2/2013
//Final Project
//Artistic Description: I have been doing some hiking lately and
//and was keen to convey a nature theme

// Water sound effect: http://static1.grsites.com/archive/sounds/water/water001.wav
// Wind sound effect: http://static1.grsites.com/archive/sounds/nature/nature003.wav
// Fire sound effect: http://static1.grsites.com/archive/sounds/nature/nature004.wav

Minim minim;
AudioSample water;

color [] bgPalette = {#C5F2FF, #A4FFAC};
color waterColor = color(0, 82, 55);
int natureScene = 0;
boolean drawingWater=false;
int diam = 5;
int x, y;

void setup() {
  size(1024, 700);
  colorMode(HSB, 360, 100, 100);
  frameRate(25);
  minim = new Minim(this);
  water =  minim.loadSample("water.wav");
  background(bgPalette[natureScene]);
  
}

void draw() {
  //background(bgPalette[natureScene]);
  
    if(mousePressed && !drawingWater) {
     drawingWater=true;
     water.trigger();
     x=mouseX;
     y=mouseY;
  }
  if (drawingWater) {
     pushMatrix();
     stroke(waterColor);
     strokeWeight(3);
     fill(bgPalette[natureScene]);
     ellipse(x, y, diam, diam);
     noFill();
     ellipse(x, y, diam, diam);
     diam += 30;
     popMatrix();
     if (diam >1600) {
       drawingWater = !drawingWater;
     }
  } else {
    diam=5;
  }
  
  if(natureScene == 1) {
    
  }
  if(natureScene == 2) {
    
  }
  
}

void keyReleased() {
 if (key == 1) {
  natureScene = 0;
 } 
 if (key == 2) {
  natureScene = 1;
 } 
 if (key == DELETE || key==BACKSPACE) {
    background(bgPalette[natureScene]);   
  }
  
  if (key =='s' || key == 'S') {
      saveFrame("screenshot.png");
  }
}

