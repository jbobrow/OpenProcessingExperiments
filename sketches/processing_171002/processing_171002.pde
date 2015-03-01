
Cell[] myCells = new Cell[99];

float a = 0;

float b = 0;

void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  //background(a,b,255);
  fill (a,b);
  noFill();
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
    a = 0+5;
    b = 0+3;
  
  }
}

//this is the cell classe. We defnie it in two parts. First we delare its variables:

class Cell{
  
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  float a = 0;
  float b = 0;
  float c = 0;
  
//then we construct it - using a 'constructor 
  
  Cell(){
  
    xlocation = random(a,500);
    ylocation = random(b,500);
    dia = 15;
    isseed = false;
    cellred = 250;
    cellgreen = 250;
    cellblue = 250;
    lineweight = 0.01;
    a = a+0.8;
    b = b+0.5;
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(xlocation, ylocation, dia,dia);
  }
  void update(){
    xlocation = xlocation+random(-3,3);
    ylocation = ylocation+random(-3,3);
  }
}


  
  
    
  


