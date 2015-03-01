


void setup() {
  size(600, 600);
  rectMode(CORNER);
  randomSeed(hour() + minute() + second() + millis());
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(180); // clear the screen to grey
  
  //int num = (int) random(1, 100);   // select a random number of squares each frame
  int num = 5; // number of squares each frame
  //int gap = (int) random(-10, 10); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) ) / (float)num;
  
  // print out the size of each square
  //println("cellsize = " + cellsize);
  
  // calculate shadow offset
  //float offsetX = cellsize/16.0;
  //float offsetY = cellsize/16.0;
 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        float offsetX = (int) random(-5, 5);
        float offsetY = (int) random(-5, 5);
        //fill(140, 180); // shadow
        //rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

        fill(247 + offsetX *20 , 57, 57, 180); // rectangle
        rect(offsetX * (i+1) + cellsize * i, offsetY * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
} //end of draw 



