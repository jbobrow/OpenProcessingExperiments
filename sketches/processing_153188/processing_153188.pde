
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
color[] alphapixelColors;
int scanLine;  // vertical position
int printNext;

void setup() {
  size(900, 600);
  myImg = loadImage("nasaImage.jpg");
  printNext = 1;
  pixelColors = new color[10];
  alphapixelColors = new color[10];
  scanLine = 150;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i<10; i++) {
    pixelColors[i] = myImg.get(15+i*35, scanLine);
  }
  for (int i=0; i<10; i++) {
    alphapixelColors[i] = myImg.get(15+i*35, scanLine);
  }
   
   for (int a = 0; a < 10; a++){
   alphapixelColors[a] = alphapixelColors[a] & 0xccffffff;
   
   }
  // draw the sampled pixels as vertical bars
  for (int i=0; i< 10; i++) {
    noStroke();
    fill(pixelColors[i]);
    rect(i*30, 0, 30, 600);
   rect( 0, i*30, 600, 30);
  }
   for (int i=9; i>= 0; i--) {
    noStroke();
    fill(alphapixelColors[i]);
    rect(300 + (9 - i)*30, 0, 30, 600);
    rect(0, 300 + (9 - i)*30,  600, 30);
  }

  // draw the image
  image(myImg, 600, 0);

  // increment scan line position every second frame
  if (frameCount % 2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
 /*   println("pixelColors = "); 
    
    println("0 " + hex(pixelColors[0]) + "  1 " + hex(pixelColors[1]) + "  2 " + hex(pixelColors[2]) + 
    "3 " + hex(pixelColors[3]) + "4 " + hex(pixelColors[4]));
    println("5 " + hex(pixelColors[5]) + "  6 " + hex(pixelColors[6]) + "  7 " + hex(pixelColors[7]) + 
    "8 " + hex(pixelColors[8]) + "9 " + hex(pixelColors[9]));
    println("5 " + hex(alphapixelColors[5]) + "  6 " + hex(alphapixelColors[6]) + "  7 " + hex(alphapixelColors[7]) + 
    "8 " + hex(alphapixelColors[8]) + "9 " + hex(alphapixelColors[9]));
   */
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=0; i<10; i++) {
    stroke(255, 0, 0);
    noFill();
    ellipse(600 + 15 + i*30, scanLine, 5, 5 );
  }
}
/*
 * keyReleased function
 *
 * called automatically by Processing when a keyboard key is released
 */
void keyReleased() {

 
  if (key == 's') {

   String filename = "W4_03_c2" + printNext + ".jpg";
  saveFrame(filename);
 //  saveFrame("W4_03_c2" + printNext + ".jpg");
  println(" saved "  + filename); 
  printNext++;
  }
  
}


