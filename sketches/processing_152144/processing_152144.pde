
/*
 * Creative Coding
 * Week 2, 03-01 - 25 squares exercise
 * by Oscar Moreno
 * 
 */

void setup() {
  size(600, 600);
  rectMode(CORNER);
  noStroke();
  frameRate(0.5);  // set the frame rate to 1 draw() call per two second
  randomSeed(hour()+minute()+second()+millis()); //set a new random seed each time program run
  
}


void draw() {

  background(180); // clear the screen to grey
  
  int num = 5;   // set up a number of squares each frame
  int gap = 3; // set up a gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (num + 1) * gap ) / (float)num;
  
    for (int i=0; i<num; i++) {
      for (int j=0; j<num; j++) {
        int col = (int) random(10); //set up a weight difference between the 2 colors
        if (col < 8) { //have aprox. 80% brown cells 
          fill(190,60,60,150); // brown
        } else {
          fill(255,40,40,150); // red
        }
        rect((gap * (i+1) + cellsize * i)+random(-8,8), (gap * (j+1) + cellsize * j) + random(-8,8), cellsize, cellsize);
      }
    }
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }
} //end of draw 

