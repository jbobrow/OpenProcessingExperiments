

Cell[] myCells = new Cell[16000];
float a = 0;
float b = 5;

void setup() {
  background(55,0,20);
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
PVector middle = new PVector(250,250);
myCells[0].location.set(middle);
myCells[0].isseed  = true;

}

void draw() {
  //background(255);
  for (int i=0; i< myCells.length; i++) {
    //myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d; 
          d = PVector.dist(myCells[i].location, myCells[j].location); 
          if (d<=7) {
            myCells[i].isseed=true;
             line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
             stroke(100,a,b);
             
              a = a+0.02;
              b = b+0.05;
             
          }
          
        }
      }
    }
  }
}

//this is the cell classe. We defnie it in two parts. First we delare its variables:

class Cell {

  PVector location = new PVector();
  PVector velocity = new PVector();

  //float xlocation;
  //float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;


  //then we construct it - using a 'constructor 

  Cell() {

    // xlocation = random(0,500);
    // ylocation = random(0,500);
    location = new PVector(random(500), random(500));
    dia = 8;
    isseed = false;
    cellred = 250;
    cellgreen = 250;
    cellblue = 250;
    lineweight = 0.1;
  }

  void display() {
    stroke(lineweight);
    if (isseed == true) {
      fill(20, 80, 0);
    }
    if (isseed == false) {
      fill(cellred, cellgreen, cellblue);
    }
    ellipse(location.x, location.y, dia, dia);
  }
  void update() {

    if (isseed == false) {
      velocity = new PVector(random(-50, 50), random(-50, 50));
      location.add(velocity);
    }
    //xlocation = xlocation+random(-30,3);
    //ylocation = ylocation+random(-3,30);
  }
}







