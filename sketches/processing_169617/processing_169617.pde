
//import processing.pdf.*;

//Constructing an array

//Assigning different values to new Cell 
//the cells' density is changed
Cell[] myCells = new Cell[299];                      //array syntax   datatype[] var


void setup() {
   background(255);
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();                        //array syntax var[element] = value     
  }   
//beginRecord(PDF, "Patternvector3e.pdf");  
}


void draw() {
  //beginRaw(PDF, "pattern1.pdf");
  for (int i=0; i< myCells.length; i++) {
   myCells[i].display();
    myCells[i].update();
  }
  
  myCells[0].isseed = true;               
 
  for (int i=0; i<myCells.length; i++) {
    if(myCells[i].isseed == false){
      for(int j=0; j<myCells.length;j++){
        if(myCells[j].isseed == true){
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
            if(d < 20){                                
              myCells[i].isseed = true;
          
            }
          }
        }
      }
    }
//endRaw();
  }

//void keyPressed(){
  //if(key=='e'){
    //endRecord();
 // }
//}




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
    lineweight = 0.01;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(255,0,0);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x, location.y, dia,dia);
  }
  void update(){
    if(isseed == false){
    velocity = new PVector(random(-8,8),random(-8,8));
    location.add(velocity);
    }
    
  }
}


  
  
    
  


