
//code barrowed from MonitorInput Processing Example
//PImage mario_pic; //declare image variable
//PImage SpaceInvader_pic;

import ddf.minim.*;

Minim minim;
AudioInput in;


PImage Gage;
void setup() {
  
  size(800,800,P3D); //P3D will utilize graphics chip to process information: runs faster
  //mario_pic = loadImage("M0.gif");
  //SpaceInvader_pic = loadImage("SpaceInvader.gif");
  Gage = loadImage("Gage.gif");
  //setup the sketch
  //background(0);
  
  //Initialize Library
  minim = new Minim(this); //using library
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn(); //gets audio microphone input
  
  
  noStroke();
  //rectMode(CENTER);
  smooth();
}


void draw() {
  background(0);
  //image(mario_pic, 0, 0, width, height);
  
  //mario_pic.loadPixels(); //designate memory space for the image
  Gage.loadPixels();
  for(int y=0; y<Gage.height; y++) { //scans image y axis
    for(int x=0; x<Gage.width; x++) { //scans image x axis
      color picColor = Gage.get(x,y); //collects the rgba values from the image
      fill(picColor);
      
      float modifier = in.left.get((y*32+x)%1024)*50; //modify size based on audio input
      
      rect(x*width/32, y*height/32,modifier*width/32,modifier*height/32); //pixilized image!! it draws it from the color information collected
      
    }
  }
  
 /* for(int i = 0; i<width; i++) {
    for(int j = 1; j<height; j++) {
      float modifier = in.left.get((i*64+j)%1024)*50;
      fill(i,j,0,50);
      ellipse(i,j,10,10);
     
    }
  } */
  
  Gage.updatePixels();
  //mario_pic.updatePixels();
}


