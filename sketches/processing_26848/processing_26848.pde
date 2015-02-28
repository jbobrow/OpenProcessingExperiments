
//white surround PImages
PImage white1;
PImage white2;
PImage white3;
PImage white4;
PImage white5;
PImage white6;
PImage white7;

PImage trial;


import processing.video.*;
Movie movie;


void setup(){
  size(750,495);
  noStroke();
  
  //load white surround images
  white1 = loadImage("white1.png");
  white2 = loadImage("white2.png");
  white3 = loadImage("white3.png");
  white4 = loadImage("white4.png");
  white5 = loadImage("white5.png");
  white6 = loadImage("white6.png");
  white7 = loadImage("white7.png");
  
//trial
trial = loadImage("trial.png");
  
  frameRate(1);
  
}

void draw(){
  background(255,193,112);

 


  
  



