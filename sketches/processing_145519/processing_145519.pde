
//Made by Dalton Varney on 4/20/14
//Must have Leap Motion Detector
// Must import mp3 files into data folder
//Must download and import minim processing library here:
//http://code.compartmental.net/tools/minim/
//must download and import leap motion processing library here:
//https://github.com/onformative/LeapMotionP5
//Some code used was obtained in examples from the leap Motion processing library and:
//https://github.com/onformative/LeapMotionP5
//Leap motion for Processing Example code used from: e1_basic & e2_gestures

//Importing libraries Here:
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import de.voidplus.leapmotion.*;
LeapMotion leap;
// Declaring the mp3 file function things
Minim minim;
AudioSample playA;
AudioSample playB;
AudioSample playC;
AudioSample playD;
AudioSample playE;
AudioSample playF;
AudioSample playG;
AudioSample playCS;
AudioSample playAS;
AudioSample playGS;
AudioSample playFS;
AudioSample playDS;
AudioSample playHiC;
//A true or false variable to determine whether the menu screen should be active or not
boolean menu = true;
//Feel free to change the size to anything, it should still work
int size = 750;
//declaring the color arrays
int col [] = {255, 255, 255, 255, 255, 255, 255, 255};
int col2 [] = {0,0,0,0,0};

void setup () {
  size(size, size, P3D);
  background(0);
  minim = new Minim(this);
  noStroke(); fill(50);
  leap = new LeapMotion(this);
  //defining the mp3 names and assigning them to reference items
  playA = minim.loadSample("A.mp3");
  playAS = minim.loadSample("A#.mp3");
  playCS = minim.loadSample("C#.mp3");
  playDS = minim.loadSample("D#.mp3");
  playFS = minim.loadSample("F#.mp3");
  playGS = minim.loadSample("G#.mp3");
  playHiC = minim.loadSample("HiC.mp3");
  playB = minim.loadSample("B.mp3");
  playC = minim.loadSample("C.mp3");
  playD = minim.loadSample("D.mp3");
  playE = minim.loadSample("E.mp3");
  playF = minim.loadSample("F.mp3");
  playG = minim.loadSample("G.mp3");
}

void draw() {
  background (0);
  //the call to the leapFunction
  leapFunction ();
  //the piano keys
  fill(col[0]);
  rect(size- (size/8), size/5, size/8.2, size/2);
  fill(col[1]);
  rect(size- 2*(size/8), size/5, size/8.2, size/2);
  fill(col[2]);
  rect(size- 3*(size/8), size/5, size/8.2, size/2);
  fill(col[3]);
  rect(size- 4*(size/8), size/5, size/8.2, size/2);
  fill(col[4]);
  rect(size- 5*(size/8), size/5, size/8.2, size/2);
  fill(col[5]);
  rect(size- 6*(size/8), size/5, size/8.2, size/2);
  fill(col[6]);
  rect(size- 7*(size/8), size/5, size/8.2, size/2);
  fill(col[7]);
  rect(size- 8*(size/8), size/5, size/8.2, size/2);
  fill(col2[0]);
  rect(size- 6.4*(size/7), size/5, size/15, size/3);
  fill(col2[1]);
  rect(size- 5.4*(size/7), size/5, size/15, size/3);
  fill(col2[2]);
  rect(size- 3.8*(size/7), size/5, size/15, size/3);
  fill(col2[3]);
  rect(size- 2.8*(size/7), size/5, size/15, size/3);
  fill(col2[4]);
  rect(size- 1.9*(size/7), size/5, size/15, size/3);
  fill(255);
  text("Piano", (size/2 - 14), size/20);
  //Changing the color arrays to set the color of the piano keys
  for(int i = 0; i< col.length; i ++) {
  if (keyPressed == false) {
    col[i] = 255;
  }
  }
  for(int i = 0; i< col2.length; i ++) {
  if (keyPressed == false) {
    col2[i] = 0;
  }
  }
  //The start Screen:
  if(menu == true) {
    fill(255);
    rect(0,0,size,size);
    fill(150);
    rect((size/2 - size/10), size/2, size/5, size/10);
    fill(0);
    text("Menu", (size/2 - 14), size/20);
    text("Play", (size/2 - 12), size/2 + size/20);
    if ( mousePressed == true && mouseX > (size/2 - size/10) && mouseX <  (size/2 + size/10) && mouseY > (size/ 2) && mouseY < (size/2 +size/10)){
      menu = false;
    }
  }
}

//Leap function that senses finger position and assigns it to the keys
void leapFunction () {
  
  int fps = leap.getFrameRate();
  
  // HANDS
  for(Hand hand : leap.getHands()){

    
    // FINGERS
    for(Finger finger : hand.getFingers()){
      
      // Basics
      finger.draw();
      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();

      //the code to determine if a finger is in the region of the piano keys
 if ( finger_position.x > size- 6.4*(size/7) && finger_position.x < (size- 6.4*(size/7)) +size/15 && finger_position.y < (size/5) +(size/3)) {
      playCS.trigger();
      col2[0] = 150;
     
    }
    if (finger_position.x > size- 5.4*(size/7) && finger_position.x < (size- 5.4*(size/7)) +size/15 && finger_position.y < (size/5) +(size/3) ) {
      playDS.trigger();
      col2[1] = 150;
    }
    if (finger_position.x > size- 3.8*(size/7) && finger_position.x < (size- 3.8*(size/7)) +size/15 && finger_position.y < (size/5) +(size/3) ) {
      playFS.trigger();
      col2[2] = 150;
    }
    if (finger_position.x > size- 2.8*(size/7) && finger_position.x < (size- 2.8*(size/7)) +size/15 && finger_position.y < (size/5) +(size/3)) {
      playGS.trigger();
      col2[3] = 150;
    }
    if (finger_position.x > size- 1.9*(size/7) && finger_position.x < (size- 1.9*(size/7)) +size/15 && finger_position.y < (size/5) +(size/3) ) {
      playAS.trigger();
      col2[4] = 150;
    }
    if ( finger_position.x > size- (size/8) && finger_position.x < (size- (size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2) ) {
      playHiC.trigger();
      col[0] = 150;
    }
    if ( finger_position.x > size- 2*(size/8) && finger_position.x < (size- 2*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2)) {
      playB.trigger();
      col[1] = 150;
    }
    if ( finger_position.x > size- 3*(size/8) && finger_position.x < (size- 3*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2)) {
      playA.trigger();
      col[2] = 150;
    }
    if ( finger_position.x > size- 4*(size/8) && finger_position.x < (size- 4*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2) ) {
      playG.trigger();
      col[3] = 150;
    }
    if ( finger_position.x > size- 5*(size/8) && finger_position.x < (size- 5*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2) ) {
      playF.trigger();
      col[4] = 150;
    }
    if ( finger_position.x > size- 6*(size/8) && finger_position.x < (size- 6*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2)) {
      playE.trigger();
      col[5] = 150;
    }
    if ( finger_position.x > size- 7*(size/8) && finger_position.x < (size- 7*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2) ) {
      playD.trigger();
      col[6] = 150;
    }
    if ( finger_position.x > size- 8*(size/8) && finger_position.x < (size- 8*(size/8)) +size/8.2 && finger_position.y < (size/5) +(size/2)) {
      playC.trigger();
      col[7] = 150;
    }
      
      // Touch Emulation
      int     touch_zone        = finger.getTouchZone();
      float   touch_distance    = finger.getTouchDistance();
      
      switch(touch_zone){
        case -1: // None
          break;
        case 0: // Hovering
          // println("Hovering (#"+finger_id+"): "+touch_distance);
          break;
        case 1: // Touching
          // println("Touching (#"+finger_id+")");
          break;
      }
    }
    
    // TOOLS
    for(Tool tool : hand.getTools()){
      
      // Basics
      tool.draw();
      int     tool_id           = tool.getId();
      PVector tool_position     = tool.getPosition();
      PVector tool_stabilized   = tool.getStabilizedPosition();
      PVector tool_velocity     = tool.getVelocity();
      PVector tool_direction    = tool.getDirection();
      float   tool_time         = tool.getTimeVisible();
      
      
      
      // Touch Emulation
      int     touch_zone        = tool.getTouchZone();
      float   touch_distance    = tool.getTouchDistance();
      
      switch(touch_zone){
        case -1: // None
          break;
        case 0: // Hovering
          // println("Hovering (#"+tool_id+"): "+touch_distance);
          break;
        case 1: // Touching
          // println("Touching (#"+tool_id+")");
          break;
      }
    }
    
  }
}
void keyPressed()
{
  //optional use of the keyboard to play piano notes
  if (keyPressed) {
    if ( key == 'w') {
      playCS.trigger();
      col2[0] = 150;
    }
    if ( key == 'e' ) {
      playDS.trigger();
      col2[1] = 150;
    }
    if ( key == 't' ) {
      playFS.trigger();
      col2[2] = 150;
    }
    if ( key == 'y' ) {
      playGS.trigger();
      col2[3] = 150;
    }
    if ( key == 'u' ) {
      playAS.trigger();
      col2[4] = 150;
    }
    if ( key == 'k' ) {
      playHiC.trigger();
      col[0] = 150;
    }
    if ( key == 'j' ) {
      playB.trigger();
      col[1] = 150;
    }
    if ( key == 'h' ) {
      playA.trigger();
      col[2] = 150;
    }
    if ( key == 'g' ) {
      playG.trigger();
      col[3] = 150;
    }
    if ( key == 'f' ) {
      playF.trigger();
      col[4] = 150;
    }
    if ( key == 'd' ) {
      playE.trigger();
      col[5] = 150;
    }
    if ( key == 's' ) {
      playD.trigger();
      col[6] = 150;
    }
    if ( key == 'a' ) {
      playC.trigger();
      col[7] = 150;
    }
  }
}


void stop()
{
  // we need to close the minim functions apparently( from what i've learned on the internet)
  playA.close();
  playB.close();
  playC.close();
  playD.close();
  playE.close();
  playF.close();
  playG.close();
  playCS.close();
  playDS.close();
  playAS.close();
  playGS.close();
  playFS.close();
  minim.stop();
  //super.stop();
}

