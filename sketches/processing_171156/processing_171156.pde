
//create an array

Cell[] myCells = new Cell[300];//decreasing the number of cells to create intresting patterns


void setup() {
  background(0);
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
     PVector middle = new PVector(500,500);//creating an inter-connected pattern rather then going random
myCells[0].location.set(middle);
myCells[0].isseed  = true;

}
}

void draw() {
  myCells[0].isseed = true;
  for (int i=0; i<myCells.length; i++) {
    myCells[i].update();
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length;j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 100) {
            myCells[i].isseed = true;
            stroke(150,150,150,100);
            strokeWeight(1);
            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
           
          }
        }
      }
    }
  }
}
  

//this is the cell classe. We defnie it in two parts. First we delare its variables:
class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
   
  //then we construct it - using a 'constructor'
  
  Cell(){
  
    location = new PVector(random(500), random(500));
    dia = 5;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = .5;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(255,255,0);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x, location.y, dia,dia);
  }
  void update(){
    if(isseed == false){
    velocity = new PVector(random(-3,3),random(-3,3));
    location.add(velocity);
    }
    
  }
}


  
  
    
  


