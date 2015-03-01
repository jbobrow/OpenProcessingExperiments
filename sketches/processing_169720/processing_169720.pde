

Cell[] myCells = new Cell[2000];

float a = 0;

float b = 0;

void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  background(200,200,250);
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
  
    xlocation = random(250,250);
    ylocation = random(250,250);
    dia = 5;
    isseed = false;
    cellred = r3;
    cellgreen = r2;
    cellblue = r;
    lineweight = 0.1;
    r3 = a+80;
    r2 = b+20;
  }
  
  void display(){
    stroke(lineweight);
    fill(r,r2,r3);
    ellipse(xlocation, ylocation, dia,dia);
  }
  void update(){
    xlocation = xlocation+random(-8,8);
    ylocation = ylocation+random(-8,8);
  }
}


  
  
    
  


