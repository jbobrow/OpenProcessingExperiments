
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
    float[][] nudgeX = new float[5][5], nudgeY = new float[5][5];

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(20);  // set the frame rate to 1 draw() call per second
  int num = 5;
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      nudgeX[i][j] = 0;
      nudgeY[i][j] = 0;
    }
  }
  
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5; //(int) random(3, 12);   // select a random number of squares each frame
  int gap = 5; //(int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;

    
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        nudgeX[i][j] += random(-1,1);
        nudgeY[i][j] += random(-1,1);
        
        fill(0, 30); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX + nudgeX[i][j], gap * (j+1) + cellsize * j + offsetY + nudgeY[i][j], cellsize, cellsize);

        fill(247, 57+5*nudgeX[i][j], 57+5*nudgeY[i][j], 180); // rectangle
        rect(gap * (i+1) + cellsize * i + nudgeX[i][j], gap * (j+1) + cellsize * j + nudgeY[i][j], cellsize, cellsize);
      }
    }
    
      // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("squares.jpg");
  }
} //end of draw 

