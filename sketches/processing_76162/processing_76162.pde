
int posX;
int posY;

int oneX;
int oneY;
int twoX;
int twoY;
int threeX;
int threeY;
int fourX;
int fourY;
int fiveX;
int fiveY;
int sixX;
int sixY;
int sevenX;
int sevenY;

boolean pickOne, pickTwo, pickThree, pickFour, pickFive, pickSix, pickSeven;
boolean pickClear;

PFont font;

//sound setup

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//boolean playSound;

Minim minim;
//AudioPlayer Sound;

//Audio signal
AudioOutput out;

//Waveforms
SquareWave squareFrequency;
//SawWave saw;

LowPassSP lowSP;
LowPassFS lowFS;
BandPass band;
HighPassSP highSP;
NotchFilter notch;


void setup () {
 size(1000,800);
 background(255);
 
 posX = 100;
 posY = 100;
 
 oneX = 50;
 oneY = 50;
 twoX = 50;
 twoY = 150;
 threeX = 50;
 threeY = 250;
 fourX = 50;
 fourY = 350;
 fiveX = 50;
 fiveY = 450;
 sixX = 50;
 sixY = 550;
 sevenX = 50;
 sevenY = 650;
 
 pickOne = false;
 pickTwo = false;
 pickThree = false;
 pickFour = false;
 pickFive = false;
 pickSix = false;
 pickSeven = false;
 pickClear = false;
 
 font = loadFont("Arial-BoldMT-24.vlw");
 textFont(font);
 
 //sound setup
 
  minim = new Minim(this);
  out = minim.getLineOut();
  
//instead of "out="  
//Sound = minim.loadFile("beep-07.wav", 2048);
 
  // create a square and saw waves with a frequency of 440 Hz, 
  // an amplitude of 1 and the sample rate at 44
  squareFrequency = new SquareWave(500, 1, 44100);
//  saw = new SawWave(210, 1, 44100);
 
 // create the filters with various settings
  lowFS = new LowPassFS(200, 44100);
  lowSP = new LowPassSP(200, 44100);
  highSP = new HighPassSP(800, 44100);
  band = new BandPass(300, 200, 44100);
  notch = new NotchFilter(200, 200, 44100);
 
  // attach signals to output

//  out.addSignal(saw);
 
}


void draw() {
  
  if (mousePressed == true && mouseX > posX) {
    stroke (255,0,0);
    strokeWeight(10);
    line(mouseX, mouseY, pmouseX, pmouseY);
  
  }
  
  //button one
  fill(255);
  noStroke ();
  rect(0, 0, 100, 100);
  fill(0,0,0);
  ellipse(50, oneY, 50, 50);
  
  if (mousePressed==true && mouseX < 100 && mouseY < 100) {
    pickOne = true;
  }
  
  if (pickOne == true) {
     color c = get(oneX+26, oneY); 
     fill(c);
     oneX+=2;
     ellipse(oneX, oneY, 50, 50);
  }
     
     if (get(oneX+26, oneY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(261.63);
       println("red1");
     }
     else{
        out.removeSignal(squareFrequency);
     }
//  
//    if (oneX > width-26) {
//    fill(255);
//  }
//  
  if (oneX > width) {
    oneX = 50;
  }
  
  //button two
  fill(255);
  noStroke ();
  rect(0, 100, 100, 100);
  fill(0,0,0);
  ellipse(50, twoY, 50, 50);
  
  if (mousePressed==true && mouseX < 100 && mouseY > 100 && mouseY < 200) {
    pickTwo = true;
  }
  
  if (pickTwo == true) {
     color c = get(twoX+26, twoY); 
     fill(c);
     twoX+=2;
     ellipse(twoX, twoY, 50, 50);
  }
  
       if (get(twoX+26, twoY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(293.66);
       println("red2");
     }
     else{
        out.removeSignal(squareFrequency);
     }
  
    if (twoX > width) {
    twoX = 50;
  }
  
  //button three
  fill(255);
  noStroke ();
  rect(0, 200, 100, 100);
  fill(0,0,0);
  ellipse(50, threeY, 50, 50);
  
  if (mousePressed==true && mouseX < 100 && mouseY > 200 && mouseY < 300) {
    pickThree = true;
  }
  
  if (pickThree == true) {
     color c = get(threeX+26, threeY); 
     fill(c);
     threeX+=2;
     ellipse(threeX, threeY, 50, 50);
  }
  
       if (get(threeX+26, threeY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(329.63);
       println("red3");
     }
     else{
        out.removeSignal(squareFrequency);
     }
  
  if (threeX > width) {
    threeX = 50;
  }
  
  //button four
  fill(255);
  noStroke ();
  rect(0, 300, 100, 100);
  fill(0,0,0);
  ellipse(50, fourY, 50, 50);
  
  if (mousePressed==true && mouseX < 100 && mouseY > 300 && mouseY < 400) {
    pickFour = true;
  }
  
  if (pickFour == true) {
     color c = get(fourX+26, fourY); 
     fill(c);
     fourX+=2;
     ellipse(fourX, fourY, 50, 50);
  }
  
       if (get(fourX+26, fourY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(349.23);
       println("red4");
     }
     else{
        out.removeSignal(squareFrequency);
     }
  
  if (fourX > width) {
    fourX = 50;
  }
  
  //button five
  fill(255);
  noStroke ();
  rect(0, 400, 100, 100);
  fill(0,0,0);
  ellipse(50, fiveY, 50, 50);
  
    if (mousePressed==true && mouseX < 100 && mouseY > 400 && mouseY < 500) {
    pickFive = true;
  }
  
  if (pickFive == true) {
     color c = get(fiveX+26, fiveY); 
     fill(c);
     fiveX+=2;
     ellipse(fiveX, fiveY, 50, 50);
  }
  
       if (get(fiveX+26, fiveY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(392.00);
       println("red5");
     }
     else{
        out.removeSignal(squareFrequency);
     }
  
  if (fiveX > width) {
    fiveX = 50;
  }
  
  //button six
  fill(255);
  noStroke ();
  rect(0, 500, 100, 100);
  fill(0,0,0);
  ellipse(50, sixY, 50, 50);
  
  if (mousePressed==true && mouseX < 100 && mouseY > 500 && mouseY < 600) {
    pickSix = true;
  }
  
  if (pickSix == true) {
     color c = get(sixX+26, sixY); 
     fill(c);
     sixX+=2;
     ellipse(sixX, sixY, 50, 50);
  }
  
       if (get(sixX+26, sixY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(440.00);
       println("red6");
     }
     else{
        out.removeSignal(squareFrequency);
     }
  
  if (sixX > width) {
    sixX = 50;
  }
  
  //button seven 
  fill(255);
  noStroke ();
  rect(0, 600, 100, 100);
  fill(0,0,0);
  ellipse(50, sevenY, 50, 50);
  
  if (mousePressed==true && mouseX < 100 && mouseY > 600 && mouseY < 700) {
    pickSeven = true;
  }
  
  if (pickSeven == true) {
     color c = get(sevenX+26, sevenY); 
     fill(c);
     sevenX+=2;
     ellipse(sevenX, sevenY, 50, 50);
  }
  
       if (get(sevenX+26, sevenY) == color(255,0,0)) {
       out.addSignal(squareFrequency);
       squareFrequency.setFreq(493.88);
       println("red7");
     }
     else{
        out.removeSignal(squareFrequency);
     }
  
  if (sevenX > width) {
    sevenX = 50;
  }
  
  //clear button
  fill(255);
  noStroke ();
  rect(0, 700, 100, 100);
  fill(0);
  textAlign(CENTER);
  text("clear", 50, 750); 
  
   if (mousePressed==true && mouseX < 100 && mouseY > 700 && mouseY < 800) {
    pickClear = true;
  }
  
  if (pickClear == true) {
        setup();
//     fill(255);
//     rect(100, 0, 900, 800);
//     rect(0, 0, width, height); 
  }
  
}

void stop() {
  // always close Minim audio classes when you are done with them
//  Sound.close();
  // always stop Minim before exiting
  out.close();
  minim.stop();
  
  super.stop();
}


