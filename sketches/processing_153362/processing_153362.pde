

 //create a new image with interaction and shadow

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(#C4FFFE); // clear the screen to grey
  
  int num = (int) random(6, 12);   // select a random number of squares each frame
  int gap = (int) random(2, 20); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/8.0;
  float offsetY = cellsize/10.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        fill(#40463C); // shadow
       ellipse(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        fill(#640648); // ellipse
       ellipse(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 



