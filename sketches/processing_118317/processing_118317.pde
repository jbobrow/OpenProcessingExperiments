
import processing.dxf.*;

boolean record;




class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
   
  
  Cell(){
  
    location = new PVector(random(500), random(500), random(500));
    dia = 5;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(255,0,0);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    line(location.x,location.y,location.z,location.x,(location.y+3),location.z);
    }
    //ellipse(location.x, location.y, location.z, dia,dia);
  }
  void update(){
    if(isseed == false){
    velocity = new PVector(random(-1,1),random(-1,1),random(-1,1));
    location.add(velocity);
    }
    
  }
}


  
  
    
  


Cell[] myCells = new Cell[20000];

void setup() {
  background(255);
  size(500, 500, P3D);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {

  if (record) {
    beginRaw(DXF, "output1.dxf");
  }
  
  myCells[0].isseed = true;
  for (int i=0; i<myCells.length; i++) {
    myCells[i].update();
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length;j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 20) {
            myCells[i].isseed = true;
            for (int k = 0; k < 10; k++) {
              strokeWeight(1);
              line(myCells[i].location.x, myCells[i].location.y, myCells[i].location.z, myCells[j].location.x, myCells[j].location.y, myCells[j].location.z);
            }
          }
        }
      }
    }
  }
  
  if (record) {
    endRaw();
    record = false;
  }
}


void keyPressed() {
  // Use a key press so that it doesn't make a million files
  if (key == 'r') {
    record = true;
  }
}

