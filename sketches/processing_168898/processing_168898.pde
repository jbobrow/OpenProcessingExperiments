
Cell[] myCells = new Cell[999];

Cell myCell;

void setup(){

size(500,500);
  for(int i =0; i < myCells.length; i++){
myCells[i] = new Cell();

  }
}

void draw(){
  background(255);
  for(int i =0; i<myCells.length; i++){
 myCells[i].display();
 myCells[i].update();
  }
}


// cell class

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

  // constructor
  
  
  Cell(){
    
    xlocation = 250 ;
    ylocation = 250;
    dia =10;
    isseed = false;
    cellred = 200;
    cellgreen = 5;
    cellblue = 4;
    lineweight=0.5;
    
  }
  
  void display(){
    
    stroke(lineweight);
        float r=random(a);
        float r2=random(b);
        float r3=random(c);

    fill(r,r2,r3);
    
    ellipse(xlocation, ylocation, dia, dia);
  }
  
  //larger movement range
  void update(){
    xlocation = xlocation+random(-9,10);
    ylocation = ylocation+random(-10,10);
  }
}



