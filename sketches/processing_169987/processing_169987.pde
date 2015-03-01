
import processing.pdf.*;
float a = 1;
float b = 1;
float c = 150;

Cell[] myCells = new Cell[5000];


void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
PVector middle = new PVector(250,250);
myCells[0].location.set(middle);
myCells[0].isseed  = true;

}

void draw() {

  myCells[0].isseed = true;
  for (int i=0; i<myCells.length; i++) {
    myCells[i].update();
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length;j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 10) {
            myCells[i].isseed = true;

            
            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
           a = a +0.01;
           b = b+0.005;
           c = c-0.21;
            stroke(0,b); 
        }
        }
      }
    }
  }

}

void keyPressed() {
  if (key=='e') {
    endRecord();
  }
}


class Cell {

  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;


  Cell() {

    location = new PVector(random(500), random(500));
    dia = 40;
    isseed = false;
    cellred = random(0, 255);
    cellgreen = random(0, 255);
    cellblue = random(0, 255);
    lineweight = 10;
  }

  void display() {
    stroke(255,0,0);
    if (isseed == true) {
      fill(cellred, 200, 0);
       

      
    }
    if (isseed == false) {
      fill(100, 255, 100);
    }
    ellipse(location.x, location.y, dia, dia);
    
  }
  void update() {


    if (isseed == false) {
      velocity = new PVector(random(-1, 1), random(-1, 1));
      location.add(velocity);
    }
  }
}







