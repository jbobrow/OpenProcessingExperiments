
 /* Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 *  amended by Peter Bailey as part of week two monash uni course in processing
 */



void setup() {

  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(3);  // set the frame rate to 1 draw() call per second
}

void draw() {

color R=color(204,74,20);
color B=color(random(150,156), random(5, 10), 15);
background(164,227, 170); // clear the screen to grey
  
 
  //int num = (int) random(3, 12);   // select a random number of squares each frame
  int num=(int)5;
  //control for odd five red

  int offset = 4;
  //int gap = (int) random(-35, 10); // select a random gap between each square
  float gap;
  // calculate the size of each square for the given number of squares and gap between them

 //set cell to use with grid allowing for spacing
  float cellsize =115;
  // print out the size of each square
  //println("cellsize = " + cellsize);

    for (int i=0; i<num; i++) {
          
          int countRed = (int) random(5);
  
      for (int j=0; j<num; j++) {
       fill(24);
        rect(gap * (i+1) + cellsize * i - offset, gap * (j+1) + cellsize * j - offset, cellsize, cellsize);
      
      
        //map random value of 5 to get a different coloured square
       
       if ((countRed==j))
        
        {
              //fill red rectangles
              fill(R); // rectangle
         
          }
          else
          {
             //fill brown rectangles
       
              fill(B, 100); // rectangle
    
         }
        //create rectangle with offset 
        gap = random(2,5);
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
       } 
      } 
    
    
    
    
} //end of draw 
