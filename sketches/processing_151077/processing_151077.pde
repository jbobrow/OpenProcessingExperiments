

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
 * 
 */

void setup() {
  size(620, 620);
  rectMode(CORNER);
  noStroke();
  frameRate(10);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(200); // clear the screen to grey
  
  float r = random(220,255);
  float g = random(220, 255);
  float b = random(0,20);
  int num = 7;   // select a random number of squares each frame
  int gap = random(2, 5); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/12.0;
  float offsetY = cellsize/12.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(r,g,b, 180); // shadow
        stroke(255,255,0);
        rect(gap * (i+1) + cellsize * i + offsetX - random(4, 14), gap * (j+1) + cellsize * j + offsetY + random(14, 20), cellsize/2, cellsize);
        
        noStroke();
        fill(0,0,0, 90); // rectangle
        rect(gap * (i+2) + cellsize * i - random(4), gap * (j+1) + cellsize * j - random(2, 20), (cellsize- random(4))/4, cellsize+ random(4));
      }
    }
    if (keyPressed == true) {
    switch( key ) {
      case 's':
        saveFrame("yourName.jpg");
        break;
      case 'r':
        background(255);
        break;
      case 'q':
        exit();
        break;
      default:
        println("Unknown key command: ", key);
    } // end switch
}
} //end of draw 



