

Cell[] myCells = new Cell[999];


void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
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
  
//then we construct it - using a 'constructor 
  
  Cell(){
  
    xlocation = random(0,500);
    ylocation = random(0,500);
    dia = 10;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
     float r=random(a);
        float r2=random(b);
        float r3=random(c);

    fill(r,r2,r3);
    ellipse(xlocation, ylocation, dia,dia);
  }
  void update(){
    xlocation = xlocation+random(-5,5);
    ylocation = ylocation+random(-5,5);
  }
}


  
  
    
  


