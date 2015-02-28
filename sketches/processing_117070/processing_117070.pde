
Cell[]myCells = new Cell[1000];
Cell myCell;
int a;// if using a variable in [] must be integer
float v = 1;

void setup() {
  colorMode(HSB,360,100,100,100);
  background(0);
  a = 0;
  size (500, 500);
  for (int i = 0; i< myCells.length; i++) {//creates 
    myCells[i]= new Cell();
  }
  myCells[a].isseed = true;
}

void draw() {
  
  for (int i=0; i< myCells.length; i++) {//declare for loop, 
  //  myCells[i].display(); by taking out this disply function you do not draw the cells, just the lines drawn between each cell center
    myCells[i].update();
  }
    for(int i = 0; i<myCells.length; i++){
      if (myCells[i].isseed == false){ //  ignore if cell[i] is true
      for(int j=0; j<myCells.length; j++){
        if (myCells[j].isseed == true){ //assuming the cell [i] is not a seed, the loop then looks through the myCell array again for seeds. 
         float d;
         d= PVector.dist(myCells[i].location, myCells[j].location);//distance function between the non-seed[j] and seed[i] 
         if (d<12){
           myCells[i].isseed = true; // if seed is less than 10 away then myCells[i] is now a seed. This means it changes color and stops moving. 
      
         line(myCells[i].location.x,myCells[i].location.y,myCells[j].location.x,myCells[j].location.y); // draws a line from the center of the cell
         
        }
       }
      }
     }
    }//diagramatic drawings of the site... how could we use this? 
 
  }


class Cell {

  //  float xlocation;
  // float ylocation;
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellHue, cellSat, cellBri, cellAlph;
  float lineweight;

  Cell() {
    location = new PVector(random(500), random(500));
    dia = 5;
    isseed=false;
    cellHue = 360;
    cellSat = 1;
    cellBri = 100;
    cellAlph = 100;
    lineweight = 1;
     
  }
  void display() {
    
    
    if (isseed == true) {
    }
    if (isseed == false) {
    }
    ellipse(location.x, location.y, dia, dia);
  }

  void update() {
    cellSat = cellSat +1;
      if (cellSat >= 100){
        cellSat = 1;
      }
    strokeWeight(lineweight);
    stroke(cellHue, cellSat, cellBri, cellAlph);
    
if (isseed == false){
    velocity = new PVector(random(-v,v), random(-v, v)); // may be good to look at this. 
    location.add(velocity);
    v=v;
   
  }
}
}

