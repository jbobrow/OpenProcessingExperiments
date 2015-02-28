
/*
  Drum Machine
  - Sounds are from an MPC-2000
*/

//global variables
int i = 0;
int x = 63;
float randomEllipse = 20;
int maxText = 50;
int minText = 25;
PImage bg;

//Audio
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer tom1;
AudioPlayer tom2;
AudioPlayer kick;
AudioPlayer snare;
AudioPlayer hhClosed;
AudioPlayer hhOpen;
AudioPlayer ride;
AudioPlayer crash;

// color palette
color[] palette = {
  #1D1B10, #F1E0CC, #585D56, #C5B58D, #BE2C21
};

//setup()
void setup() {
  size(1280,720);
  noStroke();
  background(palette[0]);
  bg = loadImage("bg.png");
  image(bg,0,0);
  key();
  minim = new Minim(this);
}

//draw()
void draw() {}

// key - text block
void key() {
  fill(palette[1]);
  textSize(15);
  text("keys = A S D F   J K L :", 20, 660);
  text("r = resets app", 20,680); 
  text("c = saves screenCapture.png", 20,700);
}

//active when 'a' key is pressed
void functionA() {
  if (i < x) {
    fill(palette[1]);
    textSize(random(minText,maxText));
    text("tom1",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    tom1 = minim.loadFile("tom1.wav");
    tom1.play();
    i++; 
  }
}

//active when 's' key is pressed
void functionS() {
  if (i < x) {
    fill(palette[2]);
    textSize(random(minText,maxText));
    text("tom2",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    tom2 = minim.loadFile("tom2.wav");
    tom2.play();
    i++; 
  }
}

//active when 'd' key is pressed
void functionD() {
  if (i < x) {
    fill(palette[3]);
    textSize(random(minText,maxText));
    text("kick",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    kick = minim.loadFile("kick.wav");
    kick.play();
    i++; 
  }
}

//active when 'f' key is pressed
void functionF() {
  if (i < x) {
    fill(palette[4]);
    textSize(random(minText,maxText));
    text("snare",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    snare = minim.loadFile("snare.wav");
    snare.play();
    i++; 
  }
}

//active when 'j' key is pressed
void functionJ() {
  if (i < x) {
    fill(palette[1]);
    textSize(random(minText,maxText));
    text("hhClosed",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    hhClosed = minim.loadFile("hhClosed.wav");
    hhClosed.play();
    i++; 
  }
}

//active when 'k' key is pressed
void functionK() {
  if (i < x) {
    fill(palette[2]);
    textSize(random(minText,maxText));
    text("hhOpen",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    hhOpen = minim.loadFile("hhOpen.wav");
    hhOpen.play();
    i++; 
  }
}

//active when 'l' key is pressed
void functionL() {
  if (i < x) {
    fill(palette[3]);
    textSize(random(minText,maxText));
    text("ride",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    ride = minim.loadFile("ride.wav");
    ride.play();
    i++; 
  }
}

//active when ';' key is pressed
void functionColon() {
  if (i < x) {
    fill(palette[4]);
    textSize(random(minText,maxText));
    text("crash",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    crash = minim.loadFile("crash.wav");
    crash.play();
    i++; 
  }
}

//erases screen
void erase(){
  background(palette[0]);
  image(bg,0,0);
  i = 0;
  key();  
}

//keyboard input
void keyReleased(){
  if (key=='a' || key=='A') functionA();
  if (key=='s' || key=='S') functionS();
  if (key=='d' || key=='D') functionD(); 
  if (key=='f' || key=='F') functionF();  
  if (key=='j' || key=='J') functionJ();
  if (key=='k' || key=='K') functionK();
  if (key=='l' || key=='L') functionL(); 
  if (key==';' || key==':') functionColon();  
 
  if (key == 'r' || key == 'R') erase();
  if (key == 'c' || key == 'C') saveFrame("screenCapture.png");
}


