

//HINT - Ctrl+T auto-formats nesting

Cell[] myCells = new Cell[99];

void setup() {
  size(500, 500, P3D);
  background(255);

  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
  //for loop - (define integer variable; while 'i' is less than the length of cell list; add one more to 'i')
}

void draw() {

  for (int i=0; i< myCells.length; i++) {
    //myCells[i].display();
    myCells[i].update();
  }
  myCells[0].location.x = 250;
  myCells[0].location.y = 250;
  myCells[0].isseed = true;

  //setting the location of the seed cell to the centre of the page



    for (int i=0; i< myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j< myCells.length; j++) {
        if (myCells[j].isseed) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d<=25) {
            //increased distance to counteract the decreased number of cells, resulting in longer lines 
            myCells[i].isseed = true;
            strokeWeight(0.5);
            stroke(0);
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
  
//then we construct it - using a 'constructor 
  
  Cell(){
  
    location = new PVector(random(500),random(500));
    //defines the new location by a vector with a random x and a random y
    dia = 2;
    isseed = false;
    cellred = 0;
    cellgreen = 0;
    cellblue = 0;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(0,213,255);
      stroke(0,213,255);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x,location.y,dia,dia);
  }
  void update(){
    if(isseed == false){
      velocity = new PVector(random(-8,8),random(-8,8));
      location.add(velocity);
    }
  }
}


  
  
    
  


