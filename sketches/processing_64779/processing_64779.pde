
import netscape.javascript.*;
import ddf.minim.signals.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
 
 PFont f;
    PFont t;


//Josephine Gibbs_z3189816_week6_project1
//Josephine Gibbs was redrawing the Open processing's zoorg character, 
//to show how as individuals we create our own sphere of influence. This
//character communicates by putting a ring around herself.


//Move the mouse to make Zoorgette talk in her language.
//You can create random rays configurations ofradiating lines generated by Zoorgette's eyes.

//This sketch is the development of my assignment titled, "First contact." 
//I wanted to push this further by adding sound at the start, 
//weird computer music will play and a key is pressed to stop it.
//5 April 2011
//After /**
 // Get Line Out
 // by Damien Di Fede.
 //Minim minim;
//AudioOutput out;
//SineWave sine;

void setup() {
  size(400,400,P2D);
  smooth();
  frameRate(10);
 
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder everytime the mouse is pressed
  song = minim.loadFile("computer.wav");
  song.play();
}
 
 
void stop()
{
  song.loop();
  minim.stop();
 
  super.stop();
}
// draw() loops continuously until you close the sketch window.
void draw() {
  // Load space background
   PImage b;
  b = loadImage("space_window.jpg");
  smooth();
  // draw lights
lights();
//Draw background
background(345,90, 10, 268);
  // Draw Zoorgette's spaceship
  camera(30.0, mouseY, 220.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  // Set CENTER mode
  // Draw Zoorgette's spaceship
  // Set CENTER mode
  //Now keep drawing the circles when the line out is emitted
  //if mousePressed (mouseX, mouseY);
  
  ellipseMode(CENTER);
  rectMode(CENTER); 
 
  // Draw Zoorgette's arms
  fill(155,23,89, 235);
  ellipse(190,245, 20, 50);
  ellipse(210,245, 20, 50);
  
  // Draw Zoorgette's hands
  fill(105,120,37, 345);
  ellipse(190,270, 10, 10);
  ellipse(210,270, 10, 10);
  
  //ellipse yellow hair
  fill(398,345,7, 470);
  ellipse(200,210,70,90);
  
  // Draw Zoorgette's body
  fill(155,23,89, 89);
  ellipse(200,270,20,100);
  
 // Draw Zoorgette's neck
  stroke(255);
  fill(30, 47, 498, 98);
  ellipse(200,200,28,58);
  
  // Draw Zoorgette's head
  stroke(255);
  fill(105,120,37, 568);
  ellipse(200,190,28,38);

 //Draw Zoorgette's mouth
 stroke(255,12,37);
 fill(255,12,37);
 ellipse(200,200, 10, 4);

  // Draw Zoorgette's eyes
  fill(0); 
  ellipse(193,185,12,9); 
  ellipse(207,185,12,9);
  
  //Draw Zoorgette's eyeballs
   fill(255); 
  ellipse(191,185,2,2); 
  ellipse(209,185,2,2);

  // Draw Zoog's legs
  stroke(0);
  ellipse(190,320,20,10);
  ellipse(210,320,20,10);

  stroke(0);
  //int x = abs(mouseX - mouseY);
  strokeWeight(abs(mouseX - mouseY));
  // Draw a line from previous mouse location to current mouse location.
  rotate(pmouseX, pmouseY,400,400);
//continue emitting line out circle waves
 minim = new Minim(this);
  
  // get a line out from Minim, default sample rate is 44100, default bit depth is 16
  //out = minim.getLineOut(Minim.STEREO, 2048);
  
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate 44100 to match the line out
  //sine = new SineWave(440, 0.5, out.sampleRate());
  // add the oscillator to the line out
  //out.addSignal(sine);
}
//}
//void stop()
{
  // always close Minim audio classes when you are done with them
  //out.close();
  //minim.stop();

  //super.stop();
}
void mousePressed() {
//press the mouse to kill Zoorgette with a red cross in case she's a bloodsucking monster.
//Hit her right in the eye
 minim = new Minim(this);
 
  // this loads mysong.wav from the data folder everytime the mouse is pressed
  song = minim.loadFile("computer.wav");
  if(mousePressed) {
    stroke(255, 28, 40, random(0, 450));
  } else {
    stroke(0);

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
 ellipse(mouseX, mouseY-15, mouseX, mouseY+15);
 if(mousePressed) {
arc(50, 55, 50, 50, 0, PI/2);
noFill();
arc(50, 55, 60, 60, PI/2, PI);
arc(50, 55, 70, 70, PI, TWO_PI-PI/2);
arc(50, 55, 80, 80, TWO_PI-PI/2, TWO_PI);
 } 
}



