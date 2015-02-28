
/*
 * Assignment 3 - Functionality 4
 * by Timothy Watt
 * SOMA 2607 - Intro to Interactive Media
 * Bachelor of Digital Media, COFA
 *
 */

import ddf.minim.*;

Minim minim;
// Declare tracks
AudioPlayer preCycle;
AudioPlayer presence;
AudioPlayer intense;
AudioPlayer goAway;
AudioPlayer silence;

PFont font;

// Global distance variables
int deepEnough = 300;   // 3m from kinect
int buffer = 80;       // 1.8m from kinect
int critical = 100;     // 1m from kinect

boolean broken = false; 

int drawCounter = 0;    // Tool
int backgroundColour = 255;


void setup () {
  size(720, 420, P2D);
  smooth();

  minim = new Minim(this);
  preCycle = minim.loadFile("02_1_preCycle.mp3");
  presence = minim.loadFile("02_2_presence.mp3");
  intense = minim.loadFile("02_3_intense.mp3");
  goAway = minim.loadFile("02_4_goAway.mp3");
  silence = minim.loadFile("02_5_silence.mp3");
  
  font = loadFont ("ArialMT-20.vlw");
  textFont(font, 20);
}


void draw () {
  background(backgroundColour);
  println ("howDeep = " + howDeep());
  drawInterface();
  
  if (broken == true) {
    println ("BROKEN");
    if (participantDetect() == false) {
      broken = false;
      silence.pause();
      silence.cue(0);
    }
  } 
  else if (broken == false) {
    // Play a 'preCycle' while no participant is detected.
    if (preCycle.isPlaying() == false) {
      preCycle.loop();
      println ("WORKING");
    }
    //println ("drawCounter = " + drawCounter);
    // If participant is detected, play 'presence'.
    if (participantDetect() == true) {
      if (presence.isPlaying() == false) {
        presence.loop();
      }
      // If participant is deep enough, play 'intense'.
      if (howDeep() <= deepEnough) {
        if (intense.isPlaying() == false) {
          intense.loop();
        }
        // As the participant approaches closer the highpass is
        // deactivated to reveal the sound (a sound barrier).
        /* highpass(howDeep()); */
        // If participant approaches critical distance(cm), play 'go away'.
        if (howDeep() <= critical + buffer) {
          if (goAway.isPlaying() == false) {
            goAway.loop();
          }
          // If participant reaches critical distance(cm), stop all sound.
          if (howDeep() <= critical) {
            silence.play();
            stopAllTracks();
            broken = true;
          }
        } // If participant leaves critical distance, stop 'go away'.
        else if (howDeep() > critical + buffer) {
          goAway.pause();
          goAway.cue(0);
        }
      } // If participant isn't deep enough, stop 'intense'.
      else if (howDeep() >= deepEnough) {
        intense.pause();
        intense.cue(0);
      }
    } // If no participant is detected, stop 'presence'.
    else if (participantDetect() == false) {
      presence.pause();
      presence.cue(1);
    }
  }
}

