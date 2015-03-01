

Cell[] myCells = new Cell[2000];

float a = 50;

float b = 200;

void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  background(10,250,200);
  //fill (a,b,b);
  //noFill();
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
    //a = 0;
    //b = 0+200;
  
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
  float a = 200;
  float b = 200;
  float c = 200;
  float d = random(a);
//then we construct it - using a 'constructor 
  
  Cell(){
  
    xlocation = random(a,500);
    ylocation = random(b,d);
    dia = 5;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
    a = a+80;
    b = b+20;
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


  
  
    
  


