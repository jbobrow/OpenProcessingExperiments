
/*
 *Creative Coding
 *Week 2, 03 - Molnar's 25 squares copy
 *Copyright (c) P.J.Peruzzi
*/

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);  // set the frame rate to 1 draw() call per 2 seconds
}

void draw() {

  background(248,245,280); // clear the screen to blue/grey
  
  int num = 5; // specify 5 squares for each row
  int gap = 3; // select a standard gap between each square
  
  float sqsize = ( width - 50 - (num + 1) * gap ) / (float)num;

  for (int i=0; i<num; i++) { //start of for i loop
      for (int j=0; j<num; j++) { //start of for j loop
      
      int colour; //cast to force random to an int
      colour = (int) random(0,10); 
        
      if (colour <= 8) { //start of if
          fill(160,93,93,240);
        }//end of if
          else { //start of else
          fill(216,46,46,240);
        }//end of else      
        rect(25 + random (-8,8) + gap * (i+1) + sqsize * i, 25 + random (-8,8) + gap * (j+1) + sqsize * j, sqsize, sqsize);
     }//end of j loop
     }//end of for i loop
} //end of draw 


