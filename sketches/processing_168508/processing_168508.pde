

Cell[] myCells = new Cell[200];


void setup() {
  size(500, 500);
  background(255);//to leave trail
  for (int i = 0; i < myCells.length; i ++) {
  myCells[i] = new Cell();
  }
}

void draw() {
 
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
   
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
  
    xlocation = random(0,500);//set random location
    ylocation = random(0,500);
    dia = random(5,25);
    isseed = false;
    cellred = random(255);//set random location
    cellgreen = random(100);
    cellblue = random(100);
    lineweight = random(1);
  }
  
  void display(){
    stroke(lineweight);
    fill(cellred,cellgreen,cellblue);
    ellipse(xlocation, ylocation, dia,dia);
  }
  void update(){
    xlocation = xlocation+random(-1,1);
    ylocation = ylocation+random(-1,1);
    
  }
}


