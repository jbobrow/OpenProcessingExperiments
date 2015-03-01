
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
  size(600, 600, P3D);
  
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gap = 25; // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
  float colour = random(255);
  
    directionalLight(200, 200, 200, 0.5, 0.25, -1);
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        pushMatrix();
        float nudgeX = random(20)-10;
        float nudgeY = random(20)-10;
        float nudgeZ = random(100)-50;
        //translate(gap * (i+1) + cellsize * i + offsetX + nudgeX, gap * (j+1) + cellsize * j + nudgeY, 0);
        translate(gap * (i+1) + cellsize * i + offsetX + (cellsize/2) + nudgeX , gap * (j+1) + cellsize * j + (cellsize/2) +  nudgeY , nudgeZ); 
       
        int r = (int)random(10);
        if(r==1)
        {
        fill(200, 50, colour, 200);
        }
        else
        {
          fill(200, 200, colour, 200);
        }
        box(cellsize);
        popMatrix();
      }
    }
} //end of draw 



