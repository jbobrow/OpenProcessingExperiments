
//Homework 2.2.1_Parametric Lab
//Created by Adrianne Blossom
//September 4, 2011

//This code creates a parametric object where the mouse movement controls how the rectangular figures move about the central, stationary square.

void setup(){
  size(300,300);
  background(237,245,25);
  println();
}

float width=300;

float height=300;

float x=0;

void draw(){
  noStroke();
  background(237,245,25); //Allows me to maintain yellow background without path trails.
  
  stroke(255,0,0); //Commands for 12 lines. First 2 sets are red and the last is green.
  strokeWeight(5);
  line(250,100,250,200);
  line(50,100,50,200);
  line(100,50,200,50);
  line(100,250,200,250);
  
  line(260,100,260,200);
  line(40,100,40,200);
  line(100,40,200,40);
  line(100,260,200,260);
  
  stroke(6,106,25);
  strokeWeight(5);
  line(270,100,270,200);
  line(30,100,30,200);
  line(100,30,200,30);
  line(100,270,200,270);
  
  noStroke();
  rectMode(CENTER);
  fill(36,11,80);
  rect(width/2,height/2,100,100); //Center square figure.
  
  fill(162,162,162);
  rect(mouseX,height/4,100,25); //This line and the next 3 are the commands for the moving rectangles.
  rect(width-mouseX,height-75,100,25);
  rect(3*width/4,mouseY,25,100);
  rect(width/4,height-mouseY,25,100);
  
  fill(255,255,255);
  rect(width-225,height-225,25,25); //This line and the following in this set are for the small squares.
  rect(width-75,height-75,25,25);
  rect(3*width/4,height-225,25,25);
  rect(width/4,height-75,25,25);
}



