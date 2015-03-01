
/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Steve Rooth
 * Recreate image similar to the Vera Molnar example with 25 squares, 5 are red
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  //noLoop();
  frameRate(1);  // set the frame rate to 1 draw() call per second
  //randomSeed(hour() + minute() + second() + millis()); // creates random sequence that changes all the time
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // sets number of squares in rows and columns
  int red = 0;  //counter for red squares
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width/num - 10 );
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/16.0;
  float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        
        int gapx = (int) random(-1, 8); // select a random horizontal gap between each square
        int gapy = (int) random(-1, 8); // select a random vertical gap between each square
        
        int colournum  = (int) random(1,5); // randon number for colour selection, basically it is a 1 in 5(or other number if inserted) chance to be red
             
        if (colournum == 1 && red < 5) {
         
        fill(190, 180); // shadow
        rect(gapx * (i+1) + cellsize * i + offsetX, gapy * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        fill(247, 57, 57, 180); // rectangle
        rect(gapx * (i+1) + cellsize * i, gapy * (j+1) + cellsize * j, cellsize, cellsize);
       
        int (red++);
        println("red squares =", red );
        }
        else {
          fill(190, 180); // shadow
        rect(gapx * (i+1) + cellsize * i + offsetX, gapy * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        fill(124,64,64,180); // rectangle
        rect(gapx * (i+1) + cellsize * i, gapy * (j+1) + cellsize * j, cellsize, cellsize);
        }
      }
    }
} //end of draw 



