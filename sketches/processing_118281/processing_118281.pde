
Cell[] myCells= new Cell[1000];


void setup() {
  size(500, 500);
  background(255);
  //  for (int i=0; i <myCells.length; i++) {
  //    myCells[i]=new Cell();
  //  }

  for (int i=0; i<333 ;i++) {  // . length function
    myCells[i]=new Cell(100, 200, 139, 0, 0);
  }
  for (int i=333; i<500 ;i++) {  // . length function
    myCells[i]=new Cell(200, 300, 234, 100, 0);
  }
  for (int i=500; i<666 ;i++) {  // . length function
    myCells[i]=new Cell(300, 400, 0, 100, 0);
  }
  for (int i=666; i<1000 ;i++) {  // . length function
    myCells[i]=new Cell(100, 400, 113, 198, 113);
  }
  myCells[200].isseed=true;
  myCells[400].isseed=true;
  myCells[600].isseed=true;
  myCells[800].isseed=true;
}


void draw () {
  //background(255);
  for (int i=0; i<myCells.length;i++) {
    //not able to see the cells 
    myCells[i].display();
    myCells[i].update();
  }
  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed== false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed==true) {
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);
          if (d<9) {
            myCells[i].isseed=true;
            //creat lines with random colour and random stokeweight
            strokeWeight(random(1, 3));
            stroke(myCells[j].cellred, myCells[j].cellgreen, myCells[j].cellblue );
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

  Cell(int x, int y, int red, int gr, int bl) {
    location = new PVector(random(x-100,x+100), random(y-100,y+100));
    dia=5;
    isseed=false;
    cellred=red;
    cellgreen=gr;
    cellblue=bl;
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



