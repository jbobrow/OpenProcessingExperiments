
//variables
 int numSq = (5); // sets number of squares
 int canvasSize = 600; //size of canvas
 int borderPercent = 5; // %age size of border each edge
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
  background(255); // white ground
    
  for (int i=0; i<numSq; i++){
   for (int j=0; j<numSq; j++){
  
  randX = int(random(20))-10 ;
  randY = int(random(20))-10 ;
 
  xPosn = int(borderSize + (cellsize+gapSize)*i + randX );
  yPosn = int(borderSize + (cellsize+gapSize)*j + randY );

        rect( xPosn , yPosn , cellsize, cellsize);
        
  redd = (int) random(11); // choose a colour for each square at random
      if (redd<8) {
        fill(196, 68, 53, 200);
        stroke(196, 68, 53, 200);
      } else if (redd>8) {
        fill(173, 31, 31, 200);
        stroke(167, 18, 18, 200);
      }

   } // end for (j)
  } // end for (i)
  
    // Save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("drawclose-Vera-Molnar-.jpg");
  }

} //end of draw 

