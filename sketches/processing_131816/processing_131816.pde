
// magic miror squares 
//
// by ittyBittyArtist
// february 4, 2014
/************ a fun little video filter - I like how it transitions motion :).*************/

import processing.video.*;

Capture cam;
PImage pixelImage;  
                   
                                        
float scalar = 2.2;
int offsetX = -10;
int offsetY = -10;


void setup(){

  size(displayWidth, displayHeight); // full screen
  noStroke();
  
  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture."); // this relies on a camera.  no camera, no fun :(
    exit();
  } 
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    cam = new Capture(this, cameras[0]);
    cam.start();
    
    println("cam width " + cam.width);
  }
}


void draw(){
  
  // we are going to divide the drawing up into regions based on the pixels... 
  if (cam.available() == true) {
    cam.read();
  }
  
  pixelImage = cam;
  
  if(pixelImage.width != 0){
    scalar =1.4*(displayWidth/pixelImage.width);
  }
  //println("scalar" + scalar);
  int fiveTally = 0;
 
  int[] pVue;
  int tolerance = 1000;
 
  //image(pixelImage, 0, 0);
  
  float pixelDistort = 50;
  
  
  for(int m = 0; m<2500; m++){
    
    int randX = round(random(0, (pixelImage.width-40)/5))*5;
    int randY = round(random(0, (pixelImage.height-40)/5))*5;
    float randSize = 1.5;
    
    int c = pixelImage.get(randX, randY);
    
    drawRect(round(randX+random(0,5)), round(randY+random(0,5)), randSize, round(c));
    
  }
  
}

void drawRect(int xVal, int yVal, float w, color c){
    
  fill(c);
  rect((xVal*scalar)+offsetX, (yVal*scalar)+offsetY, w*scalar, w*scalar);
       
}
