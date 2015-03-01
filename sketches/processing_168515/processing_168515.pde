
import processing.pdf.*;//exporting vector graphics

Cell[] myCells = new Cell[200];


void setup() {
  size(500, 500,PDF, "processing.pdf");
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
    myCells[i].checkedges();
     println("Finished.");
  exit();
  }
}

//set variables
class Cell{
  
  float xlocation;
  float ylocation;
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;

  
  Cell(){
  
    xlocation = random(0,500);//random location
    ylocation = random(0,500);
    dia = 5;
    isseed = false;
    cellred = random(255);//random colours
    cellgreen = random(255);
    cellblue = random(255);
    lineweight = random(1);
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(xlocation, ylocation, dia,dia);
  }
  void update(){
    xlocation = xlocation+random(2);
    ylocation = ylocation+random(-2,2);
  }
  void checkedges() {
  if ((xlocation > (width)) || (xlocation< 0)) {
    xlocation=(2);
  }
}
}


