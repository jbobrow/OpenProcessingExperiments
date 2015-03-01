
/*
 * Creative Coding
 * Week 2, Molnar
 * by RR
 * Copyright (c) 2014 RR
 *
 * Attempts to reproduce the Molnar squares
 *
 */

void setup() {
  randomSeed(hour()+minute()+second()+millis());
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  noLoop();
  
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // number of squares each frame
  int initX = 117;
  int initY = 117; //these are the size of the squares
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
       
        // calculate square offset
        float tempLo;
        float tempHi;
        if(i == 0  || i == num-1 || j == 0 || j == num-1){
          if(i == 0 || j == 0){
            tempLo = 0;
            tempHi = 10;
          }
          else
          {tempLo = -10;
          tempHi = 0;
        }}
        else
          {tempLo = -10;
          tempHi = 10;
        }
  float offSetX = random(tempLo, tempHi);
  float offSetY = random(tempLo, tempHi); 
  
  //Colour change
  if((i == 0 && (j == 1 || j == 2)) || ( i == 2 && (j == 0 || j == 4)) || (i == 4 && j  == 4)){
    fill(224, 32, 32, 180);}
    else {
      fill(185, 79, 79, 180);
    }
        rect(initX * j + offSetX, initY * i + offSetY, 108, 108);
      }
    }
} //end of draw 



