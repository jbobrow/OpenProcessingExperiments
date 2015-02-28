
// code adapted and modified from http://www.generative-gestaltung.de, P_4_3_1_01.pde and P_2_1_2_01.pde
//Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni

/**
 * pixel mapping. each pixel is translated into a new element
 * 
 * MOUSE
 * position x/y        : various parameters (depending on draw mode)
 * 
 * KEYS
 * 1-2                 : switch draw mode
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
boolean savePDF = false;

PImage img;
PImage bimg;

int drawMode = 1;



void setup() {
  size(667, 500); //size should be multiple of img width and height
  smooth();
  img = loadImage("bowl3.jpg");
  bimg = loadImage("100_3323.jpg");
  
 
  println(img.width+" x "+img.height);
  
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  background(bimg);//set undistorted bowl picture as the background

//mouse response
  float mouseXFactor = map(mouseX, 0,width, 0.05,1);
  float mouseYFactor = map(mouseY, 0,height, 0.05,1);

  for (int gridX = 0; gridX < img.width; gridX++) {
    for (int gridY = 0; gridY < img.height; gridY++) {
      // grid position + tile size
      float tileWidth = width/ (float)img.width;
      float tileHeight = height/(float)img.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;
      
       

      // get current color
      color c = img.pixels[gridY*img.width+gridX];
      // greyscale conversion
      int greyscale =round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);

      switch(drawMode) {
      
      // 1. Causes bowl to drip
      case 1:
        // pixel color to fill, greyscale to ellipse size
       color barColor = color(255, 20);
        int barAlpha = 60;
        float w6 = map(greyscale, 0,255, 25,0);
        int drip = 10; drip++;//establishes size of drip
        stroke(barColor, barAlpha);//determines color of stroke and glow of bars
        strokeWeight(6);//how widespread the glow is
        fill(c);
        
        rect(posX, posY, w6 * mouseXFactor, w6 * mouseXFactor*drip); //downward drip
        break;
        
        //2. Causes bowl to overflow
        case 2:
        color circleColor = color(255, 20);//bottom bar stroke colour
        int circleAlpha = 60;//transparency
        float w7 = map(greyscale, 0,255, 25,0);
        int updrip = -10; updrip--;//establishes size of drip
        stroke(circleColor, circleAlpha);//determines color of stroke and glow of bars
        strokeWeight(6);//how widespread the glow is
        fill(c);
        rect(posX, posY, w7 * mouseXFactor, w7 * mouseXFactor*updrip); //upward drip
       
        break;
        
      }

    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}  


  
//putting in the original image as comparison  
void mousePressed(){
  PImage orig;
  orig = loadImage("100_3323.jpg");
  image(orig,0,0);
  
  
  
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == '1') drawMode = 1;
  if (key == '2') drawMode = 2;
   if (key == '3') drawMode = 3;
}



// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}






























