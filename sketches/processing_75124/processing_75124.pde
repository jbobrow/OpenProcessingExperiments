
/*
Add Listener code originally created by Damien Di Fede.
*/

import ddf.minim.*;
Minim minim;
AudioPlayer menu; // paint;




//
float r = random(255);
float g = random(255);
float b = random(255);

float i = 0; 

void setup()
{
  //Window size.
  size(640, 240);
  smooth (); noStroke(); background(255,255,255);
  
  //Menu sound.
  minim = new Minim(this);
  menu = minim.loadFile("ToyPaint.wav", 512);
  menu.loop();
}

void draw()
{


//
  if(mousePressed && (mouseButton == LEFT))
  { 
 fill(r,g,b);
 rect(mouseX, mouseY, 25,25);
  }
  
//
 if(mousePressed && (mouseButton == RIGHT))
 {
 fill(r,g,b);

 triangle
 (pmouseX + 50, pmouseY + 50,30,30,15,15);
 }

//
  if(mousePressed && (mouseButton == CENTER))
  { 
  fill(r,g,b);
  ellipse(mouseX, mouseY, 50,50);
  }

//     
//color randomizer
 if(keyPressed && (key == 'r'))
 {
r = random(255);
g = random(255);
b = random(255);
 }
  if(keyPressed && (key == 'd'))
  { background(255,255,255);}
}

