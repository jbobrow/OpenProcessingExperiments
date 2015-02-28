
// Madeline Chan mchan1@andrew.cmu.edu
// Copyright 2013 MChan
// Homework 5

void setup()
{
  size (displayWidth, displayHeight);
}

void draw ( )
{
  Jim (200, 200, 200, 200);
}

void mouseDragged()
{
  Jim(mouseX, mouseY, pmouseX, pmouseY);
}


void Jim (float x, float y, float wd, float ht)
{
// Madeline Chan mchan1@andrew.cmu.edu
//Copyright 2013 Madeline Chan
// Homework 2 : 1130AM T/Th
 
//size (400, 400);
background (255, 218, 185);
// variables
 
//float x = 200;
//float y = 200;
 
//float wd = 200;
//float ht = 200;
 
//Face
noFill();
noStroke();
ellipse (x, y, wd, ht);
 
//Mouth
stroke(255, 192, 203);
strokeWeight(2);
fill(255, 228, 225);
ellipse (x-wd*.01, y+ht*.6, wd*.2, ht*.1);
 
//Eyes
noStroke();
fill(255, 255, 255);
ellipse (x-wd*.2, y+ht*.01, wd*.05, ht*.05);
ellipse (x+wd*.2, y+ht*.01, wd*.05, ht*.05);
fill(135, 206, 250);
ellipse (x-wd*.2, y+ht*.01, wd*.03, ht*.03);
ellipse (x+wd*.2, y+ht*.01, wd*.03, ht*.03);
 
//Glasses
strokeWeight(2);
stroke(70);
fill(224, 255, 255, 60);
ellipse (x-wd*.2, y+ht*.01, wd*.3, ht*.3);
ellipse (x+wd*.2, y+ht*.01, wd*.3, ht*.3);
rect(x-ht*.1, y+ht*.01, wd*.2, ht*.01);
 
//Eyebrows
fill(169, 169, 169, 40);
noStroke();
rect(x-ht*.4, y-ht*.1, wd*.2, ht*.06);
rect(x+ht*.2, y-ht*.1, wd*.2, ht*.06);
 
//Nose
stroke(1);
strokeWeight(1);
noFill();
arc(x, y+ht*.2, wd*.3, ht*.2, radians(5), radians(185));
 
//Nostrils
noStroke();
fill(0, 0, 0, 90);
ellipse (x-wd*.05, y+ht*.29, wd*.02, ht*.02);
ellipse (x+wd*.05, y+ht*.29, wd*.02, ht*.02);
 
//Mousetache
fill(211, 211, 211);
noStroke();
ellipse(x-wd*.01, y+ht*.45, wd*.9, ht*.2);
fill(255, 218, 185);
rect(x-ht*.4, y+ht*.5, wd*.8, ht*.1);
 
//right squiggle
fill(255,250,250,60);
stroke(0,0,0, 30);
beginShape();
  curveVertex(x-.2*wd, y+.2*ht);
  curveVertex(x+.2*wd, y+.5*ht);
  curveVertex(x+.3*wd, y+.4*ht);
  curveVertex(x+.4*wd, y+.5*ht);
  curveVertex(x+.5*wd, y+.2*ht);
endShape();
 
//left squiggle
beginShape();
  curveVertex(x-.8*wd, y+.2*ht);
  curveVertex(x-.4*wd, y+.5*ht);
  curveVertex(x-.3*wd, y+.4*ht);
  curveVertex(x-.2*wd, y+.5*ht);
  curveVertex(x-.1*wd, y+.2*ht);
endShape();
 
//middle squiggle
beginShape();
  curveVertex(x-.1*wd, y+.2*ht);
  curveVertex(x, y+.5*ht);
  curveVertex(x+.1*wd, y+.4*ht);
  curveVertex(x+.2*wd, y+.5*ht);
  curveVertex(x+.3*wd, y+.2*ht);
endShape();
 
beginShape();
  curveVertex(x-.1*wd, y+.2*ht);
  curveVertex(x, y+.5*ht);
  curveVertex(x-.1*wd, y+.4*ht);
  curveVertex(x-.2*wd, y+.5*ht);
  curveVertex(x-.3*wd, y+.2*ht);
endShape();
 
}


