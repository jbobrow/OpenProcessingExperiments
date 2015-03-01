
void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(#050505); // clear the screen to grey
  
  int num = (int) random(5, 5);   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/9.0;
  float offsetY = cellsize/19.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(#072BDB, 180); // shadow
        rect(gap * (i+2) + cellsize * i + offsetX, gap * (j+2) + cellsize * j + offsetY, cellsize, cellsize);

        fill(247, 57, 57, 180); // rectangle
        rect(gap * (i+2) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 
