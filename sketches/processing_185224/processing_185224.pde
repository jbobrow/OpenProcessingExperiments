
/*------------------------------
 "Schotter v.1 (Inspired by Georg Nees)"
 Recreation of my own version of Georg Nees' "Schotter" plotter drawing.
 
 Created February 9, 2015
 By Megan Cattey
 megancattey@gmail.com
 
 Created for Art 3001 - Data Visualization
 BFA in Art and Technology
 The Ohio State University
 http://www.openprocessing.org/classroom/4626
 ------------------------------*/


int x = 10;
int y = 10;
float r = 0;
int s = 25;            //square size
float orig = 0;
int rows = 25;        //number of rows
int columns = 15;    //number of columns
int margin = s*2;    //margin of the 




void setup() {
  size ((columns*s+margin*2), (rows*s+margin*2));
  background(255);
  noLoop();
  rectMode(CENTER);      //uses center instead of left corner
  fill(0, 0, 128, 60);  //semi-transparent blue fill
}

void draw() {
  for (int j = 10; j < height-margin*2; j = j+s) {        //columns
    r = r + .08;                                          //rotational increment
    for (int i = 10; i < width-margin*2; i = i+s) {      //rows
      pushMatrix(); 
      translate(i, j);                                    //saves origin space as first box space
      rotate(radians(random(-r*8, r*8)));                //random rotations
      rect(0+margin, 0+margin, s, s);
      popMatrix();
    }
  }
}

