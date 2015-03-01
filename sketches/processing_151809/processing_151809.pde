
/*
 * Creative Coding
 * Week 2, 03 - n rectangles
 */

void setup() {
  size(800, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.33);  // set the frame rate to 1 draw() call per 3 seconds
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = (int) random(3, 12);   // select a random number of rectangles each frame
  int gap = (int) random(5, 50); // select a random gap between each rectangle
  
  // calculate the size of each square for the given number of rectangles and gap between them
  float cellsizeA = ( width - (num + 1) * gap ) / (float)num; //width calculation
  float cellsizeB = (height - (num + 1) * gap * height/width) / (float)num; //height calculation
  
  // print out the size of each rectangle, the number of rectangles, the gap and the width/height ratio
  println("cellsize w x h = " + cellsizeA, "x", cellsizeB);
  println("number =",num,"gap =",gap);
  println(cellsizeA/cellsizeB);
  
  // calculate shadow offset
  float offsetX = cellsizeA/16.0;
  float offsetY = cellsizeB/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(140, 180); // shadow
        rect(gap * (i+1) + cellsizeA * i + offsetX, gap * (j+1) + cellsizeB * j + offsetY, cellsizeA, cellsizeB);

        fill(247, 57, 57, 180); // rectangle
        rect(gap * (i+1) + cellsizeA * i, gap * (j+1) + cellsizeB * j, cellsizeA, cellsizeB);
      }
    }
} //end of draw 



