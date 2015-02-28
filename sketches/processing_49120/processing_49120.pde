

// Zap-me-not
// By Sergei Larionov
// Data Visualizations, University of Washington, Winter 2012

import ddf.minim.*;
AudioPlayer player;
Minim minim;

float xpos;
float ypos;
int swidth= 100;
int sheight=100;
int detect;
float x;
float y;
float n;


void setup() {

  size (640, 480);

  minim = new Minim(this);
  player = minim.loadFile("zap.wav", 2048);


  background (0);
  strokeWeight (3);
  xpos = width/2;
  ypos = height/2;
  frameRate (50);
}

void draw () {

  background (0);
  fill (0);
  stroke (255); 

  // If mouseOver start laughing
  if (abs(mouseX - xpos) < swidth &&
    abs(mouseY - ypos) < sheight) {
    xpos = xpos+ int (random (-5, +5));
    ypos = ypos+ int (random (-5, +5));
    legs ();
    laughing ();
    head ();
    mouth ();
    player.play();
  }  
  else {

    legs ();
    standing ();
    head ();
    player.pause();
  }
}

void laughing () {

  //Left 
  beginShape ();
  vertex(xpos, ypos-40);
  vertex(xpos-68, ypos-40);
  vertex(xpos-68, ypos-17);
  vertex(xpos-50, ypos-17);
  vertex(xpos-50, ypos-22);
  vertex(xpos-20, ypos-22);
  vertex(xpos-20, ypos-10);
  endShape ();

  //Right
  beginShape ();
  vertex(xpos, ypos-40);
  vertex(xpos+68, ypos-40);
  vertex(xpos+68, ypos-17);
  vertex(xpos+50, ypos-17);
  vertex(xpos+50, ypos-22);
  vertex(xpos+20, ypos-22);
  vertex(xpos+20, ypos-10);
  endShape ();
}  


void standing () {

  //Left
  beginShape ();
  vertex(xpos, ypos-40);
  vertex(xpos-35, ypos-40);
  vertex(xpos-35, ypos+30);
  vertex(xpos-15, ypos+30);
  vertex(xpos-15, ypos+10);
  vertex(xpos-20, ypos+10);
  vertex(xpos-20, ypos-10);
  vertex(xpos-15, ypos-10);
  endShape ();

  //Right
  beginShape ();
  vertex(xpos, ypos-40);
  vertex(xpos+35, ypos-40);
  vertex(xpos+35, ypos+30);
  vertex(xpos+15, ypos+30);
  vertex(xpos+15, ypos+10);
  vertex(xpos+20, ypos+10);
  vertex(xpos+20, ypos-10);
  vertex(xpos+15, ypos-10);
  endShape ();
}

void legs () {

  //Left
  beginShape ();
  vertex(xpos-20, ypos-10);
  vertex(xpos-20, ypos+60);
  vertex(xpos, ypos+60);
  endShape ();

  //Right
  beginShape ();
  vertex(xpos+20, ypos-10);
  vertex(xpos+20, ypos+60);
  vertex(xpos, ypos+60);
  vertex(xpos, ypos+30);
  endShape ();
}

void head () {

  //Head
  rectMode(CENTER);
  rect (xpos, ypos-50, 30, 30);

  //Eyes
  rect (xpos-6, ypos-54, 6, 6);
  rect (xpos+5, ypos-54, 6, 6);
}

void mouth () {

  rectMode(CORNER);

  //Mouth
  noStroke();
  fill (255);
  rect (xpos-9, ypos-45, 19, 7);

  // Teeth
  fill (0);
  rect (xpos-9, ypos-42, 19, 1);
  rect (xpos-6, ypos-45, 1, 7);
  rect (xpos-2, ypos-45, 1, 7);
  rect (xpos+2, ypos-45, 1, 7);
  rect (xpos+6, ypos-45, 1, 7);
}






