
//Homework #3, Section A
//Copyright Miranda Jacoby 2014 All Rights Reserved
//Contact: majacoby@andrew.cmu.edu
 
 
//Setting variables

float x;
float y;
float wd;
float ht;
float xDist;
float yDist;
float dx; 
float dy;
float easingCoef;
float ran;

void setup() {
  size(400, 400);
  smooth();
  background(0);
} 
 
 void draw() {
  //variable values and the bits that makes easing work
  x = dx;
  y = dy;
  wd = 100;
  ht = 100;
  xDist = mouseX - x;
  yDist = mouseY - y;
  easingCoef = .05;
  dx = x + xDist *easingCoef;
  dy = y + yDist *easingCoef;
  ran = random(255);
 

  //opacity
  fill(0, 10);
  rectMode(CORNER);
  rect(0, 0, width, height);
  
  //invisible cursor
  //noCursor();
   
  //Nathan's Face (Sorry Jim!)
  noStroke();
  fill(237, 204, 172);
   
  //hair
  fill(70, 14, 4);
  ellipse(  x + wd,  y + ht *.65,  wd,  .45 * ht);
  ellipse(  x + wd,  y + ht *.85,  wd,  .45 * ht);
  ellipse(  x + wd,  y + ht *.95,  wd,  .45 * ht);
   
  //ears
  fill(237, 204, 172);
  ellipse(  x + wd *.55,  y + ht,  .15 * wd,  .15 * ht);
  ellipse(  x + ht *1.45,  y + ht,  .15 * wd,  .15 * ht);
   
  //beard
  fill(70, 14, 4);
  ellipse(  x + wd,  y + ht *1.15,  wd,  ht);
   
  //face base
  fill(237, 204, 172);
  rectMode(CENTER);
  rect(  x + wd,  y + ht,  .80 * wd,  .80 * ht,  .30 * wd);
   
  //tuft of hair (on top of face)
  ellipseMode(CENTER);
  fill(70, 14, 4);
  ellipse(  x + wd,  y + ht *.75,  .75 * wd,  .35 * ht);
   
  //eyes
  fill(0);
  ellipse(  x + wd *.80,  y + ht,  .07 * wd,  .20 * ht);
  ellipse(  x + wd *1.20,  y + ht,  .07 * wd,  .20 * ht);
   
  //nose (Initial "J" from my last name, Jacoby)
  stroke(234, 140, 141);
  strokeWeight(5);
  noFill();
   
  beginShape();
  curveVertex(  x + wd,  y + ht *.25);
  curveVertex(  x + wd,  y + ht *.95);
  curveVertex(  x + wd *.95,  y + ht *1.17);
  curveVertex(  x + wd *.25,  y + ht);
  endShape();
   
  //mouth
  stroke(0);
  strokeWeight(3);
  curve(   x + wd *.90,  y + ht,  x + wd *.90,  y + ht *1.25,  x + wd *1.10,  y + ht *1.25,  x + wd *1.10, y + ht);
   
  //bounding circle (Includes initial "J" and most of Nathan's face)
  //ellipse(  x + wd,  y + ht,  wd,  ht);
 }
 
 //pressing the mouse and keys does stuff with random numbers! 
 void keyPressed () {
   background(ran); 
 }
 
 void mousePressed () {
  noStroke();
  fill(ran);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY, ran, ran);
 }
 


