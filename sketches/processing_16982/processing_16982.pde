


// LIBRARYS

import pitaru.sonia_v2_9.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import processing.serial.*;

// GLOBAL VARS

boolean   showBackend               = false;

Mill mill;

// MOUSEWHEEL

float     mouseWheelVelocity        = 0;
float     prevMouseWheelVelocity    = 0;
// GUI


int       padding = 175;

color     primaryColor   = color(40, 40, 40);
color     secondaryColor = color(255, 255, 240);

// SETUP

void setup() {

  size(1440, 900);
  frameRate(60);

  rectMode(CENTER); 

  Arduino.init(this);
  SoundProcessing.init(this, 0.01, 0.0025);

  // MOUSE WHEEL

  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  ); 

  // ---

   mill = new Mill(this);

}

// DRAW

void draw() {

  background(0);
  smooth();

  // MOUSEWHEEL

  mouseWheelUpdater();

  // UPDATE CURRENT APPLICATION

  if(mill != null) mill.update();


  if(showBackend) {
    if(mill != null) mill.draw(g);
 

  }

}

void drawRecordButton() {
  stroke(200, 200, 200);
  noFill();
  ellipse(35, 50, 20, 20);
}

// SERIAL

void serialEvent(Serial port) {
  Arduino.serialEvent(port);
}

// MOUSEWHEEL

int lastMouseWheelFrame;
int frameCounter;

void mouseWheel(int delta) {
  if(lastMouseWheelFrame != frameCount) {
    mouseWheelVelocity += delta;
  }
  lastMouseWheelFrame = frameCount;
}

void mouseWheelUpdater() {

  if(frameCount - frameCounter > 10) {

    frameCounter = frameCount;

    mouseWheelVelocity /= 8; 
    mouseWheelEvent();
    prevMouseWheelVelocity = mouseWheelVelocity;
    mouseWheelVelocity = 0;
  }

}


void mouseWheelEvent() {

   if(mill != null) mill.mouseWheelUpdate();

}

void keyPressed() {
  
  showBackend = !showBackend;

}






