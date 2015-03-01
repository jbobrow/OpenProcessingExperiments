
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 */


int num;
int s1ze;


void setup() {
  size(600, 600);
  rectMode(CORNER);
  stroke(50);
  frameRate(1);  // set the frame rate to 1 draw() call per second
  num =15;
  s1ze = width/num;

}


void draw() {
  scale(.5);
  translate(300,300);
  float offset = random(1);
  int gap = 10;
  float cellsize = (width-(num+1)*gap) / (float)num;
  background(200); // clear the screen to grey
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        float pickC = random(1); 
        offset = random(-20);
        fill(0);
        rect(gap*(i+1)+cellsize * i + offset+(offset*-1),gap*(j+1)+cellsize * j + offset+(offset*-1), cellsize,cellsize, 10);
        
        fill(247, 57, 57, 255); // rectangle
        if (pickC > .85) {
          fill(#2184B7, 200);
          }
        else if (pickC < .25) {
        fill(#F57F00);
          }
        else {
        fill(#eeeeee);
        } 
        rect(gap*(i+1)+cellsize * i + offset,gap*(j+1)+cellsize * j + offset, cellsize,cellsize, 10);
          }
       }
    
} //end of draw 



