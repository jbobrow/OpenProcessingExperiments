
/*****************************************
 * Assignment <<< hw3 >>
 * Name:         <<< Eric Remoroza >>>
 * Course:       CSC 103 - Creative Computing - Fall 2014
 * Submitted:    <<< the date your submitted the assignment >>>
 * 
 * <<< Animation sketch - Rising Moon >>>
 *
***********************************************/



int z = 75;
void setup() {
 size(500, 500);
 stroke(0);
 frameRate(30); 
}
void draw() {
  background(0, 0, 0);
  noStroke();
  fill(250, 250, 210);
  z = z - 1;
  if (z<0) 
    z = width;  
  ellipse(250, z, width-250, width-250); { //rising moon
  fill(0, 240, 128);
  triangle(450, 0, 425, 425, 0, 450); //hills
  rect(50, 250, 350, 500);
  rect(90, 200, 400, 400);
  rect(150, 90, 340, 340);
  }
}

  
  


