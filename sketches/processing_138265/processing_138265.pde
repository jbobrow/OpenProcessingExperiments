
/*
  - Hitting either ASDF JKL: produces a visual representaion of that key as well as a specific sound.
  - I created a background image that is transparent on the top so that I could 
    choose my color pallete with in the app itself.
  - In addition to the letters each time one the the designated keys are pressed an ellipse appears on
    the screen. The app runs until the ellipse reach the end of the screen. 
  - The r key can be hit to reset the app.
  - The c key can be hit to save a screee capture.
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
AudioPlayer sound01;
AudioPlayer sound02;
AudioPlayer sound03;
AudioPlayer sound04;
AudioPlayer sound05;
AudioPlayer sound06;
AudioPlayer sound07;
AudioPlayer sound08;

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
    text("A",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound01 = minim.loadFile("01.wav");
    sound01.play();
    i++; 
  }
}

//active when 's' key is pressed
void functionS() {
  if (i < x) {
    fill(palette[2]);
    textSize(random(minText,maxText));
    text("S",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound02 = minim.loadFile("02.wav");
    sound02.play();
    i++; 
  }
}

//active when 'd' key is pressed
void functionD() {
  if (i < x) {
    fill(palette[3]);
    textSize(random(minText,maxText));
    text("D",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound03 = minim.loadFile("03.wav");
    sound03.play();
    i++; 
  }
}

//active when 'f' key is pressed
void functionF() {
  if (i < x) {
    fill(palette[4]);
    textSize(random(minText,maxText));
    text("F",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound04 = minim.loadFile("04.wav");
    sound04.play();
    i++; 
  }
}

//active when 'j' key is pressed
void functionJ() {
  if (i < x) {
    fill(palette[1]);
    textSize(random(minText,maxText));
    text("J",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound05 = minim.loadFile("05.wav");
    sound05.play();
    i++; 
  }
}

//active when 'k' key is pressed
void functionK() {
  if (i < x) {
    fill(palette[2]);
    textSize(random(minText,maxText));
    text("K",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound06 = minim.loadFile("06.wav");
    sound06.play();
    i++; 
  }
}

//active when 'l' key is pressed
void functionL() {
  if (i < x) {
    fill(palette[3]);
    textSize(random(minText,maxText));
    text("L",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound07 = minim.loadFile("07.wav");
    sound07.play();
    i++; 
  }
}

//active when ';' key is pressed
void functionColon() {
  if (i < x) {
    fill(palette[4]);
    textSize(random(minText,maxText));
    text(":",random(width),random(0,600));
    ellipse(20+i*randomEllipse,625,randomEllipse,randomEllipse);
    sound08 = minim.loadFile("08.wav");
    sound08.play();
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


