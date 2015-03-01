
/*
 * Creative Coding MOOC 
 * https://www.futurelearn.com/courses/creative-coding/
 * Week 2, 03-01 - 25 Squares Exercise
 * by bk
 *
 */


void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(1); // commented out so it makes holding down A much more fun
  randomSeed(hour() + minute() + second() + millis());
}

void draw() {
  
  background(255, 100, 140); // clear the screen

  int num = 5;   // select a random number of squares each frame
  int gap = 10; // select a random gap between each square

  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;


  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {

      float offset = random(-15, 15);
      float fillc = (random(4, 10));
      if (fillc <= 5) {
        fill(160, 40, 160, 200);
      } else {
        fill(255, 170, 170, 200);
      }
      rect(gap * (i+1) + cellsize * i - offset, gap * (j+1) + cellsize * j - offset, cellsize, cellsize);
    }
  }
} //end of draw 

void mousePressed(){
  filter(INVERT);
}



