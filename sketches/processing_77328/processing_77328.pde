
import ddf.minim.*;
AudioPlayer music;
Minim minim;

PImage[] images = new PImage[4];

float rockx = 0;
float rocky = 0;
float paperx = 0;
float papery = 0;
float scissorsx = 0;
float scissorsy = 0;

float mxrock;
float myrock;
float mxpaper;
float mypaper;
float mxscissors;
float myscissors;

float dist1;
float dist2;
float dist3;
float dist4;
float dist5;
float dist6;

void setup() {
  size(600, 600);
  smooth();
  
  images[0] = loadImage("ring.png");
  images[1] = loadImage("rock.png");
  images[2] = loadImage("paper.png");
  images[3] = loadImage("scissors.png");
  
  mxrock = random(-5, 5);
  myrock = random(-5, 5);
  mxpaper = random(-5, 5);
  mypaper = random(-5, 5);
  mxscissors = random(-5, 5);
  myscissors = random(-5, 5);
  
  rockx = random(25, 575);
  rocky = random(25, 575);
  paperx = random(25, 575);
  papery = random(25, 575);
  scissorsx = random(25, 575);
  scissorsy = random(25, 575);
  
  minim = new Minim(this);
  music = minim.loadFile("music.wav", 1024);
  music.loop();
}

void draw() {
  image(images[0], 0, 0);
  
 
  /////rock\\\\\
  rockx = rockx + mxrock;
  rocky = rocky + myrock;
  fill(255, 0, 0);
  image(images[1], rockx, rocky);
    if(rockx > 500 || rockx < 0) {
      mxrock = -mxrock;
    }
    if(rocky > 500 || rocky < 0) {
      myrock = -myrock;
    }
   
  
  dist1 = dist(rockx, rocky, paperx, papery);
    if(dist1 < 100) {
      mxrock = -mxrock;
      myrock = -myrock;
    }  
  

    if(rockx > scissorsx) {
      rockx = rockx - 1;
    } else {
      rockx = rockx + 1;
    }
    if(rocky > scissorsy) {
      rocky = rocky - 1;
    } else {
      rocky = rocky + 1;
    }
    
  /////paper\\\\\ 
  paperx = paperx + mxpaper;
  papery = papery + mypaper;
  fill(0, 255, 0);
  image(images[2], paperx, papery);
    if(paperx > 500 || paperx < 0) {
      mxpaper = -mxpaper;
    }
    if(papery > 500 || papery < 0) {
      mypaper = -mypaper;
    }
  
  
  dist4 = dist(paperx, papery, scissorsx, scissorsy);
    if(dist4 < 100) {
      mxpaper = -mxpaper;
      mypaper = -mypaper;
    }
  
  if(paperx > rockx) {
    paperx = paperx - 1;
  } else {
    paperx = paperx + 1;
  }
    
  /////scissors\\\\\
  scissorsx = scissorsx + mxscissors;
  scissorsy = scissorsy + myscissors;
  fill(0, 0, 255);
  image(images[3], scissorsx, scissorsy);
    if(scissorsx > 500 || scissorsx < 0) {
      mxscissors = -mxscissors;
    }
    if(scissorsy > 500 || scissorsy < 0) {
      myscissors = -myscissors;
    }
    
    
  dist5 = dist(scissorsx, scissorsy, rockx, rocky);
    if(dist5 < 100) {
      mxscissors = -mxscissors;
      myscissors = -myscissors;
    }
 
    
    if(scissorsx > paperx) {
      scissorsx = scissorsx - 1;
    } else {
      scissorsx = scissorsx + 1;
    }
}

