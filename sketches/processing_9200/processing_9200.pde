
  /*could do this--
  int xPos1=10;
  int yPos1=55;
  int xPos2=10;
  int yPos2=55;
  or..like this:-->  */
  
int[] xPos = {10, 55, 93};
  
  
void setup () {
  // println(xPos[0]);  this will output #10 as #10 is in the 0 position
  for (int i=0; i<3; i++) {
  ellipse (xPos[i], 10, 5, 5);
  }
}

void draw () {
   
}

