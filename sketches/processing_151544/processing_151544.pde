
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
  randomSeed(hour()+minute()+second()+millis());
  rectMode(CORNER);
  noStroke();
  frameRate(1);
}

int x = 0;
void draw() {
  
  background(180);
  
  int saveNumber = 0;
  float z = 0;
  float y = 0;  
  int num = (int) 5;
  int gap = (int) 5;
  
  /* calculate the size of each square for the given number of squares and gap between them */
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  /* calculate shadow offset */
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

          z = random(6);
          y = random(6);
        
        fill(random(100), 180); // shadow
        rect(gap * (i+z) + cellsize * i + offsetX, gap * (j+y) + cellsize * j + offsetY, cellsize, cellsize);

        fill(random(125, 255), random(15), random(25), 180); // rectangle
        rect(gap * (i+z) + cellsize * i, gap * (j+y) + cellsize * j, cellsize, cellsize);
      }
    }
    
    /* Key stroke functions. */
    if (keyPressed == true)
    switch(key)
    {
      case 's':
          saveFrame("yourName" + saveNumber + ".jpg");
          break;
     
      case 'r':
          background(180);
          break;
  
      default:
          println("This key is not mapped");
          break;
    }
    
}





