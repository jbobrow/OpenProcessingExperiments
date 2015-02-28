
//import processing.opengl.*;
//import minim library

//Josephine Gibbs_z3189816_week6_project1_6-9Tues
//Josephine Gibbs was redrawing the Open processing's zoorg character, 
//to show how as individuals we create our own sphere of influence. This
//character communicates by putting a ring around herself.


//Move the mouse to make Zoorgette talk in her language of rings.
//You can create random ring configurations generated by Zoorgette's eyes.
//If you are hstile to what she says, fire a cross laser is fired at her.
//By pressing the mouse, a cross laser is fired at Zorgette.
//Move the mouse to interface with Zoorgette.
//This drawing is called "First contact."
//2 April 2011, revised First Contact version 9, 5 April 2011
//revised with sound on 8April 2011 
//from http://code.compartmental.net/tools/minim/manual-audiosample/
//import netscape.javascript.*;
//one other thing if the sound still don't work read this
//http://processing.org/learning/library/loadsnippet.html
//You might have to download an windows or mac audio converter. 
//Download some free snippets of sound effects in mp3 or wav format.
//most importantly you need to import the sound library 
//also known as 'minim' see below.
//This means you need to reset the memory to higher settings.
//I had mine previously @500mb, had to increased it to @1000mb.
import netscape.javascript.*;
import ddf.minim.signals.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
    PFont f;
    PFont t;
    
void setup() {
  size(400,400);
    smooth();
    
    frameRate(5);
    
 
 
    f = loadFont("Bauhaus93-9.vlw");
    t = loadFont("Braggadocio-12.vlw");
    fill(0,0,255);
    textFont(f,60);
    textAlign(CENTER);
    text("Greetings.", width/2, height/12);
    text("Answer!", width/3, height/6 + 60);
     minim = new Minim(this);
     song = minim.loadFile("computer.wav");
  song.play();
}
 
 
void stop()
{
  song.loop();
  minim.stop();
 
  super.stop();
}

float Mspeed;

 // b = loadImage("space_window.jpg");

// draw() loops continuously until you close the sketch window.
void draw() {
  // draw lights
lights();
//Draw background
background(345,90, 10, 268);
f = loadFont( "AmericanTypewriter-12.vlw" ); 
  textFont(f,16); 
  background(0);
  fill(mouseX, 688, mouseY, 289); 
text("Summon your archpriestess, Gaian.");  
 minim = new Minim(this);
     song = minim.loadFile("computer.wav");
  song.play();
  //Display text
  text ( "If not, meet your doom!",mouseX,mouseY); 
  // Draw Zoorgette's spaceship
   minim = new Minim(this);
     song = minim.loadFile("computer.wav");
  song.play();
  camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  // Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER); 

  // Draw Zoorgette's arms
  fill(155,23,89, 50);
  ellipse(190,245, 20, 50);
  ellipse(210,245, 20, 50);

  // Draw Zoorgette's hands
  fill(105,120, 37, random(0,136));
  ellipse(190,270, 10, 10);
  ellipse(210,270, 10, 10);

  //ellipse yellow hair
  fill(398,345, random(mouseX), 470);
  ellipse(200,210,70,90);

  // Draw Zoorgette's body
  fill(155,23, 89, 239);
  ellipse(200,270,20,100);

  // Draw Zoorgette's neck
  stroke(255);
  fill(30, 47, 498);
  ellipse(200,200,28,58);

  // Draw Zoorgette's head
  stroke(255);
  fill(105,120,37, random(0, 136));
  ellipse(200,190,28,38);

  //Draw Zoorgette's mouth
  stroke(255,12,37);
  fill(255,12,37);
  ellipse(200,200, 10, 4);

  // Draw Zoorgette's eyes
  fill(0, random(mouseX,mouseY)); 
  ellipse(193,185,12,9); 
  ellipse(207,185,12,9);

  //Draw Zoorgette's eyeballs
  fill(255,random(mouseX, mouseY)); 
  ellipse(191,185,2,2); 
  ellipse(209,185,2,2);

  // Draw Zoog's legs
  stroke(0, 356, 10, 45);
  ellipse(190,320,20,10);
  ellipse(210,320,20,10);

  stroke(30, 35, 190, 455);
  //int x = abs(mouseX - mouseY);
  strokeWeight(abs(mouseX - mouseY));
  // Draw a line from previous mouse location to current mouse location.
 // rotate();
}
void mousePressed() {
//press the mouse to kill Zoorgette with a red cross in case she's a bloodsucking monster.
//Hit her right in the eye
 if(mousePressed) {
    stroke(255, 28, 40, random(0, 450));
     minim = new Minim(this);
     song = minim.loadFile("laser_1.wav");
  song.play();
    
  } else {
    stroke(0);
    //display text PFont again
    
    PFont
    f = loadFont("Bauhaus93-9.vlw");
    t = loadFont("Braggadocio-12.vlw");
    fill(0,0,255);
    textFont(f,60);
    textAlign(CENTER);
    text("Greetings Earthling", width/2, height/12);
    text("Answer!", width/3, height/6 + 60);
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66);
   minim = new Minim(this);
     song = minim.loadFile("computer.wav");
  song.play();
 //ellipse(mouseX, mouseY-15, mouseX, mouseY+15);
 if(mousePressed) {
//arc(50, 55, 50, 50, 0, PI/2);
noFill();
//arc(150, 155, 260, 260, PI/2, PI);
//arc(150, 155, 270, 270, PI, TWO_PI-PI/2);
//arc(150, 155, 280, 280, TWO_PI-PI/2, TWO_PI);
 } 
}




