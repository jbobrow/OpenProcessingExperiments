
/*
 * Creative Coding
 * Week 2, "Recreate" Vera Molnar's 25 Squares
 * by Cristian Balan
 * 
 * 
 * By pressing 'r' a new version is created
 * By pressing 's' the current version is saved
 *
 * 
 */

void setup() {
  randomSeed(hour()+minute()+second()+millis());
  size(500, 500);
  background(190);
  rectMode(CENTER);
  noStroke();
  fill(#A61700,170); //base colour with transparency
}
int redraw=1; //controls if we need another version
void draw() {
  //the "constants" of our drawing
  /*squares size, the gap between them and the outer margin are calculated from 
   the window size so it's easy to change everything */
  int squares=5; //total number of squares is squares^2
  float margin=(float)width*0.07;
  float gap=(float)width*0.01;
  float squareSize=((float)width-2*margin-(squares-1)*gap)/squares;

  //random x and y shift
  float xShift;
  float yShift;
  int redSquares=(int)random(.12*squares*squares, .28*squares*squares); //set the number of red squares
  boolean isRed; //decide wich square became red

  // if first draw() loop OR 'r' key pressed redraw everything; else just check for key press
  switch(redraw) {
  case 1:
    //start drawing the squares: two nested loops
    for (int i=0; i<squares; i++) {
      for (int j=0; j<squares; j++) {

        //setup of the random stuff
        xShift=random(-gap, gap);
        yShift=random(-gap, gap);
        isRed=boolean(round(random(1)));

        /*if next square is gona be red: change the fill, draw the square, decrement the number of 
         red squares left, change back the fill and continue */
        if (isRed && redSquares>0) {
          fill(#CF070C, 170);
          rect(margin+squareSize/2+squareSize*j+xShift+j*gap, margin+squareSize/2+squareSize*i+yShift+i*gap, squareSize, squareSize);
          redSquares--;
          fill(#A61700, 170);
        }

        //else draw the brown square and continue
        else {
          rect(margin+squareSize/2+squareSize*j+xShift+j*gap, margin+squareSize/2+squareSize*i+yShift+i*gap, squareSize, squareSize);
        }
      }
    }
    redraw=0;
    break;
  case 0:
    //waiting for a key to be press
    if (keyPressed) {
      switch(key) {
      case 's':
        saveFrame("molnar####.jpg");
        break;
      case 'r':
        background(150);
        redraw=1;
        break;
      }
    }
    break;
  }
}


