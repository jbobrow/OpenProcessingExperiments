
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by me!
 *
 *recreation of Vera Molna 25 squares 
 */

void setup() {
  size(600, 620);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
  randomSeed(hour() + minute() + second() + millis());
}

void draw() {

  background(200); // clear the screen to grey
  int num = 5;
  // calculate the size of each square for the given number of squares
  float cellsize = ( width - (num + 10) ) / (float)num;
  // print out the size of each square
  println("cellsize = " + cellsize);

    //for (int i=0; i<num; i++) {
    for (int i=num-1; i>-1; --i) {
      //for (int j=0; j<num; j++) {
      for (int j=num-1; j>-1; --j) {
         // set gap distance between squares
         int gap = (int) random(-5, 5);
         // set offset for each square
         float xOffset = random(3 , 9);
         float yOffset = random(3, 9);
         // use to set a random square to red
         int blackSheep = int(random(25));
         float xCoord = (gap * (i+1) + cellsize * i) + xOffset;
         float yCoord = (gap * (j+2) + cellsize * j) + yOffset;
        if (blackSheep > 13 && blackSheep < 16)
          {fill(200, 10, 10, 210);}  // red squares
        else
          {fill(100, 10, 10, 210);} // brown squares
        rect(xCoord, yCoord, cellsize, cellsize);
        //loop to introduce grain effect in each square
        for (int k=0; k<3000; k++){
          float grainX = random(cellsize);
          float grainY = random(cellsize);
          fill(20, 20, 20);
          ellipse(xCoord + grainX, yCoord + grainY, 1, 1);      
         }  
      }
    }
} //end of draw 



