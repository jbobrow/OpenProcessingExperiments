
/*
 * Creative Coding
 * Week 2 exercise
 * 
 */

void setup() {
  randomSeed(hour() + minute() + second() + millis());
  size(820, 820);
  rectMode(CORNER);
  noStroke();
  noLoop();
}


void draw() {

  background(180); // clear the screen to grey
  int num = 5;
  int gapx = 10;
  int gapy = 10;
  float cellsize = 150; 

    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {

        gapx = 10 + (int)random(-5, 5);
        gapy = 10 + (int)random(-5, 5);

        int colc = (int)random(0, 3);
        int red = 175;
        int green = 12;
        int blue = 12;
        
        if (colc == 0) {
          red = 230;
          green = 0;
          blue = 0;
        }
        
        fill(red, green, blue, 180); // rectangle
        rect(gapx * (i+1) + cellsize * i, gapy * (j+1) + cellsize * j, cellsize, cellsize);
      }
    }
    
    //saveFrame("squares.jpg");
} //end of draw 



