
/*
 * Creative Coding
 * Week 2, 03 -  25 Squares Exercise
 * by Carlos Yusim
 */

int num = 5;   // select a random number of squares each frame
int gap = (int) random(5, 10); // select a random gap between each square
float randX;
float randY;


void setup() {

  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);
}


void draw() {

  background(#eeeeee);
  randomSeed( hour() + minute () + millis());

  
  float cellsize = ( width - (num + 1) * gap ) / (float)num;

  for (int i=0; i<num; i++) {
    
    for (int j=0; j<num; j++) {

      randX = random(4);
      randY = random(4);
      
      //Color selection
      float darkCellProb = 0.2;
      
      float cellColor = random(1);
      
      if(cellColor > darkCellProb) {
        
        fill(231, 76, 60,200);
        
      } else {
        
        fill(192, 57, 43,230);
      }
      
              
      rect(gap * (i + randX) + cellsize * i, gap * (j + randY) + cellsize * j, cellsize, cellsize);
    }
  }
} 

