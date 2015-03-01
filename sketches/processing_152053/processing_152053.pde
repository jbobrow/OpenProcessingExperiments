
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

/*
 * From the workshop at Monash University in FutureLearn
 * Adjustemets by Pablo Rosero 
 * www.pablorosero.com
 */

float xRandom;
float yRandom;
int colSel;
PImage img, img2;

void setup() {
  size(600, 600);
  rectMode(CORNER);
  stroke(255);
  strokeWeight(3);
  frameRate(1);  // set the frame rate to 1 draw() call per second
  img = loadImage("test3.png");
  img.resize(112, 112);
}



void draw() {

  background(235, 235, 235); // clear the screen to grey

  int num = 5;   // select a random number of squares each frame
  int gap = 6; // select a random gap between each square

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  // print out the size of each square
  println("cellsize = " + cellsize);

  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;


  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {

      xRandom = random(-10, 10);
      yRandom = random(-10, 10);

      colSel = (int)random(20);

      if (colSel > 0 && colSel < 3) {
        fill(155, 194, 163);
      }
      else if (colSel > 3 && colSel < 6) {
        fill(random(120), 168, 145+(i*10));
      }

      else if (colSel > 6 && colSel < 9) {
        fill(random(89), 143, 132+(i*10));
      }

      else if (colSel > 9 && colSel < 12) {
        fill(random(63), 111, 117+(i*10));
      }

      else if (colSel > 12 && colSel < 15) {
        fill(random(41), 71, 91+(i*10));
      }

      else if (colSel > 15 && colSel < 19) {
        fill(random(24), 36, 66+(i*10));
      }

      else {
        fill(155, 194, 163);
      }

      // rectangle
      rect(gap * (i+1) + cellsize * i+xRandom, 
           gap * (j+1) + cellsize * j+yRandom, 
           cellsize, cellsize);
      //image(img2, gap * (i+1) + cellsize * i+xRandom, gap * (j+1) + cellsize * j+yRandom);
      image(img, gap * (i+1) + cellsize * i+xRandom, 
                 gap * (j+1) + cellsize * j+yRandom);
    }
  }
} //end of draw 

void keyPressed() {

  // save your drawing when you press keyboard 's'
  if (key == 's') {
    saveFrame("yourName.jpg");
  }

  if (key == 'c') {
    noLoop();
  }
  if (key == 'v') {
    loop();
  }
}



