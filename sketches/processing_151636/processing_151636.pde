
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Modified by Matthias Harvey
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
  noLoop();
  //frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(day() + hour() + second() + millis());
  background(222); // clear the screen to grey
  
  
}


void draw() {
  int num = 5;   // select a random number of squares each frame
  int gap = 10; // select a random gap between each square
  float r = 0;
  
  color c;
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = 106;
  
  // calculate shadow offset
  float offsetX = cellsize/40.0;
  float offsetY = cellsize/40.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        r = random(1);
        gap = (int) random(6, 13);
        c = color(30, 180); // shadow
        rect2(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize, c);
        
        if(r <= 0.8)
        {
          c = color(130, 63, 55, 255); // rectangle  
        } else
        {
          c = color(175, 31, 30, 255); 
        }
        rect2(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize, c);
        
      }
    }  

} //end of draw 

void rect2(float x1, float y1, float w, float h, color c)
{
  int a = (c >> 24) & 0xFF;
  int r = (c >> 16) & 0xFF;  // Faster way of getting red(argb)
  int g = (c >> 8) & 0xFF;   // Faster way of getting green(argb)
  int b = c & 0xFF;          // Faster way of getting blue(argb)
  float n = 0;
  float n2 = 0;
  
  for(int y = (int)y1; y <= y1+h; y++)
  {
    for(int x = (int)x1; x <= x1+w; x++)
    {
      
      n = random(1);

      if(n >= 0.7) // 70 % of the time make the stroke darker by multiplying each component with n
        stroke(r*n,g*n,b*n,a);
      else stroke(r,g,b,a);
      
      point(x,y);       
    }
  }
  
  
}
