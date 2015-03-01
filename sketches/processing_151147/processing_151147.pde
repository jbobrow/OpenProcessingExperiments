
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
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gap = 15;//(int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = 102; //( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  //println("cellsize = " + cellsize);
  
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        // calculate shadow offset
        float offsetX = random(6.375);
        float offsetY = random(6.375);        
        
        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        float r = random(5);
        if (r>4){
          fill(random(200,255), random(50), 57, 180);} // rectangle
        else {
           fill(247, 57, 57, 180);} // rectangle
        rect(gap * (i+1) + cellsize * i + random(10), gap * (j+1) + cellsize * j + random(10), cellsize+random(i), cellsize-random(i));
      }
    }
    
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("25squares.jpg");
  }
} //end of draw 

