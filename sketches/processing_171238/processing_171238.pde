


Cell[] myCells = new Cell[2500];//increasing the number of cells to create intresting patterns


void setup() {
  background(0);
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
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
          if (d <25) {
            myCells[i].isseed = true;
            stroke(0, 150, 255, 100);
            strokeWeight(.5);
            line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
           
          }
        }
      }
    }
  }

}



class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
   
  
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
    velocity = new PVector(random(-10,10),random(-10,10));
    location.add(velocity);
    }
    
  }
}


  
  
    
  


