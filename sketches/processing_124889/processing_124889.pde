
//Project 3 (Final Project)
//"DRUM FUN"
//By: Raymond McKenna

//INSTRUCTIONS -
//This sketch is a virtual drum set that you can play along 
//with your choice of three different original tracks.
//To play a particular track, click 1(Dark Jazz Track),
//2(EDM Track), or 3(Country Track). 
//Then to play the drums along with the piece, you click the Q, W, E,or R keys.
//The Q key will play the Bass drum, the W key will play the
//Tom-Tom drum, the E key will play the Snare drum, and the R key will
//play the Cymbal. If you want to, you can play this sketch, open up
//your favorite song in any media and start playing along on your own.
//------------------------------------------------------------------------------
//SKETCH CODE

//Import minim library files
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//VARIABLES
PImage drumspic;
PImage crowdpic;

Minim minim;
AudioSample drumsQ;
AudioSample drumsW;
AudioSample drumsE;
AudioSample drumsR;
AudioSample songDJ;
AudioSample songEDM;
AudioSample songC;

//SETUP
void setup() {
 //canvas
  size (900,700);
 //image
  drumspic = loadImage("drumspic.png");
  crowdpic = loadImage("crowdpic.jpg");
 //audio
  minim = new Minim(this);
  drumsQ = minim.loadSample("Q.mp3");
  drumsW = minim.loadSample("W.mp3");
  drumsE = minim.loadSample("E.mp3");
  drumsR = minim.loadSample("R.mp3");
  songDJ = minim.loadSample("Dark Jazz.mp3");
  songEDM = minim.loadSample("EDM.mp3");
  songC = minim.loadSample("Country.mp3");
}

//DRAW
void draw() {
 //background and text
   image(crowdpic,0,0);
 //color changes
   if (key =='q') {
     fill(147,50,59,150);
     rect(0,0,900,700);
 }
   if (key =='w') {
     fill(199,191,80,150);
     rect(0,0,900,700);
 }
   if (key =='e') {
     fill(52,121,171,150);
     rect(0,0,900,700);
 }
   if (key =='r') {
     fill(64,151,116,150);
     rect(0,0,900,700);
 }
  //drum image
   image(drumspic, 0, 290);
//LETTERS
 //Q
   fill(147,50,59);
   textSize(70);
   text("Q",125,540);
 //W
   fill(199,191,80);
   textSize(70);
   text("W",315,435);
 //E
   fill(52,121,171);
   textSize(70);
   text("E", 550,435);
 //R
   fill(64,151,116);
   textSize(70);
   text("R",740,550); 
}

//KEY ACTIONS
void keyPressed() {
  //drum sound triggers
    if (key == 'q' ) drumsQ.trigger();
    if (key == 'w' ) drumsW.trigger();
    if (key == 'e' ) drumsE.trigger();
    if (key == 'r' ) drumsR.trigger();
  //track triggers
    if (key == '1' ) songDJ.trigger();
    if (key == '2' ) songEDM.trigger();
    if (key == '3' ) songC.trigger();
}
//END OF CODE

