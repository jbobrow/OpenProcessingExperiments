

Cell[] myCells = new Cell[200];


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
    myCells[i].checkedges();
  }
}
void keyPressed(){
  save("processing.jpg");
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
  
    xlocation = random(0,500);//set random colours
    ylocation = random(0,500);
    dia = random(15);
    isseed = false;
    cellred = random(255);//set random colours
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
    xlocation = xlocation+random(-0.1,1);
    ylocation = ylocation+random(-0.1,1);
  }
  void checkedges() {
  if ((xlocation > (200)) || (xlocation< 0)) {
    xlocation=(xlocation+10);

  }
}
}



