
 /*
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // select a random number of squares each frame
  int gap = (int) random(5, 10); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - 75 - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  // println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/32.0;
  float offsetY = cellsize/32.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        gap = (int) random(5, 10); // select a random gap between each square
        float randomangle = random (PI / 18); // random angle 0-5degrees
        
        fill(140, 180); // shadow
          quad(gap * (i+1) + cellsize * i + offsetX + 25, gap * (j+1) + cellsize * j + offsetY +25,
               gap * (i+1) + cellsize * i + offsetX + 25 + cellsize * cos(randomangle), gap * (j+1) + cellsize * j + offsetY +25 + cellsize * sin(randomangle),
               gap * (i+1) + cellsize * i + offsetX + 25 + cellsize * cos(randomangle) - cellsize * sin(randomangle),  gap * (j+1) + cellsize * j + offsetY +25 + cellsize * sin(randomangle) + cellsize * cos(randomangle),
               gap * (i+1) + cellsize * i + offsetX + 25 - cellsize * sin(randomangle), gap * (j+1) + cellsize * j + offsetY +25 + cellsize * cos(randomangle));
//        rect(gap * (i+1) + cellsize * i + offsetX +25, gap * (j+1) + cellsize * j + offsetY +25, cellsize, cellsize);
        
        //randomise the colour with 1 in 5 being red the rest brown
        int filler = (int) random(100);
        if (filler < 20){
          fill(255, 57, 57, 180); // rectangle
          quad(gap * (i+1) + cellsize * i + 25, gap * (j+1) + cellsize * j +25,
               gap * (i+1) + cellsize * i + 25 + cellsize * cos(randomangle), gap * (j+1) + cellsize * j +25 + cellsize * sin(randomangle),
               gap * (i+1) + cellsize * i + 25 + cellsize * cos(randomangle) - cellsize * sin(randomangle),  gap * (j+1) + cellsize * j +25 + cellsize * sin(randomangle) + cellsize * cos(randomangle),
               gap * (i+1) + cellsize * i + 25 - cellsize * sin(randomangle), gap * (j+1) + cellsize * j +25 + cellsize * cos(randomangle));
//          rect(gap * (i+1) + cellsize * i + 25, gap * (j+1) + cellsize * j +25, cellsize, cellsize);
        } else {
          fill(147, 85, 53, 180); // rectangle
          quad(gap * (i+1) + cellsize * i + 25, gap * (j+1) + cellsize * j +25,
               gap * (i+1) + cellsize * i + 25 + cellsize * cos(randomangle), gap * (j+1) + cellsize * j +25 + cellsize * sin(randomangle),
               gap * (i+1) + cellsize * i + 25 + cellsize * cos(randomangle) - cellsize * sin(randomangle),  gap * (j+1) + cellsize * j +25 + cellsize * sin(randomangle) + cellsize * cos(randomangle),
               gap * (i+1) + cellsize * i + 25 - cellsize * sin(randomangle), gap * (j+1) + cellsize * j +25 + cellsize * cos(randomangle));

//          rect(gap * (i+1) + cellsize * i + 25, gap * (j+1) + cellsize * j + 25, cellsize, cellsize);         
        }
      }
    }
} //end of draw 



