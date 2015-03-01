

Cell[] myCells = new Cell[10000];


void setup() {
  size(1000, 500);
 
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
   background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
    myCells[i].align();
  }
}

void mousePressed(){
  
  save("export4.jpeg");
  
}
//this is the cell classe. We defnie it in two parts. First we delare its variables:

class Cell{
  
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  float x=0;
  
//then we construct it - using a 'constructor 
  
  Cell(){
  
    xlocation = random(0,1000);
    ylocation = random(0,1000);
    dia = random(5,30);
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
    fill(random(cellred+mouseX,0),random(cellgreen-mouseY,0),random(cellblue-mouseX,0),120);
    ellipse(xlocation, ylocation, dia,dia);
    x=x+1;
  }
  void update(){
    xlocation = xlocation+random(-5,5);
    ylocation = ylocation+random(-10,10);
  }
  void align(){
    if ((xlocation>200)||(xlocation<100)){
    xlocation = xlocation+random(-3,3);
    }
     if ((ylocation>200)||(ylocation<100)){
    ylocation = ylocation+random(5,10);
    }
}


  }
  
    



