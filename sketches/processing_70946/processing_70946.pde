
/*****************************************
 * Assignment 02
 * Name:         Angela Mastrianni
 * E-mail:       amastriann@brynmawr.edu  
 * Course:       CS 110 - Section 01
 * Submitted:    09/18
 * 
 * This file contains my interactive sketch of an ocean. The background contains random bubbles, a sea floor, seaweed and jellygfish. 
   Clicking the mouse in different locations will create different colored fish that change size and location based upon location. 
   When a key is pressed, the screen is cleared and the background reappears with different random bubbles.
 ***********************************************/

//set variables
float r;
float g;
float b;

float diam;
float x;
float y;
float jellyLegs;
float finTop; 
float finHeight;
float finRight;
float finLeft;
float tailFin;
float oppositeFinleft;
float oppositeFinright;
float oppositeFinheight;
float oppositeTailfin;

//set up ocean background
void setup () {
  size(500, 500);
  drawBackground();
}

void draw () {
}

//clear background
void keyPressed () {
  drawBackground();
}

void drawBackground() {
  // Draw ocean
  background(0, 0, 200);
  //add bubbles
  while (x < 500) {
    stroke(0);
    strokeWeight(1);
    diam=random(50);
    x=x+6;
    y=random(height);
    fill(0, random(200, 255), random(200, 255));
    ellipse(x, y, diam, diam);
  }
  x=0;
  //add sea floor
  fill(random(100,120), random(50,70), 0);
  rect(0, 450, 500, 50);
  bezier(0, 454, 141, 380, 376, 414, 491, 450);
  //add seaweed
  fill(0, random(150,220), 0);
  bezier(390, 458, 387, 344, 303, 333, 390, 454);
  bezier(390, 458, 484, 410, 450, 345, 390, 454);
  bezier(390, 458, 455, 343, 385, 308, 390, 454);
  //add baby jellyfish
  fill(random(90,100), 0, random(200,220));
  stroke(105, 0, 212);
  strokeWeight(3);
  int x=30;
  while (x<70) {
    line(x, 435, x, 455);
    x=x+5;
  }
  stroke(0);
  strokeWeight(1);
  ellipse(48, 430, 42, 30);
  fill(0);
  ellipse(40, 425, 5, 5);
  ellipse(56, 425, 5, 5);
  arc(48, 430, 28, 22, 0.041, 3.067);
  //add big jellyfish
  fill(random(90,100), 0, random(200,220));
  stroke(105, 0, 212);
  strokeWeight(3);
  int jellyLegs =320;
  while (jellyLegs <410) {
    line(jellyLegs, 150, jellyLegs, 200);
    jellyLegs=jellyLegs+10;
  }
  ellipse(360, 150, 100, 50);
  fill(0);
  ellipse(340, 140, 10, 10);
  ellipse(380, 140, 10, 10);
  arc(360, 150, 56, 46, 0.043, 3.121);
}


//add fish that change direction based on location
void mousePressed () {
  r=random(0, 255);
  g=random(0, 255);
  b=random(0, 255);
  finHeight= mouseY-50;
  finRight=mouseX+30;
  finLeft=mouseX-50;
  oppositeFinheight= mouseY+50;
  oppositeFinright= mouseX-30;
  oppositeFinleft= mouseX+50;
  tailFin= mouseX+70;
  oppositeTailfin= mouseX-70;
  stroke(0);
  strokeWeight(1);  
  if (mouseY>250) {
    fill(r, g, b);
    triangle(finLeft, mouseY, finRight, finHeight, finRight, mouseY);
    triangle(oppositeFinleft, mouseY, tailFin, oppositeFinheight, tailFin, finHeight);
    ellipse(mouseX, mouseY, 100, random(50, 70)); 
    fill(0);
    ellipse(mouseX-25, mouseY-5, 10, 10);
  } 
  else {
    fill(r, g, b);
    triangle(oppositeFinleft, mouseY, oppositeFinright, finHeight, oppositeFinright, mouseY);
    triangle(finLeft, mouseY, oppositeTailfin, oppositeFinheight, oppositeTailfin, finHeight);
    ellipse(mouseX, mouseY, 100, random(20, 40)); 
    fill(0);
    ellipse(mouseX+25, mouseY-5, 10, 10);
  }
}


