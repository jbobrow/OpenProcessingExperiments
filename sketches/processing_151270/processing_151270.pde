
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
  randomSeed(hour() + minute() + second() + millis());
}


void draw() {

  background(180); // clear the screen to grey
  
  int num =  5;

    for (int i=0; i<=num; i++) {
      for (int j=0; j<=num; j++) {
      
        int randColour = (int) random(2);
        
        if(randColour==1){
          fill(#F07E7E);
        }
        else{
          fill(#F05252);
        }
        
        int gap=(int) random(num+1);
        float cellsize = ( width - (num + 1) * gap ) / (float)num;
        rect((gap * (i+1) + cellsize * i), (gap * (j+1) + cellsize * j), cellsize, cellsize);
      }
    }
    
    if(keyPressed == true && key=='s'){
      saveFrame("myCheat.jpg");
    }
} //end of draw 



