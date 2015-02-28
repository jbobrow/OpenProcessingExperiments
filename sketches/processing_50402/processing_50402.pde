
/**********************************
* Assignment 1
* Name:     Bingxi Lin
* E-mail:   blin@brynmawr.edu
* Course:   CS 110 - Section 2
* Submitted:1/26/2012
* 
*
* This sketch is a potrait of me writing code for 
* my Intro to Computing class.
*
***********************************/


void setup(){
  size(600,600);
  background(255);
  smooth();
  
  //the head
  fill(248,153,58);
  ellipseMode(CENTER);
  ellipse(280,150,100,100);
  
  //the eye
  fill(255);
  ellipse(245,150,25,12);
  fill(0);
  ellipse(241,152,12,10);
  
  //the eyebrow
  fill(248,153,58);
  arc(260,130,20,15,PI/2,PI);
  
  //the open mouse~
  fill(255);
  stroke(255);
  beginShape();
  curveVertex(180,160);
  curveVertex(275,170);
  curveVertex(215,200);
  curveVertex(230,50);
  endShape(CLOSE);
  
  //the neck
  fill(248,153,58);
  stroke(0);
  triangle(280,200,275,215,285,215);
  
  //the body
  fill(11,139,17);
  quad(275,215,285,215,300,360,225,360);
  
  //the laptop
  fill(34,34,200);
  quad(220,355,217,360,137,350,134,345);
  quad(130,345,125,340,85,265,90,265);
  
  //the arm
  fill(0);
  curve(350,185,280,225,180,340,120,400);
  
  //the hand
  fill(248,153,58);
  ellipse(173,340,18,10);
  
  //the leg
  line(275,368,165,356);
  line(165,356,150,490);
  //the shoe
  fill(157,87,35);
  ellipse(135,490,38,16);
  
  //the chair
  fill(150);
  rect(228,372,70,125);
  
  //her thought
  fill(255,0,0);
  textSize(30);
  textAlign(RIGHT);
  text("OMG... ", 503, 200);
  textSize(26);
  text("CS homework", 535, 240);
  text("is due in an hour!!!", 580,280);
}






