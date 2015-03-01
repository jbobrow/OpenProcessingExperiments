
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This simple sketch demonstrates how to read pixel values from an image
 * It simulates a 10 pixel "scanner" that moves from the top to the bottom of the image
 * reading the colour values for 10 equally spaced points, then displaying those colours
 * as vertical bars on the left half of the screen.
 *
 */

PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position
int num;
boolean started;
void setup() {
  size(400, 600);
  myImg = loadImage("Janet.jpg");

 // pixelColors = new color[400];
  scanLine = 0;
 // smooth(1);
  
   // draw the image
 image(myImg, 0, 0);
  num = 0;
 // background(0);
 started = false;
 
}

void draw() {
 //wait to draw picture
 
 //println("started = " + started + frameCount);
  if (frameCount > 100 ){
    if (started == false){;
    
    background(0);
    started = true;}
    
   pixelDraw(num);}}
 

    
   

void pixelDraw (int shift){
  println(num);

  // read the colours for the current scanLine
  for (int i=0; i<400; i++) {
   // for (int j=0; j<600;  j++){
   int pixelHue = myImg.get(i, scanLine);
        int r = pixelHue;
   r = pixelHue>>(16-num*8) & 0xFF;
  // println(" r before" + r + "i = " + i );
    if (r > 80) {
      
    
     if (num == 0){ fill (255,0,0,5);}
     if (num == 1){ fill (0,255,0,5);}
     if (num == 2){ fill (0,0,255,5);}
      noStroke();
      ellipse (i,scanLine,5,5);
    }
   }
  
    


  
  

 

//  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;}
//  }
//
  if (scanLine > height) {
    scanLine = 0;
     num++;
    if (num ==3) {num = 0;
 }
  }
//
//  // draw circles over where the "scanner" is currently reading pixel values
//  for (int i=0; i<10; i++) {
//    stroke(255, 0, 0);
//    noFill();
//    ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
//  }

}



