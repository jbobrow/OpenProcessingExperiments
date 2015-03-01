
/*
 * Creative Coding
 * Week 2, 03 - n squares ~ 
 * by Indae Hwang and Jon McCormack 
 * completely revised by Jessica Fenlon [drawclose] 
 * 
 */
 
 //variables
 int numSq = (24); // sets number of squares
 int canvasSize = 600; //size of canvas
 int borderPercent = 2; // %age size of border each edge
 int borderSize; 
 int cellsize; //size of each square
 int gapSize; //size of gap between squares
 int xPosn;
 int yPosn; 
 int randX;
 int randY;
 int redd;

void setup() {
  size(canvasSize, canvasSize);
  rectMode(CORNER);
  noStroke();
  borderSize = int(canvasSize * borderPercent / 100);
  frameRate(6);  // set the frame rate to 1 draw() call per second
  cellsize = int((canvasSize - (2*borderSize) - (gapSize*(numSq-1) ) ) / numSq);
}

void draw() {
  background(255); // black ground
    
  for (int i=0; i<numSq; i++){
   for (int j=0; j<numSq; j++){
  
  randX = int(random(20))-10 ;
  randY = int(random(20))-10 ;
 
  xPosn = int(borderSize + (cellsize+gapSize)*i + randX );
  yPosn = int(borderSize + (cellsize+gapSize)*j + randY );

        rect( xPosn , yPosn , cellsize, cellsize);
        
  redd = (int) random(12); // choose a colour for each square at random
      if (redd<8) {
        fill(255, 200);
        stroke(255, 200);
      } else if (redd==8) {
        fill(59, 99, 216, 200);
        stroke(59, 99, 216, 200);
      }  else if (redd==9) {
        fill(58, 87, 170, 200);
        stroke(58, 87, 170, 200);
      } else if (redd==10) {
        fill(116, 140, 209, 200);
        stroke(116, 140, 209, 200);
      }  else if (redd==11) {
        fill(112, 125, 165, 200);
        stroke(112, 125, 165, 200);
      }

   } // end for (j)
  } // end for (i)
  
    // Save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("drawclose-Vera-Molnar-.jpg");
  }

} //end of draw 

