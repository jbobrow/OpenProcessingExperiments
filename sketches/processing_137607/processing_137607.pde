
import ddf.minim.*;
//Author: Cat
//Date Created: 3/3/2014
//Final Project
//Artistic Description: I have been doing some hiking lately and
//and was keen to convey a nature theme, so I used one of my photos
//I added wind sounds to the trees and water drops to the lake

// Water sound effect: http://static1.grsites.com/archive/sounds/water/water001.wav
// Wind sound effect: http://www.soundjay.com/wind-sound-effect.html
// Background Image - taken by Cat 27/2/2014 at Dove Lake, Cradle Mountain, Tas, Aus

Minim minim;
AudioSample water;
AudioSample wind;
PImage bgImage;

color waterColor = color(52, 60, 79);
boolean drawingWater=false;
int diam = 5;
int x, y;

void setup() {
  size(1024, 700);
  colorMode(HSB, 360, 100, 100);
  frameRate(20);
  minim = new Minim(this);
  water =  minim.loadSample("water.wav");
  wind =  minim.loadSample("windy.wav");
  bgImage = loadImage("P2272187.JPG");
  
}

void draw() {
    image(bgImage, 0, 0);//(image, x, y, scale, scale)
    if(mousePressed && !drawingWater) {
      if (mouseX <= 650 && mouseY >= 430 && mouseY <= 620) {
       drawingWater=true;
       water.trigger();
       x=mouseX;
       y=mouseY;
      }
  }
  
  //Check is mouse is in the vicinity of the trees
  if(mouseY >= 270 && mouseY <= 420) {
    wind.trigger();
  }
  if (mouseY >=420 && mouseY <= 570 && mouseX >= 780) {
    wind.trigger();
  }
  if (mouseY >=570 && mouseX>= 580) {
   wind.trigger();
  }
  
  if (drawingWater) {
     pushMatrix();
     stroke(waterColor);
     strokeWeight(2);
     noFill();
     ellipse(x, y, diam, diam/2);
     ellipse(x, y, diam-15, diam/2-15);
     ellipse(x, y, diam-30, diam/2-30);
     diam += 5;
     popMatrix();
     if (diam >200) {
       drawingWater = !drawingWater;
     }
  } else {
    diam=5;
  }

  
}

void keyReleased() {
 if (key == DELETE || key==BACKSPACE) {
    background(waterColor);   
  }
  
  if (key =='s' || key == 'S') {
      saveFrame("screenshot.png");
  }
}

