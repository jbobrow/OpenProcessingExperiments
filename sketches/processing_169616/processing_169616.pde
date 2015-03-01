
//constructing an array


Cell[] myCells = new Cell[1000];   //Assigning different values to new Cell, the cells' density is changed


void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
  myCells[0].location.set(250,250);           //assigning an initial position
}

void draw() {
  background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = true;
  
for(int i=0; i<myCells.length; i++){
 if(myCells[i].isseed == false){
   for(int j=0; j<myCells.length; j++){  
    if(myCells[j].isseed == true){        // (myCells[j].isseed) it's the same
     float d;
      d = PVector.dist(myCells[i].location, myCells[j].location);
      if (d<=10){                      //changing "d" value in order to modify cells' distances attraction
        myCells[i].isseed=true;
      }
    }
   }
  } 
 }
}


//Declare Class variables
class Cell{
  
  //declaring a vector object for location and other for velocity
  PVector location = new PVector();      
  PVector velocity = new PVector();
  
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  

//Construct class  
  Cell(){
    
    //assigning values to location
    location = new PVector(random(500), random(500));
    dia = 7;
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
    }
    ellipse(location.x, location.y, dia,dia);
  }
  void update(){
   
   if(isseed == false){
    velocity = new PVector(random(-5, 5), random(-5, 5));
   location.add(velocity);
   }
}
}



