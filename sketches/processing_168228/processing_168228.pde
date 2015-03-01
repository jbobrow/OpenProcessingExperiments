
//setting up an array (increasing the nimber of arraies)
Cell[] myCells= new Cell[90];
Cell myCell;

void setup() {
 size(500,500);
for(int i=0; i<myCells.length;i++){ 
myCells[i]= new Cell();
}
}

void draw(){
  background(255);
  //array
  for(int i=0;i<myCells.length;i++){
    //unit drawn
  myCells[i].display();
  //new location
  myCells[i].update();
  }
}

//this is the cell classe. defined in two parts, declairing variables first

class Cell{
  
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  
  // construct it with a constructor
  Cell(){
    xlocation=random(0,500);
    ylocation=random(0,500);
    //random diameter
    dia=random(20);
    isseed=false;
    //randomly changing colours and lineweights
    cellred=random(200);
    cellgreen=random(200);
    cellblue=random(200);
    lineweight=random(3);
  }
 //sets up a small circle 
  void display(){
    stroke(lineweight);
    fill(cellred, cellgreen, cellblue);
    ellipse(xlocation, ylocation, dia,dia);
  }
  //location change
  void update(){
    //increased range of movement
    xlocation=xlocation+random(-2,2);
    ylocation=ylocation+random(-2,2);
  }
  
  
}


