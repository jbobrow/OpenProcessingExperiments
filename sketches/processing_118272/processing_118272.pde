
Cell[]myCells= new Cell[700];


void setup() {
  size(500, 500);
  background(255);
  for (int i=0; i <myCells.length; i++) {
    myCells[i]=new Cell();
  }
  myCells[0].isseed=true;
}


void draw () {
  // background(255);
  for (int i=0; i<myCells.length;i++) {
    //not able to see the cells 
    // myCells[i].display();
    myCells[i].update();
  }
  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed== false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed==true) {
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);
          if (d<11) {
            myCells[i].isseed=true;
            //creat lines with random colour and random stokeweight
            strokeWeight(random(1,6));
            stroke(random(0,255),random(0,255),random(0,255));
            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
          }
        }
      }
    }
  }
}

class Cell {
  PVector location= new PVector(); //creating vectors
  PVector velocity=new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;

  Cell() {
    location = new PVector(random(500), random(500));
    dia=5;
    isseed=false;
    cellred=225;
    cellblue=225;
    cellgreen=225;
    lineweight=0.1;
  }

  void display() {
    strokeWeight(lineweight);
    if (isseed==true) {
      fill(255, 0, 0);
    }
    if (isseed==false) {
      fill(cellred, cellgreen, cellblue);
    }

    ellipse(location.x, location.y, dia, dia);
  }
  void update() {
    if (isseed==false) {
      velocity = new PVector(random(-10, 10), random(-10, 10));
      location.add(velocity);
    }
  }
}



