
//  Title: Polygonal Grid
//  Description: 
//  Date Started: 2012 Jun
//  Last Modified: 2012 Jun
//  http://www.asymptoticdesign.org/
//  This work is licensed under a Creative Commons 3.0 License.
//  (Attribution - NonCommerical - ShareAlike)
//  http://creativecommons.org/licenses/by-nc-sa/3.0/
//
//  In summary, you are free to copy, distribute, edit, and remix the work.
//  Under the conditions that you attribute the work to me, it is for
//  noncommercial purposes, and if you build upon this work or otherwise alter
//  it, you may only distribute the resulting work under this license.
//
//  Of course, the conditions may be waived with permission from the author.

//-----------------Globals
int numRows = 10;
int numColumns = 10;
PVector[][] gridArray = new PVector[numColumns+1][numRows+1];
int delta = 10;
boolean locked = false;
int pointX, pointY;

//-----------------Setup
void setup() {
  size(512,512);
  background(0);
  stroke(255);
  fill(0,8);
  smooth();
  frameRate(30);
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      gridArray[i][j] = new PVector(i*width/numColumns+random(10),j*height/numRows+random(10));
    }
  }
  strokeWeight(1);
  for(int i = 0; i < numColumns; i++) {
    for(int j = 0; j < numRows; j++) {
      //point(gridArray[i][j].x,gridArray[i][j].y);
      beginShape(QUADS);
      vertex(gridArray[i][j].x,gridArray[i][j].y);
      vertex(gridArray[i+1][j].x,gridArray[i+1][j].y);
      vertex(gridArray[i+1][j+1].x,gridArray[i+1][j+1].y);
      vertex(gridArray[i][j+1].x,gridArray[i][j+1].y);
      endShape();
    }
  }
}

//-----------------Main Loop
void draw() {
  background(0);
  for(int i = 0; i < numColumns; i++) {
    for(int j = 0; j < numRows; j++) {
      //point(gridArray[i][j].x,gridArray[i][j].y);
      beginShape(QUADS);
      vertex(gridArray[i][j].x,gridArray[i][j].y);
      vertex(gridArray[i+1][j].x,gridArray[i+1][j].y);
      vertex(gridArray[i+1][j+1].x,gridArray[i+1][j+1].y);
      vertex(gridArray[i][j+1].x,gridArray[i][j+1].y);
      endShape();
      strokeWeight(10);
      point(gridArray[i][j].x,gridArray[i][j].y);                  
      strokeWeight(1);
    }
  }
}

//-----------------Interactions
void keyPressed() {
  if (key == ' ') {
      saveFrame("polymesh-###.png");
  }
}

void mousePressed() {
  for(int i = 0; i < numColumns+1; i++) {
    for(int j = 0; j < numRows+1; j++) {
      if ((mouseX < gridArray[i][j].x + delta && mouseX > gridArray[i][j].x - delta) && ((mouseY < gridArray[i][j].y + delta && mouseY > gridArray[i][j].y - delta))) {
        locked = true;
        pointX = i;
        pointY = j;
      }
    }
  }
}

void mouseDragged() {
  if(locked) {
    gridArray[pointX][pointY].x = mouseX;
    gridArray[pointX][pointY].y = mouseY;
  }
}

void mouseReleased() {
  locked = false;
}

//-----------------Defined Functions

//-----------------Defined Classes

