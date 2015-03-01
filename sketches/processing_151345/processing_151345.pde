
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  noLoop ();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  color R=color(random(255),0,0);
  color B=color(random(50), random(90), 0);
  background(180); // clear the screen to grey
  
  int num = (int) 5;   // select a random number of squares each frame // picked 5 squares per row and column
  int gap = (int) 10; // select a random gap between each square // picked from the allocated random numbers given

 
  // calculate the size of each square for the given number of squares and gap between them // 600 pixels for 5 squares that have 6 gaps in between including borders so we did 600 - 6*10 to arrive at 540 then divided by 5 squares to arrive at the figure of 108 pixels per size of square//
  float cellsize = 108;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;

    for (int i=0; i<num; i++) {
       int countRed = (int) random(5);
      for (int j=0; j<num; j++) {

         if ((countRed==j))
         
        {
              //fill red rectangles
tint(255, 126);
              fill(R, 254); // rectangle
          
          }
          else
          {
             //fill brown rectangles
            tint(255, 126);
              fill(B, 150); // rectangle
     
         }
        //fill(#761919); // shadow
        //rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);// to be changed//
       

        //fill(247, 57, 57, 200); // rectangle
        //rect(gap * (i+1) + cellsize * i + random(-10,10), gap * (j+1) + cellsize * j + random(-10,10), cellsize, cellsize); //shadows were removed from above lines and now I am left with only red moving squares
      }
    }
} //end of draw 

