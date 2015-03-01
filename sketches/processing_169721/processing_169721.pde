

Cell[] myCells = new Cell[50];

float a = 0;

float b = 0;

void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  background(255);
  //fill (200,b,b);
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
    float r = random(a);
    float r2 = random(b);
    float r3 = random(c);
  
//then we construct it - using a 'constructor 
  
  Cell(){
  
    xlocation = random(0,500);
    ylocation = random(0,500);
    dia = 5;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
    fill(r,r2,r3);
    ellipse(xlocation, ylocation, r, r3);
  }
  void update(){
    xlocation = xlocation+random(-3,3);
    ylocation = ylocation+random(-3,3);
  }
}


  
  
    
  


