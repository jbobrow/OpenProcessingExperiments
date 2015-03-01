
 /* In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 *
 */
 
void setup() {
  randomSeed(day()+hour()+minute()+millis());
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);  // set the frame rate to 1 draw() call per second
}
 
 
void draw() {
 
  background(219,241,255); // pale bg
   
  int num = (int) (5);   // select 5 squares each frame
  int gap = (int) (5); // select a random gap between each square
   
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
   
  // print out the size of each square
  println("cellsize = " + cellsize);
   
  // calculate shadow offset
  float offsetX = cellsize/20;
  float offsetY = cellsize/20;
  
  for (int i=num-1; i>=0; i--) {
    for (int j=num-1; j>=0; j--) {
         
      int gapX = (int) random(gap*1.5);
      int gapY = (int) random(gap*1.5);
 fill(50,50,50,100);
 rect(gap * i + gapX + cellsize * i+offsetX, gap * j + gapY + cellsize * j+offsetY, cellsize, cellsize);
 
 //if ( gapX < .1) {
   //switch(style) {
    //case 0:
     //fill(0); // shadow
     // rect(gap * i + gapX + cellsize * i + offsetX, gap * j + gapY + cellsize * j + offsetY, cellsize, cellsize);
 //}   
      //*else// 
      if ((int) random(6) == 0) {
        fill(175, 41, 4);  // rectangle
      }
      else {
        fill(147, 0, 20); 
      }
      rect(gap * i + gapX + cellsize * i, gap * j + gapY + cellsize * j, cellsize, cellsize);
    }
  }
 
  if (keyPressed) {
    switch(key) {
      case 's': {
        noLoop();
        saveFrame("blocks.jpg");
        break;
      }
      case 'q': {
        exit();
        break;
      }
    }
  }
     
} //end of draw


