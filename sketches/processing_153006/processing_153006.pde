
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This is a version of Wk2 random squares with Wk4 One Pixle Movie  This version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops and fills them with the scanned pixels of an imported image.  
 *
 
 * 
 */
 PImage myImg;
color[] pixelColors;
int scanLine;  // vertical position

void setup() {

  size(600, 600);
    rectMode(CORNER);
  noStroke();
  saveFrame ();
 frameRate (1);
  myImg = loadImage("seascape.jpg");

  pixelColors = new color[20];
  scanLine = 0;
  smooth(4);
  }


void draw() {

  background(#E0E5FC); 
  
 
  
 int num = 9;   // select a random number of squares each frame
   int gapx = 0 ;
   int gapy = 0 ;

  
  
 //calculate the size of each square for the given number of squares and gap between them
float cellsize = ( width - (num + 1) * num ) / (float)num;
 
 gapx = 0;
 gapy = 0;
  // print out the size of each square
  println("cellsize = " + cellsize);
  
   // read the colours for the current scanLine
  for (int i=0; i<20; i++) {
    pixelColors[i] = myImg.get(17+i*20, scanLine);
  }

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        
     
        fill(pixelColors[i]); // rectangle
           rect(gapx + random(-25,25) + cellsize *i, gapy + random (-25, 25) + cellsize * j, cellsize, cellsize);}
           
     // draw the image
// image(myImg, width/2, 0);

  // increment scan line position every second frame
  if (frameCount %2 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
// for (int i=0; i<10; i++) {
//    stroke(255, 0, 0);
//    noFill();
//   ellipse(width/2 + 17 + i*35, scanLine, 5, 5 );
//  }
                   
      }
    }      

   //end of draw 
   void keyPressed(){
    // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') 
    saveFrame("randomsquares.jpg");
  }

    


 



